CREATE TABLE produtos (
	produtoId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	unmedida VARCHAR(10),
	preco FLOAT(10,3),
	estoque FLOAT(10,3),
	ativo TINYINT
);
