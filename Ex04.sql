CREATE OR REPLACE FUNCTION f_data_cirurgia() RETURNS TRIGGER 
AS $$
BEGIN
    IF (NEW.data_cirurgia < CURRENT_DATE) THEN
        RAISE EXCEPTION 'Não é possível inserir a cirurgia, pois a data é inferior à atual.';
    ELSIF(NEW.data_cirurgia >= CURRENT_DATE) THEN
		RAISE EXCEPTION 'Inserção feita com sucesso.';
	END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tr_data_cirurgia 
BEFORE INSERT OR UPDATE 
ON cirurgia
FOR EACH ROW EXECUTE FUNCTION f_data_cirurgia();

INSERT INTO cirurgia (codigo_cirurgia, data_cirurgia, descricao, id_paciente)
VALUES ('c5', '2023-10-01', 'Protese', 2);

select * from cirurgia;
