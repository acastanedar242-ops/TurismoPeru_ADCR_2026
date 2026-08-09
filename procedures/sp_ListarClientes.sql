CREATE OR ALTER PROCEDURE ADCR.sp_ListarClientes
AS
BEGIN
    Select p.id_persona, p.tipo_persona,nombres, apaterno,amaterno, estado
    From ADCR.persona p
    inner join ADCR.cliente c
    on p.id_persona = c.id_persona
END
GO
