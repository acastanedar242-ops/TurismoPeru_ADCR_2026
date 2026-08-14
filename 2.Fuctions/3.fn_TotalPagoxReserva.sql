--Total pagado por una reserva
CREATE OR ALTER FUNCTION ADCR.fn_PagoTotalxReserva
(
	@IdReserva int
)
RETURNS money
AS
BEGIN
	Declare @Total money
	Select
		@Total = sum(monto)
	from ADCR.pago
	where id_reserva = @IdReserva;

	RETURN isnull (@Total,0);
END;
GO

--ejecutar funcion
Select ADCR.fn_PagoTotalxReserva (2) AS MontoPagado, GetDate() as Fecha_Consulta;
