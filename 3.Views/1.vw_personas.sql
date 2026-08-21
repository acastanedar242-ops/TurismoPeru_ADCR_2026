--Vista de Personas

CREATE OR ALTER VIEW ADCR.vw_personas
AS
SELECT
	p.apaterno,
	p.amaterno,
	p.nombres,
	case
		when p.tipo_persona = 'N' then 'Natural'
		when p.tipo_persona = 'J' then 'Juridica'

	end as [Tipo persona],
	estado,
	GETDATE() Fecha_Consulta, ADCR.fn_NombreCompletoPersona(105) 
    as Estudiante from ADCR.persona p

--Comprobacion

Select * from ADCR.vw_personas;
go