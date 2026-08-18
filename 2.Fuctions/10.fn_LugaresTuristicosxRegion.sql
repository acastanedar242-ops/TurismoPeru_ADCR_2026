-- Lugares turísticos por región

CREATE OR ALTER FUNCTION ADCR.fn_LugaresTuristicosxRegion(
    @IdRegion INT
)
RETURNS TABLE
RETURN(
    SELECT
        LT.id_lugarturistico AS [Codigo Lugar],
        LT.nombre AS [Lugar Turistico],
        LT.descripcion AS [Descripcion],
        RG.nombreregion AS [Region],
		LT.calificacion AS Calificacion,
		LT.estado AS Estado,
		C.nombreciudad AS Ciudad,
		SR.nombresubregion AS Subregion
    FROM ADCR.lugar_turistico LT
    INNER JOIN ADCR.direccion_lugarturistico DLT ON DLT.id_lugarturistico = LT.id_lugarturistico
    INNER JOIN ADCR.direccion D ON DLT.id_direccion = D.id_direccion
    INNER JOIN ADCR.ciudad C ON D.id_ciudad = C.id_ciudad
    INNER JOIN ADCR.subregion SR ON C.id_subregion = SR.id_subregion
    INNER JOIN ADCR.region RG ON SR.id_region = RG.id_region
    WHERE RG.id_region = @IdRegion
);
GO

-- Ejecución
SELECT *,
    GETDATE() AS Fecha_Consulta,
    ADCR.fn_NombreCompletoPersona(105) AS Estudiante
FROM ADCR.fn_LugaresTuristicosxRegion(2); 
GO