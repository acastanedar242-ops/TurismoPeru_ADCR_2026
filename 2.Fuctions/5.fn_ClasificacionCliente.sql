--Clasificación del cliente en función a la cantidad de reservas

CREATE OR ALTER FUNCTION ADCR.fn_ClasificacionCliente(
	@IdCliente INT
)
RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @Cantidad INT;
	DECLARE @Clasificacion VARCHAR(50);
	
	-- Llamamos a la función anterior para obtener el total de reservas
	SET @Cantidad = ADCR.fn_CantidadReservasxCliente(@IdCliente);

	-- Evaluamos la cantidad para asignar la categoría
	IF @Cantidad > 15
		SET @Clasificacion = 'Cliente VIP';
	ELSE IF @Cantidad > 5
		SET @Clasificacion = 'Cliente Frecuente';
	ELSE
		SET @Clasificacion = 'Cliente Nuevo';

	RETURN @Clasificacion;
END;
GO

-- Ejecutar función
SELECT 
ADCR.fn_NombreCompletoPersona(1) AS Cliente,
ADCR.fn_CantidadReservasxCliente(1) AS CantidadReservas,
ADCR.fn_ClasificacionCliente(105) AS Clasificación, GETDATE() AS FechaConsulta,
ADCR.fn_NombreCompletoPersona(105) AS Estudiante;
GO