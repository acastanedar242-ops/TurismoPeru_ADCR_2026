-- Consultar reservas por cliente y opcionalmente por estado.

CREATE OR ALTER FUNCTION ADCR.fn_MT_ReservasPorClienteYEstado(
    @IdCliente INT,
    @Estado VARCHAR(50) = NULL
)
RETURNS @Resultado TABLE (
    CodigoReserva VARCHAR(20),
    FechaInicio DATE,
    PrecioTotal DECIMAL(10,2),
    EstadoReserva VARCHAR(50)
)
AS
BEGIN
    IF @Estado IS NULL
    BEGIN
        INSERT INTO @Resultado (CodigoReserva, FechaInicio, PrecioTotal, EstadoReserva)
        SELECT R.codigo_reserva, R.fecha_inicio, R.precio_total, ER.nombre
        FROM ADCR.reserva R
        INNER JOIN ADCR.estado_reserva ER ON R.id_estado_reserva = ER.id_estado_reserva
        WHERE R.id_cliente = @IdCliente;
    END
    ELSE
    BEGIN
        INSERT INTO @Resultado (CodigoReserva, FechaInicio, PrecioTotal, EstadoReserva)
        SELECT R.codigo_reserva, R.fecha_inicio, R.precio_total, ER.nombre
        FROM ADCR.reserva R
        INNER JOIN ADCR.estado_reserva ER ON R.id_estado_reserva = ER.id_estado_reserva
        WHERE R.id_cliente = @IdCliente AND ER.nombre = @Estado;
    END

    RETURN;
END;
GO

-- Ejecución
--Nota: si deseamos que nos muestre sin considerar estado, cambiamos el estado de 'Anulada' a NULL
SELECT 
    c.id_persona AS id_cliente,
    p.nombres + ' ' + p.apaterno AS NombreCliente,
    res.CodigoReserva,
    res.FechaInicio,
    res.EstadoReserva,
    GETDATE() AS Fecha_Consulta,
    ADCR.fn_NombreCompletoPersona(105) AS Estudiante
FROM ADCR.cliente c
INNER JOIN ADCR.persona p ON c.id_persona = p.id_persona
CROSS APPLY ADCR.fn_MT_ReservasPorClienteYEstado(c.id_persona, 'Anulada') res;
GO

SELECT id_estado_reserva, nombre 
FROM ADCR.estado_reserva;