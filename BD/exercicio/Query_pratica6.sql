use sprint2;

-- Exercício 2
create table pessoa (
	idPessoa int primary key auto_increment,
    nome varchar(45),
    sobrenome varchar(45),
    dtNasc date,
    profissao varchar(45)
);

create table gastos (
	idGasto int primary key auto_increment,
    dtGasto date,
    valor decimal(10,2),
    descGasto varchar(45),
    fkPessoa int,
    constraint fkPessoaGasto foreign key (fkPessoa) references pessoa(idPessoa)
);

insert into pessoa values
(null, 'Gustavo', 'Henrique', '2004-06-17', 'Operador de caixa'),
(null, 'Matheus', 'Kikuti', '2004-04-18', 'Dev'),
(null, 'João', 'Henrique', '2002-02-03', 'Empreiteiro');

insert into gastos values
(null, '2023-09-20', 50.00, 'Miniatura de carro', 1),
(null, '2023-09-15', 100.00, 'Valorant Points', 2),
(null, '2022-10-11', 349.90, 'Camisa do SPFC', 3),
(null, '2023-10-08', 349.90, 'Camisa do SPFC', 1);

select * from pessoa;

select * from gastos;

select * from pessoa where sobrenome = 'Henrique';

select * from pessoa join gastos on fkPessoa = idPessoa;

select * from pessoa join gastos on fkPessoa = idPessoa where idPessoa = 1;

update pessoa set profissao = 'Dev' where idPessoa = 1;

delete from gastos where fkPessoa = 2;
delete from pessoa where idPessoa = 2;

-- Exercício 3
create database praticaFuncionario;
use praticaFuncionario;

create table setor (
	idSetor int primary key auto_increment,
    nome varchar(45),
    nPredio int
);

create table funcionario (
	idFunc int primary key auto_increment,
    nome varchar(45),
    telefone varchar(15),
    salario decimal(10,2),
    fkSetor int,
    constraint fkSetorFunc foreign key (fkSetor) references setor(idSetor)
);

create table acompanhante (
	idAcomp int,
    fkFunc int,
    primary key(idAcomp, fkFunc),
    nome varchar(45),
    relacao varchar(45),
    dtNasc date
);

insert into setor values
(null, 'Administrativo', 1),
(null, 'Desenvolvimento', 2);

insert into funcionario values 
(null, 'Felippe', '11 40028922', 10000.00, 1),
(null, 'Matheus', '11990407070', 3000.00, 2),
(null, 'Gustavo', '11936687070', 3500.00, 2);

insert into acompanhante values 
(1, 1, 'Marayah', 'namorada', '2004-11-22'),
(1, 2, 'Leonel', 'amigo', '2003-04-20'),
(2, 2, 'Gustavo', 'amigo', '2004-05-10');

select * from setor;
select * from funcionario;
select * from acompanhante;

select * from setor join funcionario on fkSetor = idSetor;

select * from setor join funcionario on fkSetor = idSetor where setor.nome = 'Desenvolvimento';

select * from funcionario join acompanhante on fkFunc = idFunc;

select * from funcionario join acompanhante on fkFunc = idFunc where funcionario.nome = 'Matheus';

select * from funcionario join setor on fkSetor = idSetor join acompanhante on fkFunc = idFunc;

-- Exercício 4
create database treinador;
use treinador;

create table treinador (
	idTreinador int primary key auto_increment,
    nome varchar(45),
    telefone varchar(45),
    email varchar(45),
    fkSenior int,
    constraint fkTreinadorSenior foreign key (fKSenior) references treinador(idTreinador)
)
auto_increment = 10;	
;

create table nadador (
	idNadador int auto_increment primary key,
    nome varchar(45),
    estado char(2),
    dtNasc date,
    fkTreinador int,
    constraint fkTreinador foreign key (fkTreinador) references treinador(idTreinador)
)
auto_increment = 100
;

insert into treinador values 
(null, 'Gustavo', '11965738970', 'gustavo@sptech.school', null);

insert into treinador values
(null, 'Matheus', '11986755432', 'matheus@sptech.school', 10),
(null, 'Marayah', '14197414142', 'marayah@sptech.school', 10);

insert into nadador values
(null, 'Caio', 'SP', '2000-07-12', 13),
(null, 'Leonel', 'SP', '2003-05-20', 13),
(null, 'Felippe', 'RS', '2005-04-23', 14);

select * from treinador;
select * from nadador;

select * from treinador join nadador on fkTreinador = idTreinador;

select * from treinador join nadador on fkTreinador = idTreinador where treinador.nome = 'Matheus';

select * from treinador as j left join treinador as s on j.fkSenior = s.idTreinador;

select * from treinador as j join treinador as s on j.fkSenior = s.idTreinador where s.nome = 'Gustavo';

select * from treinador as j join nadador as n on fkTreinador = j.idTreinador join treinador as s on s.idTreinador = j.fkSenior;

select * from treinador as j join nadador as n on fkTreinador = j.idTreinador join treinador as s on s.idTreinador = j.fkSenior where j.nome = 'Matheus';