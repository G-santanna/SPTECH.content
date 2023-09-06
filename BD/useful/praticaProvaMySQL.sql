CREATE DATABASE continuada1;

USE continuada1;

CREATE TABLE historico (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(200) NOT NULL,
dataHora DATETIME DEFAULT current_timestamp,
url VARCHAR(250) NOT NULL,
navegador VARCHAR(100)
);

INSERT INTO historico (nome, url, navegador) VALUES
	('São Paulo Tech School', 'https://moodle.sptech.school/', 'Microsoft Edge'),
	('Página Inicial - Microsoft Azure', 'https://portal.azure.com/#home', 'Microsoft Edge'),
	('Ofertas e Promoções | Amazon.com.br', 'https://www.amazon.com.br/deals?ref_=nav_cs_gb', 'Firefox Developer Edition'),
	('404 Not Found', 'http://moodletech.azurewebsites.net/', 'Firefox Developer Edition'),
	('Working...', 'https://login.microsoftonline.com/kmsi', 'Firefox Developer Edition'),
	('Email - Usuario Aluno - Outlook', 'https://outlook.office.com/mail/', 'Firefox Developer Edition'),
	('Solicitações - Suporte - Digital Building', 'https://bandtec.sdpondemand.manageengine.com/app/itdesk/ui/requests', 'Firefox Developer Edition'),
	('Carrinho de compras da Amazon.com', 'https://www.amazon.com.br/gp/cart/view.html?ref_=nav_cart', 'Firefox Developer Edition'),
	('MySQL | Begin Your Download', 'https://dev.mysql.com/downloads/file/?id=516926', 'Firefox Developer Edition'),
	('MySQL | Download MySQL Installer', 'https://dev.mysql.com/downloads/installer/', 'Firefox Developer Edition');
    
    SELECT * FROM historico;
    
    SELECT nome, navegador FROM historico;
    
    SELECT * from historico 
    where nome = 'São Paulo Tech School';
    
    SELECT * FROM historico
    ORDER BY nome;
    
    SELECT * FROM historico
    ORDER BY nome DESC;
    
    SELECT * FROM historico
    where nome LIKE '%s%';
    
    SELECT * FROM historico
    WHERE nome LIKE 'e%';
    
    SELECT * FROM historico
    WHERE nome LIKE '%l';
    
    SELECT * FROM historico
    WHERE nome LIKE '%n_';
    
    UPDATE historico
    SET nome = 'trabalhado...'
    where id = 4;
    
    UPDATE historico
    SET NOME = 'amazon'
    WHERE id IN (3, 6);
    
    ALTER TABLE historico
    MODIFY nome varchar(250);
    
    DESCRIBE historico;
    
   
    