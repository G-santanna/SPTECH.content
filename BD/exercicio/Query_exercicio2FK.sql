USE sprint2;

CREATE TABLE Musica (
	idMusica int primary key auto_increment,
    titulo varchar(40),
	artista varchar(40),
    genero varchar(40)
);

INSERT INTO Musica(titulo, artista, genero) VALUES
('Lonely','Confetti','Rock-Pop'),
('Motive','Confetti','Rock-Pop'),
('In the end','Linkin Park','Rock');

CREATE TABLE Album(
	idAlbum int primary key auto_increment,
    nome varchar(40),
    tipo varchar(40),
    dtLancamento date,
    CONSTRAINT chkTipo CHECK (tipo in ('Digital','Físico'))
);

INSERT INTO Album(nome, tipo, dtLancamento) VALUES
('The Circus: Act I', 'Digital', '2021-02-26'),
('Hybrid Theory', 'Digital', '2000-10-24');

SELECT * FROM Musica;
SELECT * FROM Album;

ALTER TABLE Musica ADD COLUMN idAlbum int;
ALTER TABLE Musica ADD CONSTRAINT fkAlbum FOREIGN KEY (idAlbum) REFERENCES Album(idAlbum);

UPDATE Musica SET idAlbum = 1 WHERE idMusica in (1,2);
UPDATE Musica SET idAlbum = 2 WHERE idMusica = 3;

SELECT * FROM Musica JOIN Album ON Musica.idAlbum = Album.idAlbum;

SELECT m.titulo, a.nome FROM Musica as m JOIN Album as a ON m.idAlbum = a.idAlbum;

SELECT * FROM Musica JOIN Album ON Musica.idAlbum = Album.idAlbum WHERE Album.nome = 'The Circus: Act I';