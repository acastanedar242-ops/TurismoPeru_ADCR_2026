--Reservas de un cliente
CREATE OR ALTER FUNCTION ADCR.fn_MT_ReservasClientes
(
	@IdCliente INT
)
RETURNS @Resultado TABLE
(
	IdReserva int,
	FechaReserva date,
	EstadoReserva varchar(100),
	TotalPagado money
)
AS
BEGIN
	INSERT INTO @Resultado
	(
		IdReserva,
		FechaReserva,
		EstadoReserva,
		TotalPagado
	)
	SELECT
		R.id_reserva,
		R.fecha_reserva,
		ER.nombre, --Viene de estado de la reserva
		ISNULL (SUM(P.monto), 0) -- viene de pagos
	FROM ADCR.reserva R 
	INNER JOIN 
		ADCR.estado_reserva ER on
		ER.id_estado_reserva = R.id_estado_reserva
	LEFT JOIN 
		ADCR.pago P on
		R.id_reserva = P.id_reserva
	WHERE R.id_cliente = @IdCliente

	GROUP BY
		R.id_reserva,
		R.fecha_reserva,
		ER.nombre; --Estado Reserva

	RETURN;
END;
GO

--ejecucion
Select *,
	GETDATE() as Fecha_Consulta,
	ADCR.fn_NombreCompletoPersona(105) as Estudiante
FROM ADCR.fn_ReservaCliente(10);