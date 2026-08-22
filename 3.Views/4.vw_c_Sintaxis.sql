--Sintaxis Vistas Complejas

CREATE VIEW esquema.nombre_vista
AS
SELECT columnas, expresiones, funciones_agregacion
FROM tabla1
INNER JOIN tabla2 ON condicion_cruce
WHERE condicion
GROUP BY columnas
HAVING condicion_agrupacion;