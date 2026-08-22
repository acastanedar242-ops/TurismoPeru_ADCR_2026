SELECT
    object_id,
    column_id,
    name,
    system_type_id,
    max_length,
    is_nullable,
    GETDATE() AS Fecha_Consulta,
    ADCR.fn_NombreCompletoPersona(105) AS Estudiante
FROM sys.columns
ORDER BY object_id, column_id;