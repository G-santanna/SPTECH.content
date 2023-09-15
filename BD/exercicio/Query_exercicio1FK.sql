CREATE DATABASE sprint2;

USE sprint2;

CREATE TABLE Atleta (
	idAtleta int primary key auto_increment,
    nome varchar(40),
	modalidade varchar(40),
    qtdMedalha int
);

INSERT INTO Atleta VALUES
(null, 'João', 'Futebol', 5),
(null, 'Fernanda', 'Skate', 6),
(null, 'John','Basquete',3),
(null, 'Škriniar','Volêi',0),
(null, 'Lee', 'Tiro ao alvo', 9);

CREATE TABLE Pais (
	idPais int primary key auto_increment,
    nome varchar (30),
    capital varchar (40)
);

INSERT INTO Pais(nome,capital) VALUES
('Brasil','Brasília'),
('Austrália','Camberra'),
('Russia','Moscou'),
('Holanda','Amsterdã');

ALTER TABLE Atleta ADD COLUMN idPais int;
ALTER TABLE Atleta ADD CONSTRAINT fkPais FOREIGN KEY (idPais) references Pais(idPais);

UPDATE Atleta SET idPais = 1 WHERE idAtleta in(1,2);
UPDATE Atleta SET idPais = 2 WHERE idAtleta = 3;
UPDATE Atleta SET idPais = 3 WHERE idAtleta = 4;
UPDATE Atleta SET idPais = 4 WHERE idAtleta = 5;

SELECT a.nome, p.nome FROM Atleta as a JOIN Pais as p ON a.idPais = p.idPais;

SELECT a.nome, a.modalidade, a.qtdMedalha, p.nome, p.capital FROM Atleta as a JOIN Pais as p ON a.idPais = p.idPais;

SELECT a.nome, a.modalidade, a.qtdMedalha, p.nome, p.capital FROM Atleta as a JOIN Pais as p ON a.idPais = p.idPais WHERE p.capital = 'Brasília';

