use sprint2;
-- Exercício 1
create table projeto (
	idProj int primary key auto_increment,
    nome varchar(45),
    descProj varchar(45)
);

create table aluno (
	ra char(8) primary key,
    nome varchar(45),
    telefone varchar(15),
    fkRep char(8),
    fkProj int,
    constraint fkRepresentante foreign key (fkRep) references aluno(ra),
    constraint fkProjeto foreign key (fkProj) references projeto(idProj)
);

create table acompanhante (
	idAcomp int,
    fkAluno char(8),
    primary key(idAcomp, fkAluno),
    nome varchar(45),
    relacao varchar(45)
);
insert into projeto values
(null, 'CoffeeFlow', 'Monitoramento de C° no plantío de café'),
(null, 'HardwareLife', 'Monitoramento de C° em datacenter');

insert into aluno values
('01232184', 'Gustavo', '119611571', null, 1);

insert into aluno values
('01232999', 'Diego', '11911851', '01232184', 1),
('01232998', 'Ian', '1191414514', '01232184', 2),
('01232997', 'Beatriz', '11978214681', '01232184', 1);

insert into acompanhante values
(1, '01232184', 'Nina', 'Filha'),
(2, '1232999', 'Maya', 'Filha');

select * from projeto;
select * from aluno;
select * from acompanhante;

select * from aluno join projeto on fkProj = idProj;

select * from aluno join acompanhante on fkRep = fkAluno;

select * from aluno as a join aluno as rep on rep.ra = a.fkRep;

select * from aluno join projeto on fkProj = idProj where projeto.nome = 'CoffeeFlow';

select * from aluno join projeto on fkProj = idProj join acompanhante on fkAluno = ra where projeto.nome = 'CoffeeFlow';

-- Exercício 2
create database campanha;
use campanha;

create table organizador(
	idOrganizador int primary key auto_increment,
    nome varchar(45),
    rua varchar(45),
    bairro varchar(45),
    email varchar(45),
    fkOrganizador int,
    constraint fkOrganizador foreign key (fkOrganizador) references organizador(idOrganizador)
) auto_increment = 30;

create table campanha(
	idCampanha int primary key auto_increment,
    categoria varchar(45),
    instituicao1 varchar(45),
    instituicao2 varchar(45),
    dtFinal date,
    fkOrganizador int,
    constraint fkCampOrg foreign key (fkOrganizador) references organizador(idOrganizador)
);

insert into organizador values(null, 'OMS', 'Chantepoulet 21/3ème Étage', 'Genève', 'oms@brasil.com', null);

insert into organizador values
(null, 'OPAS', 'SEN', 'Asa Norte', 'opas@brasil.com', 30),
(null, 'Ministério da Saúde', 'Esplanada dos Ministérios Bloco G', 'Zona Cívico-Administrativa', 'msaude@brasil.com', 30);

insert into campanha values 
(null, 'Arrecadação', 'UFPA', 'Ebserh', '2020-10-10', 30),
(null, 'Arrecadação', 'Livroteca Brincante do Pina', null, '2021-12-10', 36),
(null, 'Arrecadação', 'FURG', 'Proexc', '2022-02-10', 36);

select * from organizador;
select * from campanha;

select * from organizador join campanha on campanha.fkOrganizador = idOrganizador;

select * from organizador join campanha on campanha.fkOrganizador = idOrganizador where nome = 'Ministério da Saúde';

select * from organizador as n join organizador as e on e.idOrganizador = n.fkOrganizador;

select * from organizador as n join organizador as e on e.idOrganizador = n.fkOrganizador where e.nome = 'OMS';

select * from campanha join organizador as n on n.idOrganizador = campanha.fkOrganizador join organizador as e on e.idOrganizador = n.fkOrganizador;

select * from campanha join organizador as n on n.idOrganizador = campanha.fkOrganizador join organizador as e on e.idOrganizador = n.fkOrganizador where n.nome = 'Ministério da Saúde';