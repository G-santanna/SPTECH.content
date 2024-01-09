create database exercicio11;
use exercicio11;

create table Departamento (
	idDepto int primary key,
    nomeDepto varchar(45),
    fkGerente int,
    dataInicioGer date
);

create table Funcionario (
	idFunc int primary key,
    nomeFunc varchar(30),
    salario decimal (6,2),
    sexo varchar(15),
    fkSupervisor int,
    dataNasc date,
    fkDepto int,
    check (sexo in('f','m'))
);
alter table Funcionario add foreign key (fkDepto) references Departamento(idDepto);

create table Projeto(
	idProj int primary key,
    nomeProj varchar(45),
    localProj varchar(45),
    fkDepto int,
    foreign key (fkDepto) references Departamento(idDepto)
);

create table FuncProj (
	fkFunc int,
    fkProj int,
    horas decimal(3,1),
    primary key(fkFunc, fkProj),
    foreign key (fkFunc) references Funcionario(idFunc),
    foreign key (fkProj) references Projeto(idProj)
);

insert into	Departamento values
(105, 'Pesquisa', 2, '2008-05-22'),
(104, 'Administração', 7, '2015-01-01'),
(101, 'Matriz', 8, '2001-06-19');


insert into Funcionario values
(1,'Joao Silva', 3500,'m',2,'1985-01-09', 105),
(2,'Fernando Wong', 4500,'m',8,'1975-12-08', 105),
(3,'Alice Sousa', 2500,'f', 7,'1988-01-19',104),
(4,'Janice Morais', 4300,'f',8,'1970-06-20',104),
(5,'Ronaldo Lima',3800,'m',1,'1982-09-15',105),
(6,'Joice Leite',2500,'f',1,'1992-07-31',105),
(7,'Antonio Pereira',2500,'m',4,'1989-03-29',104),
(8,'Juliano Brito',5500,'m',null,'1957-11-10',101);

insert into Projeto values
(1, 'Produto X', 'Santo André', 105),
(2, 'Produto Y', 'Itu', 105),
(3, 'Produto Z', 'São Paulo', 105),
(10, 'Informatização', 'Mauá', 104),
(20, 'Reorganização', 'São Paulo', 101),
(30, 'Benefícios', 'Mauá', 104);

insert into FuncProj values
(1,1, 32.5),
(1,2,7.5),
(5,3,40.0),
(6,1,20.0),
(6,2,20.0),
(2,2,10.0),
(2,3,10.0),
(2,10,10.0),
(2,20,10.0),
(3,30,30.0),
(3,10,10.0),
(7,10,35.0),
(7,30,5.0),
(4,30,20.0),
(4,20,15.0),
(8,20,null);

alter table departamento add constraint DeptoGer foreign key (fkGerente) references funcionario(idFunc);
alter table funcionario add constraint FuncSuper foreign key (fkSupervisor) references funcionario(idFunc);


select * from Departamento order by idDepto desc;
select * from funcionario;
select * from projeto;
select * from funcProj;

insert into funcionario values
(null, 'Cecília Ribeiro', 2800, 'f', null, '1980-04-05', 104);
-- Column 'idFunc' cannot be null
-- coluna 'idFunc' não pode ser/estart nulo

-- não, idFunc (chave primária da tabela) não pode ser nula

insert into funcionario values
(3, 'Alice Sousa', 2800, 'f', 4, '1980-04-05', 104);
-- Duplicate entry '3' for key 'funcionario.PRIMARY'
-- entrada duplicada '3' para chave

-- não, entrada duplicada pra chave primária da tabela (idFunc), que não pode se repitir

insert into funcionario values
(9, 'Cecília Ribeiro', 2800, 'f', 4, '1980-04-05', 107);
-- Cannot add or update a child row: a foreign key constraint fails (`exercicio11`.`funcionario`, CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`fkDepto`) REFERENCES `departamento` (`idDepto`))
-- não pode adicionar ou atualizar uma linha filha: uma regra de chave estrangeira falha

-- não, o campo fkDepto deve referenciar um registro existente, e o Departamento de id 107 não existe

insert into funcionario values
(9, 'Cecília Ribeiro', 2800, 'f', 4, '1980-04-05', 104);

-- sim, desta vez o idFunc não é nem repitido e nem nulo, e o idDepto 104 já existe no nosso banco de dados

delete from funcProj where fkFunc = 3 and fkProj = 10;

-- sim, porque nenhum campo da tabela funcProj é referenciado nas relações entre as entidades

delete from funcionario where idFunc = 4;
-- Cannot delete or update a parent row: a foreign key constraint fails (`exercicio11`.`funcproj`, CONSTRAINT `funcproj_ibfk_1` FOREIGN KEY (`fkFunc`) REFERENCES `funcionario` (`idFunc`))
-- não pode deletar ou atualizar uma linha mãe;

-- não, porque o idFunc = 4 é referenciado em alguma relação entre entidades no banco de dados, e existe alguma tupla com essa chave estrangeira

delete from funcionario where idFunc = 2;

-- não, porque o idFunc = 2 é referenciado em alguma relação entre entidades no banco de dados, e existe alguma tupla com essa chave estrangeira

update funcionario set salario = 2800 where idFunc = 3;

-- sim, o campo salário não é utilizado como identificador de registro, então ele não estará presente em nenhuma relação, por isso sua alteração não da muitos problemas

update funcionario set fkDepto = 101 where idFunc = 3;

-- sim, porque o Departamento com identificação 101 existe, caso ele não existisse, essa alteração não poderia ser executada

update funcionario set fkDepto = 107 where idFunc = 3;
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`exercicio11`.`funcionario`, CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`fkDepto`) REFERENCES `departamento` (`idDepto`))


-- não, porque o Departamento com identificação 107 não existe, então a chave estrangeira não pode referenciar um registro que não existe

select salario, dataNasc from funcionario where idFunc = 1;

-- 

select salario from funcionario;

--

select distinct salario from funcionario;

--

select * from funcionario order by nomeFunc;

--

select * from funcionario order by salario desc;

--

select * from funcionario where salario >= 2000 and salario <= 4000;

--

select nomeFunc, salario from funcionario where nomeFunc like 'J%';

--

select nomeFunc, salario from funcionario where nomeFunc like '%a';

--

select nomeFunc from funcionario where nomeFunc like '__n%';

--

select nomeFunc, dataNasc from funcionario where nomeFunc like'%s____';

--

select * from funcionario where fkDepto = 105;

--

select * from funcionario where fkDepto = 105 and salario >= 3500;

--

select * from funcionario where fkDepto = 105 and nomeFunc like 'J%';

--

select func.idFunc as idFuncionario, func.nomeFunc, supervisor.idFunc as idSupervisor, supervisor.nomeFunc 
from funcionario as func 
join funcionario as supervisor on func.fkSupervisor = supervisor.idFunc;

--

select idProj from projeto 
join departamento on projeto.fkDepto = idDepto 
join funcionario on fkGerente = idFunc;

--

select idFunc, nomeFunc, idProj, nomeProj, horas from funcProj join funcionario on fkFunc = idFunc join projeto on fkProj = idProj;

--

select nomeFunc from funcionario where dataNasc < '1980-01-01';

--

select count(distinct salario) from funcionario;

--

select count(distinct localProj) from projeto;

--

select avg(salario) as média, sum(salario) as soma from funcionario;

--

select min(salario), max(salario) from funcionario;

--

select idDepto, avg(salario) as média, sum(salario) as soma from departamento join funcionario on fkDepto = idDepto group by idDepto;

--

select idDepto, avg(salario) as média, sum(salario) as soma from departamento join funcionario on fkDepto = idDepto group by idDepto;

--

insert into funcionario values
(10, 'José da Silva', 1800, 'm', 3, '2000-10-12', null),
(11, 'Benedito Almeida', 1200, 'm', 5, '2001-09-01', null);

--

insert into departamento values
(110, 'RH', 3, '2018-11-10');





select * from departamento join projeto on idDepto = fkDepto
join funcproj on fkproj = idproj
join funcionario on fkfunc = idFunc;








select sum(func.salario), round(avg(distinct func.salario), 2) from funcionario as func
join funcionario as supervisor on func.fksupervisor = supervisor.idfunc;


delete from funcproj where fkfunc = 4 or fkproj = 4;