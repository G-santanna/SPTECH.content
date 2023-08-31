USE sprint1;

CREATE TABLE Filme(
	idFilme int primary key,
    titulo varchar(50),
    genero varchar(40),
    diretor varchar(40));
    
INSERT INTO Filme VALUES
	(1, 'CARROS', 'Animação', 'Lightning McQueen'),
    (2, 'Maze Runner', 'Ação', 'João'),
    (3, 'Need for Speed', 'Ação', 'Lightning McQueen'),
    (4, 'CARROS 2', 'Animação', 'Mater'),
    (5, 'Up - Altas Aventuras', 'Animação', 'Pete Docter'),
    (6, 'Wall-E', 'Infantil', 'Andrew Stanton'),
    (7, 'Star Wars: O Império Contra-Ataca', 'Ficção científica', 'Irvin Kershner');
    
SELECT * FROM Filme;

ALTER TABLE Filme ADD COLUMN protagonista varchar(50);

UPDATE Filme SET protagonista = 'Lightning McQueen'
	WHERE idFilme IN (1,4);
    
UPDATE Filme SET protagonista = 'Thomas'
	WHERE idFilme = 2;
    
UPDATE Filme SET protagonista = 'Tobey Marshall'
	WHERE idFilme = 3;
    
UPDATE Filme SET protagonista = 'Carl Fredricksen'
	WHERE idFilme = 5;
    
UPDATE Filme SET protagonista = 'Wall-E'
	WHERE idFilme = 6;
    
UPDATE Filme SET protagonista = 'Luke Skywalker'
	WHERE idFilme = 7;
    
ALTER TABLE Filme MODIFY COLUMN diretor varchar(150);

UPDATE Filme SET diretor = 'Peter Hans Docter'
	WHERE idFilme = 5;
    
UPDATE Filme SET diretor = 'John Lasseter'
	WHERE idFilme IN (1,4);
    
UPDATE Filme SET titulo = 'Wall-e: O robô'
	WHERE idFilme = 6;
    
DELETE FROM Filme WHERE idFilme = 3;

SELECT * FROM Filme WHERE genero != 'Animação';

SELECT * FROM Filme WHERE genero = 'Animaçao';

DESCRIBE Filme;

TRUNCATE TABLE Filme;

DROP TABLE Filme;