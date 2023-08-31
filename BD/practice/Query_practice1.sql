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

UPDATE atleta SET qtdMedalha = 2
	WHERE idAtleta = 1;
    
UPDATE atleta SET qtdMedalha = 10
	WHERE idAtleta IN (2,3);
    
UPDATE atleta SET nome = 'ADRIANA'
	WHERE idAtleta = 4;
    
ALTER TABLE atleta ADD COLUMN dtNasc DATE;

UPDATE atleta SET dtNasc = '2004-06-17'
	WHERE idAtleta = 3;

UPDATE atleta SET dtNasc = '1984-03-10'
	WHERE idAtleta IN (1,2);
    
UPDATE atleta SET dtNasc = '1990-10-20'
	WHERE idAtleta IN (4,5);
    
UPDATE atleta SET dtNasc = '2000-08-24'
	WHERE idAtleta = 6;
    
DELETE FROM atleta WHERE idAtleta = 5;  

SELECT * FROM atleta WHERE modalidade != 'volêi';

SELECT * FROM atleta WHERE qtdMedalha >= 3;

ALTER TABLE atleta MODIFY COLUMN modalidade varchar(60);

DESCRIBE atleta;

DELETE FROM atleta WHERE idAtleta > 0;

DROP TABLE atleta;
