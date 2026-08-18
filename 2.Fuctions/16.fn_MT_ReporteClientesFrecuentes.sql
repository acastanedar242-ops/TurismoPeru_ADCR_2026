-- Generar un reporte de clientes frecuentes (Reservas, Pagos, Clasificación).

CREATE OR ALTER FUNCTION ADCR.fn_MT_ReporteClientesFrecuentes
(
 @IdCliente INT
)
RETURNS @Resultado TABLE (
    TotalReservas INT,
    TotalPagado DECIMAL(10,2),
    Categoria VARCHAR(50)
)
AS
BEGIN
    DECLARE @CantReservas INT = 0;
    DECLARE @SumaPagos DECIMAL(10,2) = 0;
    DECLARE @Cat VARCHAR(50);

    -- 1. Obtenemos las reservas
    SET @CantReservas = ADCR.fn_CantidadReservasxCliente(@IdCliente);

    -- 2. Calculamos los pagos
    SELECT @SumaPagos = ISNULL(SUM(P.monto), 0)
    FROM ADCR.pago P
    INNER JOIN ADCR.reserva R ON P.id_reserva = R.id_reserva
    WHERE R.id_cliente = @IdCliente;

    -- 3. Clasificamos al cliente
    SET @Cat = ADCR.fn_ClasificacionCliente(@IdCliente);

    -- 4. Insertamos el registro
    INSERT INTO @Resultado (TotalReservas, TotalPagado, Categoria)
    VALUES (@CantReservas, @SumaPagos, @Cat);

    RETURN;
END;
GO

-- Ejecución
SELECT 
    c.id_persona AS id_cliente,
    p.nombres + ' ' + p.apaterno AS NombreCliente,
    r.TotalReservas,
    r.TotalPagado,
    r.Categoria,
    GETDATE() AS Fecha_Consulta,
    ADCR.fn_NombreCompletoPersona(105) AS Estudiante 
FROM ADCR.cliente c
INNER JOIN ADCR.persona p ON c.id_persona = p.id_persona
CROSS APPLY ADCR.fn_MT_ReporteClientesFrecuentes(c.id_persona) r;
GO
