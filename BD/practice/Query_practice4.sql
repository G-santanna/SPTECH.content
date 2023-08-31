USE sprint1;

CREATE TABLE Professor(
	idProfessor int primary key,
    nome varchar(50),
    especialidade varchar(40),
    dtNasc date);
    
INSERT INTO Professor VALUES
	(1, 'Allan', 'Física', '1980-06-20'),
    (2, 'Vivian', 'Banco de Dados', '1983-10-13'),
    (3, 'Maria', 'Lógica', '1975-08-22'),
    (4, 'Kleber', 'Lógica', '1990-03-30'),
    (5, 'Adriana', 'Física', '1978-04-07'),
    (6, 'Regis', 'Banco de Dados', '1973-05-27');
    
SELECT * FROM Professor;

ALTER TABLE Professor ADD COLUMN funcao varchar(50) CONSTRAINT chkFunc CHECK (funcao IN ('monitor','assistente','titular'));

UPDATE Professor SET funcao = 'titular'
	WHERE idProfessor IN (2,3);
    
UPDATE Professor SET funcao = 'assistente'
	WHERE idProfessor IN(1,4);
    
UPDATE Professor SET funcao = 'monitor'
	WHERE idProfessor IN (5,6);
    
INSERT INTO Professor VALUES
	(7, 'João', 'SIS', '2000-09-20', 'assistente');

DELETE FROM Professor WHERE idProfessor = 5;

SELECT nome FROM Professor WHERE funcao = 'titular';

SELECT especialidade, dtNasc FROM Professor WHERE funcao = 'monitor';

UPDATE Professor SET dtNasc = '1990-05-23'
	WHERE idProfessor = 3;
    
TRUNCATE TABLE Professor;

DROP TABLE Professor;