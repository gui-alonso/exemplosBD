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