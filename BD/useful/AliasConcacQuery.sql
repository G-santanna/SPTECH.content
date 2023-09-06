-- AULA 4
USE sptechb;

CREATE TABLE professor (
id int primary key auto_increment,
nome varchar(50) NOT NULL,
cpf CHAR(11) UNIQUE, -- o cpf não pode se repetir
dtAtual DATETIME default current_timestamp,
email varchar(30) default 'Sem e-mail'
);

DESCRIBE professor;

INSERT INTO professor (nome) VALUES
	('Vivian'),
    ('JP'),
    ('Caramico');
    
SELECT * FROM professor;

-- ADD CONSTRAINT 
ALTER TABLE professor ADD COLUMN funcao varchar(40),
	ADD CONSTRAINT chkFuncao 
		CHECK (funcao in ('Monitor', 'Titular'));
        
/*CREATE TABLE professor (
id int primary key auto_increment,
nome varchar(50) NOT NULL,
cpf CHAR(11) UNIQUE, -- o cpf não pode se repetir
dtAtual DATETIME default current_timestamp,
email varchar(30) default 'Sem e-mail',
funcao varchar(40),
constraint chkFuncao 
		CHECK (funcao in ('Monitor', 'Titular')); 
);*/

SELECT * FROM professor;

UPDATE professor SET funcao = 'Titular'
	WHERE id IN (1,2,3);
    
UPDATE professor SET email = 'vivian@sptech.school'
	WHERE id = 1;
    
SELECT funcao FROM professor
	WHERE id = 1;
    
-- APELIDAR - ALIASES
SELECT funcao AS Função FROM professor;
SELECT funcao Função FROM professor;

-- CONCATENAR
SELECT concat(nome, funcao) FROM professor;
SELECT concat(nome,' ', funcao) FROM professor;
SELECT concat('O nome do professor é ', nome,' ', funcao)
 FROM professor;
SELECT concat('O nome do professor é ', nome,' ', funcao) 
	AS Frase FROM professor;