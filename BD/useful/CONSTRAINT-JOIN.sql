-- AULA 6
-- MODELAGEM DE DADOS

CREATE DATABASE sprint2;

USE sprint2;

CREATE TABLE empresa(
	idEmpresa int primary key auto_increment,
    nome varchar(45),
    responsavel varchar(45)
) auto_increment = 1000;

INSERT INTO empresa VALUES
	(null, 'C6Bank', 'Andresa'),
    (null, 'Accenture', 'Rafael');
    
SELECT * FROM empresa;    

CREATE TABLE aluno(
	ra char(8) primary key,
    nome varchar(45),
    bairro varchar(45)
);

INSERT INTO aluno VALUES
	('01232999', 'Lucas', 'Consolação');
    
ALTER TABLE aluno ADD COLUMN fkEmpresa int;
ALTER TABLE aluno ADD CONSTRAINT fkEmp foreign key (fkEmpresa) references empresa(idEmpresa);    

SELECT * FROM aluno;

UPDATE aluno SET fkEmpresa = 1000 WHERE ra = '01232999';

INSERT INTO aluno VALUES
	('01232998', 'Luana', 'Paraíso', 1001),
    ('01232997', 'Sabrina', 'Paraíso', 1001);
    
SELECT * FROM aluno JOIN empresa ON idEmpresa = fkEmpresa;

SELECT aluno.nome, aluno.bairro, empresa.nome, empresa.responsavel FROM aluno JOIN empresa ON idEmpresa = fkEmpresa; 