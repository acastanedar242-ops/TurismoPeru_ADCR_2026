CREATE OR ALTER PROCEDURE ADCR.sp_ListarPersonas
AS
BEGIN
    Select id_persona, tipo_persona,nombres, apaterno,amaterno, estado
    From ADCR.persona
END
GO
