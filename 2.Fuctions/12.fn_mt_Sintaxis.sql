--Sintaxis Funcion Tabla Multiples Sentencias

CREATE OR ALTER FUNCTION ADCR.FN_NOMBREFUNCION
(
	--@parametro TipoDato
	@edad INT
)
RETURNS @Resultado TABLE
(
	Columna 1 tipoDato,
	Columna 2 tipoDato,
	Columna 3 tipoDato,
)
AS
BEGIN
	--Istrucciones SQL
	RETURN;
END;
GO