SELECT
    SCHEMA_NAME(v.schema_id) AS esquema,
    v.name AS vista,
    v.create_date,
    v.modify_date,
    GETDATE() AS Fecha_Consulta,
    ADCR.fn_NombreCompletoPersona(105) AS Estudiante
FROM sys.views v
WHERE v.schema_id = SCHEMA_ID('ADCR');