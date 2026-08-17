--Cantidad de reservas por cliente

CREATE OR ALTER FUNCTION ADCR.fn_CantidadReservasxCliente
(
	@IdCliente INT
)
RETURNS INT
AS
BEGIN
	DECLARE @Cantidad INT;
	
	SELECT 
		@Cantidad = COUNT(id_reserva)
	FROM ADCR.reserva
	WHERE id_cliente = @IdCliente;

	-- Retorna 0 si el cliente no tiene ninguna reserva
	RETURN ISNULL(@Cantidad, 0);
END;
GO

-- Ejecutar función
SELECT 
ADCR.fn_NombreCompletoPersona(1) AS Cliente, ADCR.fn_CantidadReservasxCliente(1) 
AS CantidadReservas, GETDATE() AS FechaConsulta,
ADCR.fn_NombreCompletoPersona(105) AS Estudiante;
GO