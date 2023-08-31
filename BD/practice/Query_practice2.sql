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

ALTER TABLE Musica ADD COLUMN curtidas int;

UPDATE Musica SET curtidas = 500000
	WHERE idMusica IN (1,2,4,6);
    
UPDATE Musica SET curtidas = 1000000
	WHERE idMusica IN(5,7);

UPDATE Musica SET curtidas = 100000
	WHERE idMusica = 3;
    
ALTER TABLE Musica MODIFY COLUMN artista varchar(80);

UPDATE Musica SET curtidas = 550000
	WHERE idMusica = 1;
    
UPDATE Musica SET curtidas = 600000
	WHERE idMusica IN (2,3);
    
UPDATE Musica SET titulo = 'No final'
	WHERE idMusica = 5;
    
DELETE FROM Musica WHERE idMusica = 4;

SELECT * FROM Musica WHERE genero != 'Rock';

SELECT * FROM Musica WHERE curtidas >= 700000;

DESCRIBE Musica;

DELETE FROM Musica WHERE idMusica > 0;

DROP TABLE Musica;