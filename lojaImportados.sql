CREATE DATABASE lojaImportados;

use lojaImportados;

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    preco DECIMAL(10, 2)
);

CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    produto_id INT,
    quantidade INT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

INSERT INTO clientes (nome, email) VALUES
('João', 'joao@email.com'),
('Maria', 'maria@email.com'),
('Pedro', 'pedro@email.com');

INSERT INTO produtos (nome, preco) VALUES
('Camiseta', 29.99),
('Calça', 49.99),
('Tênis', 79.99);

INSERT INTO pedidos (cliente_id, produto_id, quantidade) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 1),
(3, 1, 1),
(3, 2, 2),
(3, 3, 1);


SELECT c.nome AS cliente, SUM(p.preco * pe.quantidade) AS total_vendas
FROM clientes c
LEFT JOIN pedidos pe ON c.id = pe.cliente_id
LEFT JOIN produtos p ON pe.produto_id = p.id
GROUP BY c.nome
ORDER BY total_vendas DESC;

SELECT p.nome AS produto, SUM(pe.quantidade) AS total_vendido
FROM produtos p
LEFT JOIN pedidos pe ON p.id = pe.produto_id
GROUP BY p.nome
ORDER BY total_vendido DESC;

SELECT c.nome AS cliente, p.nome AS produto, pe.quantidade
FROM pedidos pe
INNER JOIN clientes c ON pe.cliente_id = c.id
INNER JOIN produtos p ON pe.produto_id = p.id;