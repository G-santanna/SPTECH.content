-- Aula relacionamento N-M
-- Revisão S2

create database consulta;
use consulta;

create table paciente(
	idPaciente int primary key auto_increment,
    nome varchar(45)
);

insert into paciente (nome) values
('Brian'),
('Toretto');

create table medico(
	idMedico int primary key auto_increment,
    nome varchar(45),
    salario decimal(10,2)
)auto_increment = 100;

insert into medico(nome, salario) values
('Mia', 100.99),
('Letty', 200.99),
('Han', 99.99);

-- tabela associativa
-- sempre fraca
-- chave composta

create table consulta(
	idConsulta int auto_increment,
    fkMedico int,
    fkPaciente int,
    primary key (idConsulta, fkMedico, fkPaciente),
    dtConsulta datetime,
    constraint fkMedicoConsulta foreign key (fkMedico) references medico(idMedico),
    constraint fkPacienteConsulta foreign key (fkPaciente) references paciente(idPaciente)
);	

insert into consulta values
(1, 100, 1, '2023-10-30 14:00'),
(2, 100, 1, '2023-11-07 14:00'),
(1, 101, 2, '2023-10-30 14:00');

select * from consulta;

select * from medico join consulta on fkmedico=idmedico join paciente on fkpaciente = idpaciente;


select * from medico join consulta on fkmedico=idmedico join paciente on fkpaciente = idpaciente where dtConsulta like '%2023-10-30%';
