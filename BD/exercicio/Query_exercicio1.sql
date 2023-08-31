CREATE DATABASE sprint1; 
USE sprint1;

CREATE TABLE atleta (
	idAtleta int primary key,
    nome varchar(40),
    modalidade varchar(40),
    qtdMedalha int);
    
INSERT INTO atleta VALUES
	(1,'JOÃO','FUTEBOL',4),
    (2,'MARIA','VOLÊI',6),
    (3,'GUSTAVO','FUTEBOL',0),
	(4,'SAMUEL','VOLÊI',9),
	(5,'ÍCARO','CORRIDA',3),
    (6,'JONAS','CORRIDA',5);
    
SELECT * FROM atleta;
SELECT nome, qtdMedalha FROM atleta;
SELECT * FROM atleta WHERE modalidade = 'FUTEBOL';
SELECT * FROM atleta ORDER BY modalidade;
SELECT * FROM atleta ORDER BY qtdMedalha DESC;
SELECT * FROM atleta WHERE nome LIKE '%S%';
SELECT * FROM atleta WHERE nome LIKE 'J%';
SELECT * FROM atleta WHERE nome LIKE '%O';
SELECT * FROM atleta WHERE nome LIKE '%R_';

DROP TABLE atleta;
