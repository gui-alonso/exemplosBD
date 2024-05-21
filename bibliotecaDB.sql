-- Criação do Banco de Dados
CREATE DATABASE Biblioteca;
USE Biblioteca;

-- Tabela de Livros
CREATE TABLE livros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    autor_id INT,
    ano_publicacao INT,
    FOREIGN KEY (autor_id) REFERENCES autores(id)
);

-- Tabela de Autores
CREATE TABLE autores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    nacionalidade VARCHAR(50)
);

-- Tabela de Empréstimos
CREATE TABLE emprestimos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    livro_id INT,
    data_emprestimo DATE,
    data_devolucao DATE,
    FOREIGN KEY (livro_id) REFERENCES livros(id)
);

-- Inserindo alguns registros de exemplo na tabela de autores
INSERT INTO autores (nome, nacionalidade) VALUES
('Machado de Assis', 'Brasileiro'),
('George Orwell', 'Britânico'),
('Jane Austen', 'Britânico');

-- Inserindo alguns registros de exemplo na tabela de livros
INSERT INTO livros (titulo, autor_id, ano_publicacao) VALUES
('Dom Casmurro', 1, 1899),
('1984', 2, 1949),
('Orgulho e Preconceito', 3, 1813);

-- Inserindo alguns registros de exemplo na tabela de empréstimos
INSERT INTO emprestimos (livro_id, data_emprestimo, data_devolucao) VALUES
(1, '2024-05-01', '2024-05-15'),
(2, '2024-05-10', '2024-06-10'),
(3, '2024-05-05', '2024-05-20');

/* letra a*/
SELECT livros.titulo, autores.nome AS autor
FROM livros
JOIN autores ON livros.autor_id = autores.id
JOIN emprestimos ON livros.id = emprestimos.livro_id
ORDER BY livros.titulo;


/*letra b*/
SELECT autores.nome, COUNT(livros.id) AS quantidade_de_livros
FROM autores
LEFT JOIN livros ON autores.id = livros.autor_id
GROUP BY autores.nome
ORDER BY quantidade_de_livros DESC;


/*letra c*/
SELECT livros.titulo, emprestimos.data_emprestimo
FROM livros
JOIN emprestimos ON livros.id = emprestimos.livro_id
ORDER BY emprestimos.data_emprestimo;

/*letra d*/
SELECT autores.nome, COUNT(emprestimos.id) AS total_emprestimos
FROM autores
JOIN livros ON autores.id = livros.autor_id
JOIN emprestimos ON livros.id = emprestimos.livro_id
GROUP BY autores.nome
ORDER BY total_emprestimos DESC;