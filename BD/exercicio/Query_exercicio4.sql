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
SELECT especialidade FROM Professor;
SELECT * FROM Professor WHERE especialidade = 'Banco de Dados';
SELECT * FROM Professor ORDER BY nome;
SELECT * FROM Professor ORDER BY dtNasc DESC;
SELECT * FROM Professor WHERE nome LIKE 'A%';
SELECT * FROM Professor WHERE nome LIKE '%A';
SELECT * FROM Professor WHERE nome LIKE '_A%';  
SELECT * FROM Professor WHERE nome LIKE '%A_';
	
DROP TABLE Professor;