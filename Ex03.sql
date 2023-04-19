CREATE OR REPLACE FUNCTION f_Atendimentos(data_inicial date, data_final date) returns setof record
AS $$
DECLARE 
	regconsul record;
BEGIN
FOR regconsul in
	SELECT nome_medico, COUNT(*) FROM medico
		INNER JOIN atende
		ON medico.id_medico = atende.id_medico
		WHERE data_consulta >= data_inicial AND data_consulta <= data_final
		GROUP BY medico.nome_medico
	LOOP
		return next regconsul ;
END LOOP;
RETURN; 
END;
$$
LANGUAGE plpgsql;

SELECT * FROM  f_Atendimentos('09/02/2020', '08/05/2023') AS (nome_medico VARCHAR, quantidade BIGINT);

drop function f_Atendimentos(data_inicial date, data_final date);