-- Resumen de Ventas por Cliente

DROP VIEW IF EXISTS ADCR.vw_ResumenReservasCliente;
GO

CREATE VIEW ADCR.vw_ResumenReservasCliente
WITH SCHEMABINDING
AS
SELECT 
    id_cliente,
    SUM(precio_total) AS MontoTotal,
    COUNT_BIG(*) AS TotalReservas 
FROM ADCR.reserva
GROUP BY id_cliente;
GO

CREATE UNIQUE CLUSTERED INDEX idx_ResumenReservas_IdCliente 
ON ADCR.vw_ResumenReservasCliente (id_cliente);
GO

-- Comprobacion

SELECT *,
    GETDATE() AS Fecha_Consulta,
    ADCR.fn_NombreCompletoPersona(105) AS Estudiante
FROM ADCR.vw_ResumenReservasCliente;
GO