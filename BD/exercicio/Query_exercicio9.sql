create database sprint3;
use sprint3;

create table Grupo(
	idGrupo int primary key auto_increment,
    nome varchar(45),
    descProj varchar(45)
);

create table Professor(
	idProfessor int primary key auto_increment,
    nome varchar(45),
    disciplina varchar(45)
) auto_increment = 1000;

create table Aluno (
	RA char(8) primary key,
    nome varchar(45),
    email varchar(45),
    fkGrupo int,
    constraint fkAlunoGrupo foreign key (fkGrupo) references Grupo(idGrupo)
);

create table Avaliacao (
	fkGrupo int,
    fkProfessor int,
    primary key (fkGrupo, fkProfessor),
    dataHora datetime,
    nota decimal (3,1),
    constraint fkGrupoAvaliacao foreign key (fkGrupo) references Grupo(idGrupo),
    constraint fkProfessorAvaliacao foreign key (fkProfessor) references Professor(idProfessor)
);

insert into Grupo values
(null, 'CoffeeFlow', 'monitoramento do clima para o café durante o plantio'),
(null, 'HardwareLife', 'monitoramento do clima para datacenters'),
(null, 'OnSpot', 'monitoramento do clima para datacenters');

insert into Aluno values
('01232184', 'Gustavo Henrique', 'gustavo.soliveira@sptech.school', 1),
('01232999', 'Beltrano', 'beltrano@sptech.school', 2),
('01232998', 'Ciclano', 'ciclano@sptech.school', 2),
('01232992', 'Jorge', 'jorge@sptech.school', 3);

insert into Professor values
(null, 'Fernanda', 'Pesquisa e Inovação'),
(null, 'Rayssa', 'Socioemocional');

insert into Avaliacao values
(1, 1000, '2023-10-31 12:00:00', 7.5),
(1, 1001, '2023-10-31 12:00:00', 8.0),
(2, 1000, '2023-10-31 13:00:00', 9.0),
(2, 1001, '2023-10-31 13:00:00', 7.0),
(3, 1000, '2023-10-31 14:00:00', 10.0),
(3, 1001, '2023-10-31 14:00:00', 10.0);

select * from aluno;
select * from professor;
select * from grupo;
select * from avaliacao;

select * from grupo join aluno on fkGrupo = idGrupo;
select * from grupo join aluno on fkGrupo = idGrupo where idGrupo = 2;

select round(avg(nota),2) from avaliacao;

select min(nota), max(nota) from avaliacao;

select sum(nota) from avaliacao;

select professor.nome, professor.disciplina, dataHora, grupo.nome from professor join avaliacao on fkProfessor = idProfessor join grupo on fkGrupo = idGrupo;

select professor.nome, professor.disciplina, dataHora, grupo.nome from professor join avaliacao on fkProfessor = idProfessor join grupo on fkGrupo = idGrupo where idGrupo = 1;

select grupo.nome from professor join avaliacao on fkProfessor = idProfessor join grupo on fkGrupo = idGrupo where idProfessor = 1000;

select * from grupo join aluno on aluno.fkGrupo = idGrupo join avaliacao on avaliacao.fkGrupo = idGrupo join Professor on idProfessor = fkProfessor;

select count(distinct nota) from avaliacao;

select professor.nome , round(avg(nota),2), sum(nota) from professor join avaliacao on idProfessor = fkProfessor group by(professor.nome);

select grupo.nome , round(avg(nota),2), sum(nota) from grupo join avaliacao on idGrupo= fkGrupo group by(grupo.nome);

select professor.nome , min(nota) , max(nota) from professor join avaliacao on idProfessor = fkProfessor group by(professor.nome);

select grupo.nome , min(nota), max(nota) from grupo join avaliacao on idGrupo= fkGrupo group by(grupo.nome);