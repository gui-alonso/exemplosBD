-- Criando o banco de dados
CREATE DATABASE ExemploDB;
USE ExemploDB;

-- Criando a tabela de Clientes
CREATE TABLE Clientes (
    ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50),
    Email VARCHAR(50)
);


drop table Clientes;

-- Remover a restrição de chave estrangeira na tabela "Contas"
ALTER TABLE Clientes DROP FOREIGN KEY ClienteID;

-- Criando a tabela de Pedidos
CREATE TABLE Pedidos (
    PedidoID INTEGER PRIMARY KEY AUTO_INCREMENT,
    ClienteID INTEGER,
    Produto VARCHAR(50),
    Quantidade INTEGER,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ID)  -- Referenciando a coluna ID na tabela Clientes
);

-- Inserindo alguns dados de exemplo na tabela de Clientes
INSERT INTO Clientes (Nome, Email) VALUES 
    ('João', 'joao@example.com'),
    ('Maria', 'maria@example.com'),
    ('Pedro', 'pedro@example.com');

INSERT INTO Clientes (Nome, Email) VALUES
	('Antonio', 'antonio@example.com'),
    ('Bianca', 'bianca@exampel.com');

select * from Clientes;

-- Inserindo alguns dados de exemplo na tabela de Pedidos
-- Inserindo registros na tabela Pedidos
INSERT INTO Pedidos (ClienteID, Produto, Quantidade) VALUES
    (1, 'Camiseta', 2),
    (2, 'Calça', 1),
    (3, 'Boné', 3),
    (1, 'Shorts', 1),
    (2, 'Camisa', 2),
    (3, 'Tênis', 1),
    (1, 'Vestido', 1),
    (2, 'Jaqueta', 2),
    (3, 'Sapato', 1),
    (1, 'Saia', 1),
    (2, 'Blusa', 2),
    (3, 'Sandália', 1),
    (1, 'Top', 1),
    (2, 'Meia', 2),
    (3, 'Chapéu', 1);

DELETE FROM Pedidos;
SELECT * FROM Pedidos;

SET SQL_SAFE_UPDATES = 0;

/*COUNT()*/
SELECT count(*) FROM pedidos where ClienteID = 2;

/*ORDER BY*/
select * from Clientes order by nome ASC;

/*DISTINCT - não mostrar valores repetidos*/
select distinct Produto, count(*) from pedidos group by Produto;


/* INNER JOIN*/
-- Consulta para obter os pedidos de cada cliente
SELECT Clientes.Nome, Pedidos.Produto, Pedidos.Quantidade
FROM Clientes
INNER JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID;