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
SELECT titulo,diretor FROM Filme;
SELECT * FROM Filme WHERE genero = 'Ação';
SELECT * FROM Filme WHERE diretor = 'Lightning McQueen';
SELECT * FROM Filme ORDER BY titulo;
SELECT * FROM Filme ORDER BY diretor DESC;
SELECT * FROM Filme WHERE titulo LIKE 'C%';
SELECT * FROM Filme WHERE diretor LIKE '%R';
SELECT * FROM Filme WHERE genero LIKE '_N%';
SELECT * FROM Filme WHERE titulo LIKE '%E_';

DROP TABLE Filme;