--Ex 02

CREATE OR REPLACE FUNCTION insere_cirurgia(cod_cirurgia VARCHAR, data_cirurgia DATE, descricao VARCHAR, id_pac INTEGER) 
RETURNS text 
AS
$$
DECLARE
  verifica paciente%ROWTYPE;
BEGIN
  SELECT * INTO verifica FROM paciente WHERE id_paciente = id_pac;
      IF NOT FOUND THEN
        RAISE EXCEPTION 'Paciente não encontrado';
    END IF;
  INSERT INTO cirurgia (codigo_cirurgia, data_cirurgia, descricao, id_paciente)
  VALUES (cod_cirurgia, data_cirurgia, descricao, id_pac);
  
  
  RETURN 'Cirurgia inserida no banco de dados.';
  
END;
$$
LANGUAGE plpgsql;


SELECT insere_cirurgia('c5', '2023-04-19', 'Rinoplastia', 1);

