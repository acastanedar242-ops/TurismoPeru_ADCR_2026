--Sintaxis Vistas Particionadas

CREATE OR ALTER VIEW esquema.vw_NombreVistaParticionada
AS
-- Consulta de la primera tabla (Ej. datos del 2024)
SELECT 
    columna1, 
    columna2, 
    columna3
FROM esquema.tabla_parte1

UNION ALL

-- Consulta de la segunda tabla (Ej. datos del 2025)
SELECT 
    columna1, 
    columna2, 
    columna3
FROM esquema.tabla_parte2

UNION ALL

-- Consulta de la tercera tabla (Ej. datos del 2026)
SELECT 
    columna1, 
    columna2, 
    columna3
FROM esquema.tabla_parte3;
GO