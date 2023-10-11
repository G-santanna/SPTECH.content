USE sprint2;

CREATE TABLE Pessoa(
	idPessoa int primary key auto_increment,
    nome varchar(45),
    dtNasc date,
    profissao varchar(45)
);

CREATE TABLE Gastos(
	idGasto int primary key auto_increment,
    dtGasto date,
    valor decimal,
    descGasto varchar(100),
    fkPessoa int,
    constraint fkPessoa foreign key (fkPessoa) references Pessoa(idPessoa)
);

INSERT INTO Pessoas (nome, dtNasc, profissao)VALUES
('Gustavo Henrique', '2004-06-17', 'Operador de caixa'),
('Fernanda Flores', '2000-08-21', 'Estudante'),
('Lucas Carvalho', '2004-07-03', 'Historiador'),
('Leonardo Santos','2004-10-19','Astronauta'),
('Caio Araruna','2000-01-11','Banqueiro'),
('Hosana Flores', '1998-11-10', 'Palhaça');

INSERT INTO Gastos (dtGasto, valor, descGasto, fkPessoa) VALUES
('2023-09-22', 50.00, 'Carrinho de brinquedo', 1),
('2023-09-24', 1000.00, 'Coleção de História em quadrinhos', 3),
('2022-10-15', 70.00, 'Valorant Points', 4),
('2013-04-21', 15.00, 'Ingresso'),
(),
(),
();