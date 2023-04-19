-- Cria DATABASE
/* 

CREATE DATABASE "TrabalhoABD"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
*/

-- Cria usuário
/*
CREATE USER priscilascarlet 
WITH PASSWORD 'postdba';
*/

--Tabelas

create table paciente(
id_paciente SERIAL PRIMARY KEY,
cod_paciente VARCHAR,
nome_paciente VARCHAR(50),
idade_paciente INTEGER
);

create table medico(
id_medico  SERIAL PRIMARY KEY,
crm VARCHAR(6),
nome_medico VARCHAR(50),
especialidade VARCHAR(50)
);

create table atende(
id_atende  SERIAL PRIMARY KEY,
id_paciente INTEGER,
id_medico INTEGER,
data_consulta DATE,
CONSTRAINT fk_medico_atende FOREIGN KEY(id_medico) REFERENCES medico,
CONSTRAINT fk_atende_paciente FOREIGN KEY(id_paciente) REFERENCES paciente
);

create table cirurgia(
id_cirurgia  SERIAL PRIMARY KEY,
codigo_cirurgia VARCHAR,
data_cirurgia DATE,
descricao VARCHAR(50),
id_paciente INTEGER,
CONSTRAINT fk_cirurgia_paciente FOREIGN KEY(id_paciente) REFERENCES paciente	
);


--SEQUÊNCIAS
create sequence sid_pct;
create sequence sid_med;
create sequence sid_atende;
create sequence sid_cirurgia;

select sequence_name
from information_schema.sequences;

--INSERTS

--Paciente
INSERT INTO paciente (cod_paciente, nome_paciente, idade_paciente)
VALUES
('p1', 'João', 12),
('p2', 'Maria', 38),
('p3', 'Pedro', 18),
('p4', 'Antônio', 29);

--Medico
INSERT INTO medico (crm, nome_medico, especialidade)
VALUES
('m1', 'Marcos', 'Oftalmologista'),
('m2', 'Tereza', 'Clínico Geral'),
('m3', 'Paulo', 'Pediatra'),
('m4', 'João', 'Clínico Geral');

select * from medico;
select * from paciente;

--Atende
INSERT INTO atende (id_paciente, id_medico, data_consulta)
VALUES
(1, 2, '09/02/2008'),
(2, 1, '26/03/2006'),
(3, 3, '11/09/2003'),
(2, 2, '08/05/2008');

--Cirurgia
INSERT INTO cirurgia (codigo_cirurgia, data_cirurgia, descricao, id_paciente)
VALUES
('c1', '25/07/2008', 'Apendicite', 1),
('c2', '07/02/2001', 'Retirada de cálculo renal', 2),
('c3', '14/11/2007', 'Unha encravada', 3),
('c4', '23/01/2008', 'Implante de silicone', 2);
