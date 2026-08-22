-- Sintaxis Vistas Indexadas

-- PASO 1: Crear la vista obligatoriamente con SCHEMABINDING
CREATE VIEW esquema.nombre_vista
WITH SCHEMABINDING
AS
SELECT 
    columna1, 
    columna2
FROM esquema.tabla 
WHERE condicion;
GO

-- PASO 2: Crear el índice agrupado único para "materializar" los datos
CREATE UNIQUE CLUSTERED INDEX idx_nombre_indice 
ON esquema.nombre_vista (columna_clave);
GO
