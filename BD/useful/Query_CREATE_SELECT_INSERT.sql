-- CRIANDO O BANCO DE DADOS / DATABASE --

-- todo comando sql termina com ponto e vírgula; --

CREATE DATABASE bd1adsb;

-- SELECIONAR O BANCO DE DADOS --

USE bd1adsb;

-- CRIANDO NOSSA PRIMEIRA TABELA --
CREATE TABLE empresa (
id int primary key,
nome varchar(50),
responsavel varchar(40)
);

-- DESCRIBE --

DESCRIBE empresa;

-- INSERIR DADOS --

INSERT INTO empresa VALUES
	(100, 'STEFANINI', 'RAFAEL'),
    (101, 'C6', 'ANDRESA'),
    (102, 'AACENTURE', 'RENATA');
    
-- ATUALIZAR DADOS --

UPDATE empresa SET nome = 'ACCENTURE' WHERE id = 102;
    
-- EXIBIR OS DADOS --

SELECT * FROM empresa;
    
-- EXIBIR COM FILTRO --

SELECT responsavel FROM empresa;

SELECT nome FROM empresa;

SELECT id, nome FROM empresa;

-- exibir apenas a empresa que tem o responsavel Andresa --

SELECT * FROM empresa WHERE responsavel = 'ANDRESA';

SELECT * FROM empresa WHERE nome = 'STEFANINI';

-- LIKE --

SELECT * FROM empresa WHERE responsavel LIKE 'A%'; -- % IGNORA O PÓS E PRÉ DA STRING INSERIDA --

SELECT * FROM empresa WHERE responsavel LIKE '_A%'; -- _ NÃO IGNORA MAS DEPENDE DA EXISTENCIA --

-- ORDER BY --

SELECT * FROM aluno ORDER BY nome;

SELECT * FROM aluno ORDER BY nome DESC;

-- CRIAÇÃO DE TABELA PARA RELACIONAMENTO --

CREATE TABLE turma (
	id int primary key, 
    nome varchar(40)
    );
    
INSERT INTO turma VALUES
	(2, '1ADSA'),
    (1, '1ADSB'),
    (3, '1ADSC');

SELECT * FROM turma;

-- --

CREATE TABLE aluno (
	RA varchar(15) primary key,
    nome varchar(40),
    bairro varchar(40),
    id_turma int,
    id_empresa int
);

INSERT INTO aluno VALUES 
	('01232050', 'JULIA','TREMEMBÉ', 1, 100),
    ('01232164', 'MARAYAH', 'OSASCO', 1, 100),
    ('01232159', 'ELIZEU', 'VILA MANGALOT', 1, 101),
    ('01232040', 'GISLAINE', 'ITAIM PAULISTA', 1, 100),
    ('01232175', 'MELISSA', 'VILA MEDEIROS', 1, 102);

SELECT * FROM aluno;

-- EXCLUIR UMA TUPLA --

DELETE FROM empresa where id = 100;

-- DDL --

DESCRIBE empresa;

ALTER TABLE empresa RENAME COLUMN id to idEmpresa; -- RENOMEAR COLUNA --

ALTER TABLE empresa MODIFY COLUMN nome varchar(50); -- TIPAGEM DO DADO --

ALTER TABLE empresa ADD COLUMN salario int; -- ADICIONAR COLUNA --

ALTER TABLE empresa DROP COLUMN salario; -- DELETAR COLUNA --