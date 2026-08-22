-- Lista de Clientes (Apaterno, Amaterno, nombre, 
--tipopersona, nacionalidad, fechanacimiento y estado)

CREATE OR ALTER VIEW ADCR.vw_ListaClientes
AS
SELECT 
    P.apaterno,
    P.amaterno,
    P.nombres,
    CASE
        WHEN P.tipo_persona = 'N' THEN 'Natural'
        WHEN P.tipo_persona = 'J' THEN 'Juridica'
        ELSE 'Otro'
    END AS tipopersona,
    N.nombrenacionalidad AS nacionalidad, 
    C.fecha_nacimiento AS fechanacimiento,
    P.estado
FROM ADCR.cliente C
INNER JOIN ADCR.persona P ON C.id_persona = P.id_persona
LEFT JOIN ADCR.nacionalidad N ON P.id_nacionalidad = N.id_nacionalidad;
GO


-- Comprobación

SELECT *,
    GETDATE() AS Fecha_Consulta,
    ADCR.fn_NombreCompletoPersona(105) AS Estudiante
FROM ADCR.vw_ListaClientes;
GO