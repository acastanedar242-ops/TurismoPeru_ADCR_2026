-- Clasificar las reservas de un cliente según su cantidad.

CREATE OR ALTER FUNCTION ADCR.fn_MT_ClasificacionReservasCliente(
    @IdCliente INT
)
RETURNS @Resultado TABLE (
    IdReserva INT,
    FechaReserva DATE,
    EstadoReserva VARCHAR(100),
    CantidadReservas INT,
    Clasificacion VARCHAR(50)
)
AS
BEGIN
    INSERT INTO @Resultado (
        IdReserva, 
        FechaReserva, 
        EstadoReserva, 
        CantidadReservas, 
        Clasificacion
    )
    SELECT
        R.id_reserva,
        R.fecha_reserva,
        ER.nombre,
        ADCR.fn_CantidadReservasxCliente(@IdCliente), 
        ADCR.fn_ClasificacionCliente(@IdCliente)      
    FROM ADCR.reserva R
    INNER JOIN ADCR.estado_reserva ER ON ER.id_estado_reserva = R.id_estado_reserva
    WHERE R.id_cliente = @IdCliente;

    RETURN;
END;
GO

-- Ejecución
SELECT *,
    GETDATE() AS Fecha_Consulta,
    ADCR.fn_NombreCompletoPersona(105) AS Estudiante
FROM ADCR.fn_MT_ClasificacionReservasCliente(1);
GO