-- RELACIONAMENTO FORTE E 
-- RELACIONAMENTO RECURSIVO

-- LEFT & RIGHT JOIN
-- is null]

-- PK COMPOSTA

create database convenio;
use convenio;

create table funcionario(
	idFunc int primary key auto_increment,
    nome varchar(45),
    sobrenome varchar(45),
    emailP varchar(45),
    emailS varchar(45),
    fkSuper int,
    constraint fkFuncSuper foreign key (fkSuper) references funcionario(idFunc)
);

-- INSERIR O SUPERVISOR PRIMEIRO

insert into funcionario(nome, emailP) values 
('Dumbledore', 'dumb@hh.com');

-- INSERIR OS FUNCIONARIOS

insert into funcionario(nome, emailP, fkSuper) values
('Harry', 'harry@hh.com', 1),
('Hermione', 'hermione@hh.com', 1),
('Rony', 'rony@hh.com', 1),
('Malfoy', 'Malfoy@hh.com', null);

select f.nome as NomeFuncionario, s.nome as NomeSupervisor from funcionario as f join funcionario as s on f.fkSuper = s.idFunc;

create table dependente(
	idDep int,
    fkFunc int,
    primary key(idDep, fkFunc),
    nome varchar(45),
	parentesco varchar(45),
    dtNasc date,
    constraint fkFuncDep foreign key (fkFunc) references funcionario(idFunc)
);

insert into dependente values
(1,2, 'Dobby', 'primo', '2000-10-13'),
(2,2, 'Coruja', 'prima', '2000-10-23'),
(1,4, 'Rato', 'tio', '2000-10-18');

select * from dependente;

select * from funcionario join dependente on idFunc = fkFunc;

select f.nome as nomeFunc ,s.nome as nomeSuper, d.nome as nomeDep from funcionario as f join funcionario as s on f.fkSuper = s.idFunc join dependente as d on f.idFunc = d.fkFunc;

-- LEFT JOIN
select * from funcionario as funcionario left join funcionario as supervisor on funcionario.fkSuper = supervisor.idFunc;

-- FUNCIONARIOS SEM SUPERVISOR
select * from funcionario as funcionario left join funcionario as supervisor on funcionario.fkSuper = supervisor.idFunc where funcionario.fkSuper is null;
