SELECT
    i.object_id,
    OBJECT_NAME(i.object_id) AS tabla,
    i.index_id,
    i.name,
    i.type_desc,
    GETDATE() AS Fecha_Consulta,
    ADCR.fn_NombreCompletoPersona(105) AS Estudiante
FROM sys.indexes i
ORDER BY tabla;