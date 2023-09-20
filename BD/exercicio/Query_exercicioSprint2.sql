-- Gustavo H., Vinicius, Elizeu, Beatriz, Diego C., Deivid -- GRUPO 10

CREATE DATABASE sprint2;
USE sprint2;

CREATE TABLE Aluno(
	idAluno int primary key auto_increment,
    nome varchar(40),
    turma char(5),
    ra char(8),
    etec char(3),
    conhecimento char(3)
);

CREATE TABLE Grupo(
	idGrupo int primary key auto_increment,
    tema varchar(45),
    feedback varchar(100)
);

ALTER TABLE Aluno ADD CONSTRAINT chkTurma CHECK (turma in('1ADSA','1ADSB','1ADSC'));
ALTER TABLE Aluno ADD CONSTRAINT chkEtec CHECK (etec in('sim', 'não'));
ALTER TABLE Aluno ADD CONSTRAINT chkConhe CHECK (conhecimento in('sim', 'não'));

INSERT INTO Aluno VALUES
	(null, 'Gustavo Henrique', '1ADSB', '01232184','sim','sim'),
    (null, 'Vinicius Lima', '1ADSB', '01232004', 'não', 'não'),
    (null, 'Elizeu Duarte', '1ADSB', '01232159', 'sim', 'não'),
    
    (null, 'Nathan', '1ADSB', '01232999', 'não', 'não'),
    (null, 'Matheus Kikuti', '1ADSB', '01232998', 'não', 'sim');
    
INSERT INTO Grupo VALUES 
	(10,'Morango', 'Melhorar o Banco de dados e Simulador Financeiro'),
    (3, 'Batata', 'Melhorar o Simulador Financeiro');

ALTER TABLE Aluno ADD COLUMN fkGrupo int;
ALTER TABLE Aluno ADD CONSTRAINT fkGrupoAluno FOREIGN KEY (fkGrupo) REFERENCES Grupo(idGrupo);

UPDATE Aluno SET fkGrupo = 10 WHERE idAluno in(1,2,3);
UPDATE Aluno SET fkGrupo = 3 WHERE idAluno in(4,5);

SELECT a.nome, a.etec, a.conhecimento, g.idGrupo, g.tema, g.feedback 
	FROM Aluno as a 
	JOIN Grupo as g ON a.fkGrupo = g.idGrupo;