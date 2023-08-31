USE sprint1;

CREATE TABLE Revista(
	idRevista int primary key auto_increment,
    nome varchar(40),
    categoria varchar(30));
 
INSERT INTO Revista VALUES
	(NULL, 'Estadão', NULL),
    (NULL, 'Quatro Rodas', NULL),
    (NULL, 'Isto é', NULL),
    (NULL, 'Época', NULL);
    
SELECT * FROM Revista;


UPDATE Revista SET categoria = 'Política' WHERE idRevista = 1;
UPDATE Revista SET categoria = 'Automotiva' WHERE idRevista = 2;
-- UPDATE Revista SET categoria = 'Dia-a-Dia' WHERE idRevista = 3;
-- UPDATE Revista SET categoria = 'Dia-a-Dia' WHERE idRevista = 4;
UPDATE Revista SET categoria = 'Dia-a-Dia' WHERE idRevista IN (3,4);

SELECT * FROM Revista;

INSERT INTO Revista VALUES
	('5', 'Natura', 'Cosméticos'),
    ('6', 'Carro', 'Automotiva'),
    ('7', 'Jequiti', 'Cosméticos');
    
SELECT * FROM Revista;
DESCRIBE Revista;
ALTER TABLE Revista MODIFY COLUMN categoria varchar(40);
DESCRIBE Revista;
ALTER TABLE Revista ADD COLUMN periodicidade varchar(15);
SELECT * FROM Revista;
ALTER TABLE Revista DROP COLUMN periodicidade;

DROP DATABASE sprint1;