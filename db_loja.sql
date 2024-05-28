CREATE DATABASE Loja;

USE Loja;

CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(50),
    cidade VARCHAR(50),
    idade INT
);

CREATE TABLE pedidos (
    id INT PRIMARY KEY,
    cliente_id INT,
    produto VARCHAR(50),
    quantidade INT,
    valor_total DECIMAL(10, 2)
);

INSERT INTO clientes (id, nome, cidade, idade) VALUES
(1, 'João', 'São Paulo', 30),
(2, 'Maria', 'Rio de Janeiro', 25),
(3, 'Pedro', 'Belo Horizonte', 35),
(4, 'Ana', 'Salvador', 28),
(5, 'Carlos', 'Fortaleza', 32);

INSERT INTO pedidos (id, cliente_id, produto, quantidade, valor_total) VALUES
(1, 1, 'Camiseta', 2, 50.00),
(2, 2, 'Calça Jeans', 1, 70.00),
(3, 3, 'Tênis', 1, 100.00),
(4, 4, 'Bermuda', 3, 45.00),
(5, 5, 'Jaqueta', 1, 120.00);

-- Exemplo 1: Listar clientes por ordem alfabética de nome
SELECT * FROM clientes ORDER BY nome;

-- Exemplo 2: Listar clientes por idade em ordem decrescente
SELECT * FROM clientes ORDER BY idade DESC;

-- Exemplo 3: Contar quantos clientes existem em cada cidade
SELECT cidade, COUNT(id) AS num_clientes FROM clientes GROUP BY cidade;

-- Exemplo 4: Contar quantos pedidos foram feitos por cliente
SELECT clientes.nome, COUNT(pedidos.id) AS num_pedidos
FROM clientes
LEFT JOIN pedidos ON clientes.id = pedidos.cliente_id
GROUP BY clientes.nome;