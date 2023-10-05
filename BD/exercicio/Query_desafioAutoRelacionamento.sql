use sprint2;

create table pessoa(
	id int primary key auto_increment,
    nome varchar(45),
    cpf char(11),
    dtNasc date
);

alter table pessoa add column fkPessoa int;
alter table pessoa add constraint fkPessoa foreign key (fkPessoa) references pessoa(id);

describe pessoa;

insert into pessoa values
(null, 'Adriana','12345678901', '1975-04-07', null),
(null, 'Gustavo','12345678901', '2004-06-17', 1);

select * from pessoa as F join pessoa as M on M.id = F.fkPessoa;