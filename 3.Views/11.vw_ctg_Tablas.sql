SELECT
    object_id,
    name,
    create_date,
    modify_date,
    GETDATE() AS Fecha_Consulta,
    ADCR.fn_NombreCompletoPersona(105) AS Estudiante
FROM sys.tables
ORDER BY name;