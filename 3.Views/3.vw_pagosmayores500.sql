--Vista con filtros, pagos mayores a 500.

CREATE OR ALTER VIEW ADCR.vw_pagosmayores500
AS
SELECT
	id_pago,
	id_reserva,
	monto,
	MP.nombre AS [Medio de Pago],
	GETDATE () as Fecha_consulta,
	ADCR.fn_NombreCompletoPersona (105) as Estudiante
FROM ADCR.pago P
INNER JOIN ADCR.medio_pago MP ON P.id_medio_pago = MP.id_medio_pago
WHERE monto > 500;

--Comprobacion
SELECT * FROM ADCR.vw_pagosmayores500;
GO