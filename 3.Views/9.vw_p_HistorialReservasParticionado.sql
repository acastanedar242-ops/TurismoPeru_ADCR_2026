-- PASO 1: Particionar los datos físicamente (Sin alterar tu tabla original)

-- Hacemos limpieza por si ejecutas el código más de una vez
DROP TABLE IF EXISTS ADCR.reserva_2025;
DROP TABLE IF EXISTS ADCR.reserva_2026;
GO

-- Creamos una nueva tabla SOLO con las reservas del 2025
SELECT * 
INTO ADCR.reserva_2025
FROM ADCR.reserva
WHERE YEAR(fecha_reserva) = 2025;

-- Creamos otra nueva tabla SOLO con las reservas del 2026
SELECT * 
INTO ADCR.reserva_2026
FROM ADCR.reserva
WHERE YEAR(fecha_reserva) = 2026;
GO

-- PASO 2: Crear la Vista Particionada uniendo las tablas históricas

CREATE OR ALTER VIEW ADCR.vw_HistorialReservasParticionado
AS
-- Consulta de la partición 2025
SELECT 
    id_reserva,
    codigo_reserva,
    fecha_reserva,
    precio_total,
    'Partición 2025' AS ArchivoOrigen 
FROM ADCR.reserva_2025

UNION ALL

-- Consulta de la partición 2026
SELECT 
    id_reserva,
    codigo_reserva,
    fecha_reserva,
    precio_total,
    'Partición 2026' AS ArchivoOrigen
FROM ADCR.reserva_2026;
GO

-- Comprobación

SELECT *,
    GETDATE() AS Fecha_Consulta,
    ADCR.fn_NombreCompletoPersona(105) AS Estudiante
FROM ADCR.vw_HistorialReservasParticionado;
GO