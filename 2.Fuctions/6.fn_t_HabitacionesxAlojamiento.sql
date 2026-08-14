--Habitaciones por alojamiento

CREATE OR ALTER FUNCTION ADCR.fn_HabitacionesAlojamiento
(
	@IdAlojamiento int
)
RETURNS TABLE
RETURN
(
	SELECT
	H.id_alojamiento,
	H.numero_habitacion,
	TH.nombrehabitacion,
	TH.capacidad_personas,
	H.precio_noche,
	H.estado,
	H.descripcion
	From ADCR.habitacion H 
	inner join ADCR.tipo_habitacion TH on 
	H.id_tipo_habitacion = TH.id_tipo_habitacion
	where id_alojamiento = @IdAlojamiento
);
GO

--Ejecucion
Select *,
	GETDATE() as Fecha_Consulta,
	ADCR.fn_NombreCompletoPersona(105) as Estudiante
FROM ADCR.fn_HabitacionesAlojamiento (2);
