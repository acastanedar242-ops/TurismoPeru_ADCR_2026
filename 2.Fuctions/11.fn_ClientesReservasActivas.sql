-- Clientes con reservas activas

CREATE OR ALTER FUNCTION ADCR.fn_ClientesReservasActivas
(
)
RETURNS TABLE
RETURN
(
	SELECT
		C.id_persona AS [Codigo Cliente],
		ADCR.fn_NombreCompletoPersona(C.id_persona) AS Cliente,
		R.id_reserva AS [Codigo Reserva],
		R.codigo_reserva AS [Numero Reserva],
		R.fecha_reserva AS [Fecha Reserva],
		R.fecha_inicio AS [Fecha Inicio],
		R.fecha_fin AS [Fecha Fin],
		ER.nombre AS [Estado Reserva]
	FROM ADCR.reserva R
		INNER JOIN ADCR.cliente C ON C.id_persona = R.id_cliente
		INNER JOIN ADCR.estado_reserva ER ON ER.id_estado_reserva = R.id_estado_reserva
	WHERE
	-- Exclimos elementos que representen un estado no confirmado de reserva
		LOWER(ER.nombre) NOT IN ('completada', 'anulada', 'reembolsada', 'vencida', 'no show', 'finalizada')
);
GO

-- Ejecución
SELECT
	*,
	GETDATE() AS [Fecha de Consulta],
	ADCR.fn_NombreCompletoPersona(105) AS Estudiante
FROM ADCR.fn_ClientesReservasActivas();