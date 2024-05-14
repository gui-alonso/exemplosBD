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


