USE sprint1;

CREATE TABLE Curso(
	idCurso int primary key,
    nome varchar(50),
    sigla char(3),
    coordenador varchar(40));

INSERT INTO Curso VALUES
	(1, 'Análise e Desenvolvimento de Sistemas', 'ADS', 'Gerson'),
    (2, 'Ciências da Computação', 'CCO', 'Vivian'),
    (3, 'Sistemas da Informação', 'SIS', 'Brandão');
    
SELECT * FROM Curso;
SELECT coordenador FROM Curso;
SELECT * FROM Curso WHERE sigla = 'ADS';
SELECT * FROM Curso ORDER BY nome;
SELECT * FROM Curso ORDER BY coordenador DESC;
SELECT * FROM Curso WHERE nome LIKE 'A%';
SELECT * FROM Curso WHERE nome LIKE '%O';
SELECT * FROM Curso WHERE nome LIKE '_I%';
SELECT * FROM Curso WHERE nome LIKE '%A_';

DROP TABLE Curso;