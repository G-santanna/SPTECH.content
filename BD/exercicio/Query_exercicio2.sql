USE sprint1;

CREATE TABLE Musica(
	idMusica int primary key,
    titulo varchar(40),
    artista varchar(40),
    genero varchar(40));

INSERT INTO Musica VALUES
	(1, 'Ghost', 'Confetti', 'Rock-Pop'),
    (2, 'People Suck', 'Confetti', 'Rock-Pop'),
    (3, 'God is really real', 'AJR', 'indie'),
    (4, 'World´s smallest violin', 'AJR', 'indie'),
    (5, 'In the end', 'Linkin Park', 'Rock'),
    (6, 'One step closer', 'Linkin Park', 'Rock'),
    (7, 'FRIENDS', 'Marshmello', 'Pop');

SELECT * FROM Musica;
SELECT titulo, artista FROM Musica;
SELECT * FROM Musica WHERE genero = 'Rock';
SELECT * FROM Musica WHERE artista = 'Confetti';
SELECT * FROM Musica ORDER BY titulo;
SELECT * FROM Musica ORDER BY artista DESC;
SELECT * FROM Musica WHERE titulo LIKE 'G%';
SELECT * FROM Musica WHERE artista LIKE '%K';
SELECT * FROM Musica WHERE genero LIKE '_O%';
SELECT * FROM Musica WHERE titulo LIKE '%E_';

DROP TABLE Musica;