use sprint2;

create table pet (id int primary key auto_increment, tipo varchar(45), nome varchar(45), raca varchar(45), dataNasc date)auto_increment = 101;
create table cliente (id int primary key auto_increment, nome varchar(45), sobrenome varchar(45), telefone1 char(11), telefone2 char(11), rua varchar(45), bairro varchar(45), cidade varchar(45), cep char(8));

alter table pet add column idCliente int;
alter table pet add constraint fkPetCliente foreign key (idCliente) references cliente(id);

insert into cliente values
(null, 'João', 'Henrique', '11940028922', '11908007777', 'Rua Brasil', 'José Bonifácio', 'São Paulo', '08485405'),
(null, 'Gustavo', 'Henrique','11940028922', '11908007777', 'Rua Arroio Triunfo', 'Cidade Tiradentes', 'São Paulo', '08485430'),
(null, 'Maria', 'Eduarda', '11940028922', '11908007777', 'Rua Arroio Triunfo', 'Cidade Tiradentes', 'São Paulo', '08485430');

insert into pet values
(null, 'Cachorro', 'Nina', 'Shih-tzu', '2020-04-10', 2),
(null, 'Cachorro', 'Bob', 'Shih-tzu', '2020-07-20', 3),
(null, 'Gato', 'Tom', 'Scottish Fold', '2022-06-30', 2);

select * from cliente;
select * from pet;

alter table cliente modify column nome varchar(100);

select * from pet where tipo = 'Cachorro';

select nome, dataNasc from pet;

select * from pet order by nome asc;

select * from cliente order by bairro desc;

select * from pet where nome like 'B%';

select * from cliente where sobrenome = 'Henrique';

update cliente set telefone1 = '11986759080' where id = 1;

select * from cliente where id = 1;

select * from pet join cliente on cliente.id = idCliente;

select * from pet join cliente on cliente.id = idCliente where cliente.id = 2;

delete from pet where id = 102;

select * from pet;

drop table pet;
drop table cliente;