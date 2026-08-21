--Vista de alojamientos.

CREATE OR ALTER VIEW ADCR.vw_alojamientos
AS
SELECT
	nombre,
	TA.Nombre_tipo,
	TA.Descripcion,
	GETDATE() AS Fecha_Consulta,
	ADCR.fn_NombreCompletoPersona (105) as Estudiante
FROM ADCR.alojamiento A
INNER JOIN ADCR.tipo_alojamiento TA ON
A.id_tipoalojamiento = TA.id_tipoalojamiento;

--Comprobacion

SELECT * FROM ADCR.vw_alojamientos;