-- Funções matemáticas
-- COUNT null não é contado
select * from produto;
select count(preco) from produto;
select count(distinct preco) from produto;

-- DISTINCT valores distintos
select distinct preco from produto;

-- SUM soma
select sum(preco) from produto;

-- AVG
select avg(preco) from produto;
-- ROUND arredondar
select round(avg(preco),2) as 'Média de preço' from produto;

-- MAX
select max(preco) from produto;
-- MIM
select min(preco) from produto;

-- group by
alter table produto add column validade date;
update produto set validade = '2023-11-06'
	where idProduto in (1,2);
update produto set validade = '2025-11-06'
	where idProduto in (3);

select validade, sum(preco) from produto group by validade; 

-- LIMIT
select * from produto order by idProduto desc limit 2;
