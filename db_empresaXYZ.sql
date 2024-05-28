CREATE DATABASE EmpresaXYZ;

use EmpresaXYZ;

CREATE TABLE funcionarios (
    id INT PRIMARY KEY,
    nome VARCHAR(50),
    sobrenome VARCHAR(50),
    departamento_id INT,
    salario DECIMAL(10, 2)
);

CREATE TABLE departamentos (
    id INT PRIMARY KEY,
    nome VARCHAR(50)
);

-- Inserindo dados na tabela 'departamentos'
INSERT INTO departamentos (id, nome) VALUES
(1, 'Vendas'),
(2, 'TI'),
(3, 'Finanças');

-- Inserindo dados na tabela 'funcionarios'
INSERT INTO funcionarios (id, nome, sobrenome, departamento_id, salario) VALUES
(1, 'João', 'Silva', 1, 4000.00),
(2, 'Maria', 'Santos', 2, 3500.00),
(3, 'Pedro', 'Oliveira', 1, 3800.00);

/**/

SELECT departamentos.nome AS departamento, COUNT(funcionarios.id) AS total_funcionarios
FROM funcionarios
INNER JOIN departamentos ON funcionarios.departamento_id = departamentos.id
GROUP BY departamentos.nome;

SELECT nome, sobrenome, departamento_id, salario
FROM funcionarios
ORDER BY sobrenome;

SELECT DISTINCT nome
FROM departamentos;

SELECT departamentos.nome AS departamento, COUNT(funcionarios.id) AS total_funcionarios
FROM funcionarios
INNER JOIN departamentos ON funcionarios.departamento_id = departamentos.id
GROUP BY departamentos.nome;

/* Usamos JOIN para combinar os dados das duas tabelas. */

SELECT
    funcionarios.nome AS nome_funcionario,
    funcionarios.sobrenome AS sobrenome_funcionario,
    departamentos.nome AS nome_departamento
FROM
    funcionarios
JOIN
    departamentos ON funcionarios.departamento_id = departamentos.id;
    
    SELECT
    funcionarios.nome AS nome_funcionario,
    funcionarios.sobrenome AS sobrenome_funcionario,
    departamentos.nome AS nome_departamento
FROM
    funcionarios
INNER JOIN
    departamentos ON funcionarios.departamento_id = departamentos.id;
    
    SELECT
    funcionarios.nome AS nome_funcionario,
    funcionarios.sobrenome AS sobrenome_funcionario,
    departamentos.nome AS nome_departamento
FROM
    funcionarios
LEFT JOIN
    departamentos ON funcionarios.departamento_id = departamentos.id;
    
    
SELECT
    funcionarios.nome AS nome_funcionario,
    funcionarios.sobrenome AS sobrenome_funcionario,
    departamentos.nome AS nome_departamento
FROM
    funcionarios
RIGHT JOIN
    departamentos ON funcionarios.departamento_id = departamentos.id;
    
/**/

SELECT departamento_id, COUNT(id) AS num_funcionarios
FROM funcionarios
GROUP BY departamento_id;

SELECT departamentos.nome AS departamento, COUNT(funcionarios.id) AS num_funcionarios 
FROM departamentos
LEFT JOIN funcionarios ON departamentos.id = funcionarios.departamento_id
GROUP BY departamentos.nome;