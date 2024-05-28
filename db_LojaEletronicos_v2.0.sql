-- Criando o banco de dados
CREATE DATABASE LojaEletronicos;

-- Usando o banco de dados criado
USE LojaEletronicos;

-- Criando a tabela de produtos
CREATE TABLE produtos (
    produto_id INT PRIMARY KEY,
    nome VARCHAR(50),
    categoria VARCHAR(50),
    preço DECIMAL(10, 2),
    quantidade_estoque INT
);

-- Criando a tabela de vendas
CREATE TABLE vendas (
    venda_id INT PRIMARY KEY,
    produto_id INT,
    quantidade INT,
    total DECIMAL(10, 2),
    data_venda DATE,
    FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);

CREATE TABLE compras (
    compra_id INT PRIMARY KEY,
    cliente_id INT,
    produto_id INT,
    quantidade INT,
    data_compra DATE,
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);

INSERT INTO compras (compra_id, cliente_id, produto_id, quantidade, data_compra) VALUES
(1, 1, 1, 2, '2024-04-01'),
(2, 2, 2, 1, '2024-04-02'),
(3, 3, 3, 1, '2024-04-03'),
(4, 4, 1, 3, '2024-04-04'),
(5, 5, 4, 5, '2024-04-05'),
(6, 6, 2, 2, '2024-04-06'),
(7, 7, 3, 2, '2024-04-07'),
(8, 8, 1, 1, '2024-04-08'),
(9, 9, 4, 3, '2024-04-09'),
(10, 10, 1, 2, '2024-04-10'),
(11, 11, 3, 1, '2024-04-11'),
(12, 12, 4, 4, '2024-04-12'),
(13, 13, 2, 3, '2024-04-13'),
(14, 14, 1, 2, '2024-04-14'),
(15, 15, 3, 2, '2024-04-15');

SELECT c.nome AS cliente, p.nome AS produto, cp.quantidade, cp.data_compra
FROM clientes c
INNER JOIN compras cp ON c.cliente_id = cp.cliente_id
INNER JOIN produtos p ON cp.produto_id = p.produto_id;

ALTER TABLE compras
ADD COLUMN vendedor_id INT,
ADD FOREIGN KEY (vendedor_id) REFERENCES vendedores(vendedor_id);

UPDATE compras
SET vendedor_id = 1 -- Supondo que o vendedor 1 tenha realizado todas as vendas
WHERE compra_id BETWEEN 1 AND 5;

UPDATE compras
SET vendedor_id = 2 -- Supondo que o vendedor 2 tenha realizado as próximas cinco vendas
WHERE compra_id BETWEEN 6 AND 10;

UPDATE compras
SET vendedor_id = 3 -- Supondo que o vendedor 3 tenha realizado as últimas cinco vendas
WHERE compra_id BETWEEN 11 AND 15;

SELECT c.nome AS cliente, p.nome AS produto, v.nome AS vendedor, cp.quantidade, cp.data_compra
FROM clientes c
INNER JOIN compras cp ON c.cliente_id = cp.cliente_id
INNER JOIN produtos p ON cp.produto_id = p.produto_id
INNER JOIN vendedores v ON cp.vendedor_id = v.vendedor_id;

SELECT * FROM compras;

ALTER TABLE vendas
ADD CONSTRAINT fk_vendedor
FOREIGN KEY (vendedor_id) REFERENCES vendedores(vendedor_id);

-- Inserindo dados na tabela de produtos
INSERT INTO produtos (produto_id, nome, categoria, preço, quantidade_estoque) VALUES
(1, 'Smartphone', 'Celulares', 1200.00, 50),
(2, 'Notebook', 'Computadores', 2500.00, 30),
(3, 'Smart TV', 'Televisores', 1800.00, 20),
(4, 'Fone de Ouvido', 'Acessórios', 100.00, 100);

-- Inserindo dados na tabela de vendas
INSERT INTO vendas (venda_id, produto_id, quantidade, total, data_venda) VALUES
(1, 1, 2, 2400.00, '2024-04-01'),
(2, 2, 1, 2500.00, '2024-04-02'),
(3, 3, 1, 1800.00, '2024-04-03'),
(4, 1, 3, 3600.00, '2024-04-04'),
(5, 4, 5, 500.00, '2024-04-05');

INSERT INTO vendas (venda_id, produto_id, quantidade, total, data_venda) VALUES
(6, 2, 2, 5000.00, '2024-04-06'),
(7, 3, 2, 3600.00, '2024-04-07'),
(8, 1, 1, 1200.00, '2024-04-08'),
(9, 4, 3, 300.00, '2024-04-09'),
(10, 1, 2, 2400.00, '2024-04-10'),
(11, 3, 1, 1800.00, '2024-04-11'),
(12, 4, 4, 400.00, '2024-04-12'),
(13, 2, 3, 7500.00, '2024-04-13'),
(14, 1, 2, 2400.00, '2024-04-14'),
(15, 3, 2, 3600.00, '2024-04-15');

select * from produtos;
select * from vendas;

-- Consulta usando GROUP BY para contar quantas vendas foram feitas de cada produto
SELECT produtos.nome AS produto, COUNT(vendas.venda_id) AS total_vendas
FROM produtos
INNER JOIN vendas ON produtos.produto_id = vendas.produto_id
GROUP BY produtos.nome;

-- Consulta usando ORDER BY para listar os produtos em ordem crescente de preço
SELECT nome, categoria, preço, quantidade_estoque
FROM produtos
ORDER BY preço;

-- Consulta usando DISTINCT para listar as categorias distintas de produtos
SELECT DISTINCT categoria
FROM produtos;

-- Consulta usando COUNT para contar quantas vendas foram feitas no total
SELECT COUNT(*) AS total_vendas
FROM vendas;

-- Atualizar o preço de um produto
UPDATE produtos
SET preço = 1300.00
WHERE produto_id = 1;

-- Excluir uma venda específica
DELETE FROM vendas
WHERE venda_id = 2;

--
DROP TABLE clientes;
--

SELECT produtos.nome AS produto, COUNT(vendas.venda_id) AS total_vendas
FROM produtos
INNER JOIN vendas ON produtos.produto_id = vendas.produto_id
GROUP BY produtos.nome;

-- TABELA CLIENTES
CREATE TABLE clientes (
    cliente_id INT PRIMARY KEY,
    nome VARCHAR(50),
    email VARCHAR(50),
    telefone VARCHAR(15)
);

-- REGISTROS TABELA CLIENTES
INSERT INTO clientes (cliente_id, nome, email, telefone) VALUES
(1, 'Ana Silva', 'ana@example.com', '(11) 98765-4321'),
(2, 'Carlos Oliveira', 'carlos@example.com', '(11) 91234-5678'),
(3, 'Mariana Santos', 'mariana@example.com', '(11) 92345-6789'),
(4, 'Rafaela Lima', 'rafaela@example.com', '(11) 93456-7890'),
(5, 'João Pereira', 'joao@example.com', '(11) 94567-8901'),
(6, 'Aline Ferreira', 'aline@example.com', '(11) 95678-9012'),
(7, 'Diego Costa', 'diego@example.com', '(11) 96789-0123'),
(8, 'Juliana Martins', 'juliana@example.com', '(11) 97890-1234'),
(9, 'Fernando Oliveira', 'fernando@example.com', '(11) 98901-2345'),
(10, 'Camila Silva', 'camila@example.com', '(11) 99012-3456'),
(11, 'Rodrigo Santos', 'rodrigo@example.com', '(11) 90123-4567'),
(12, 'Bianca Lima', 'bianca@example.com', '(11) 91234-5678'),
(13, 'Lucas Pereira', 'lucas@example.com', '(11) 92345-6789'),
(14, 'Amanda Ferreira', 'amanda@example.com', '(11) 93456-7890'),
(15, 'Gabriel Costa', 'gabriel@example.com', '(11) 94567-8901');

-- TABELA VENDEDORES
CREATE TABLE vendedores (
    vendedor_id INT PRIMARY KEY,
    nome VARCHAR(50),
    email VARCHAR(50),
    telefone VARCHAR(15)
);

-- REGISTROS TABELA VENDEDORES
INSERT INTO vendedores (vendedor_id, nome, email, telefone) VALUES
(1, 'Pedro Sales', 'pedro@example.com', '(11) 98765-4321'),
(2, 'Larissa Mendes', 'larissa@example.com', '(11) 91234-5678'),
(3, 'Mateus Oliveira', 'mateus@example.com', '(11) 92345-6789'),
(4, 'Carolina Santos', 'carolina@example.com', '(11) 93456-7890'),
(5, 'Ricardo Lima', 'ricardo@example.com', '(11) 94567-8901'),
(6, 'Fernanda Ferreira', 'fernanda@example.com', '(11) 95678-9012'),
(7, 'Gustavo Costa', 'gustavo@example.com', '(11) 96789-0123'),
(8, 'Aline Martins', 'aline@example.com', '(11) 97890-1234'),
(9, 'Daniel Pereira', 'daniel@example.com', '(11) 98901-2345'),
(10, 'Vanessa Silva', 'vanessa@example.com', '(11) 99012-3456'),
(11, 'Roberto Santos', 'roberto@example.com', '(11) 90123-4567'),
(12, 'Tatiane Lima', 'tatiane@example.com', '(11) 91234-5678'),
(13, 'Marcos Ferreira', 'marcos@example.com', '(11) 92345-6789'),
(14, 'Patricia Costa', 'patricia@example.com', '(11) 93456-7890'),
(15, 'Luiza Oliveira', 'luiza@example.com', '(11) 94567-8901');

--
ALTER TABLE vendas
ADD COLUMN cliente_id INT,
ADD FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id);

SELECT c.nome AS cliente, p.nome AS produto, v.quantidade, v.total, v.data_venda
FROM clientes c
INNER JOIN vendas v ON v.cliente_id = c.cliente_id
INNER JOIN produtos p ON p.produto_id = v.produto_id;

--

ALTER TABLE vendas
ADD COLUMN vendedor_id INT,
ADD FOREIGN KEY (vendedor_id) REFERENCES vendedores(vendedor_id);

SELECT vendedor.nome AS vendedor, p.nome AS produto, v.quantidade, v.total, v.data_venda
FROM vendedores vendedor
INNER JOIN vendas v ON v.vendedor_id = vendedor.vendedor_id
INNER JOIN produtos p ON p.produto_id = v.produto_id;