--Calcular el IGV de un pago
CREATE OR ALTER FUNCTION ADCR.fn_CalcularIGVPago
(
@monto money
)
RETURNS money
AS
BEGIN
	return @monto * 0.18;
END;
GO

--Ejecutar funcion
Select ADCR.fn_CalcularIGVPago (459) AS IGV, GETDATE () as Fecha_Consulta;

--Ejecutar en consulta real
Select
monto,
ADCR.fn_CalcularIGVPago(monto) as IGV, GETDATE () as Fecha_Consulta
from ADCR.pago
where monto >=0