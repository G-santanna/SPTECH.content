ALTER TABLE revista ADD CONSTRAINT chkCategoria
	CHECK (categoria IN ('Diversos', 'Infanto-juvenil'));
    
-- ALTER TABLE tabela ADD CONSTRAINT nomeRegra
----- CHECK (colunaRegra IN ('valor1', 'valor2'));
