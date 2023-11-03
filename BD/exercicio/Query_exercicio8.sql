create database venda;
use venda;

create table cliente(
	idCliente int primary key auto_increment,
    nome varchar(45),
    email varchar(45),
	rua varchar(45),
    cidade varchar(45),
    fkIndicador int,
    constraint fkIndiquei foreign key (fkIndicador) references cliente(idCliente)
);

create table venda(
	idVenda int primary key auto_increment,
    valorTotal decimal(10,2),
    dtVenda datetime,
    fkCliente int,
    constraint fkClienteVenda foreign key (fkCliente) references cliente(idCliente)
);

create table produto(
	idProduto int primary key auto_increment,
    nome varchar(45),
    descProd varchar(45),
    preco decimal(10,2)
);

create table carrinho(
	fkVenda int,
    fkProduto int,
    qntProduto int,
    constraint fkVendaCarrinho foreign key (fkVenda) references venda(idVenda),
    constraint fkProdutoCarrinho foreign key (fkProduto) references produto(idProduto)
);

insert into cliente(nome, email) values
('Gustavo', 'Gustavo@email.com');

insert into cliente(nome, email, fkIndicador) values
('Kleber', 'kleber@email.com', 1),
('Jorge', 'jorge@email.com', 1);

insert into produto(nome, descProd, preco) values
('PS5', 'Console de VídeoGame', 5000.00),
('VW Santana', 'Carrinho de brinquedo', 50.00),
('Camisa SPFC', 'Camisa Oficial do São Paulo Futebol Clube', 349.90);

insert into venda(valorTotal, dtVenda, fkCliente) values
(399.90, current_timestamp(), 2),
(5349.90, current_timestamp(), 3);

insert into carrinho values
(1,2,1),
(1,3,1);

select * from cliente;
select * from venda;
select * from produto;
select * from carrinho;

select * from cliente join venda on idCliente = venda.fkCliente;

select * from cliente join venda on idCliente = venda.fkCliente where idCliente = 3;

select * from cliente as indicador join cliente as indicado on indicado.fkIndicador = indicador.idCliente;

select * from cliente as indicador join cliente as indicado on indicado.fkIndicador = indicador.idCliente where indicador.idCliente = 1;

select * from cliente as indicador join cliente as indicado on indicado.fkIndicador = indicador.idCliente join venda on venda.fkCliente = indicado.idCliente join carrinho on idVenda = fkVenda join produto on fkProduto = idProduto;

select dtVenda, produto.nome, carrinho.qntProduto from venda join carrinho on fkVenda = idVenda join produto on fkProduto = idProduto;

insert into cliente values
(null, 'Matheus', 'matheus@email.com', null, null, 1);

select * from cliente left join venda on fkCliente = idCliente;