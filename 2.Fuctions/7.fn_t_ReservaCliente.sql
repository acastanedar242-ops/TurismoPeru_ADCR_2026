--Reservas de un cliente

CREATE OR ALTER FUNCTION ADCR.fn_ReservaCliente
(
	@IdCliente int
)
RETURNS TABLE
RETURN
(
	SELECT
	id_reserva as [Codigo Reserva],
	fecha_reserva,
	ER.nombre as [Estado Reserva]
	From ADCR.reserva R
		inner join ADCR.estado_reserva ER on 
		ER.id_estado_reserva = R.id_estado_reserva
	where id_cliente = @IdCliente
);
GO

--Ejecucion Funcion de Tabla
Select *,
GETDATE () as Fecha_Consulta, ADCR.fn_NombreCompletoPersona (105) as Estudiante
from ADCR.fn_ReservaCliente (2);
