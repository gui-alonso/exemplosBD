create database biblioteca;

use biblioteca;

/*TABELA AUTORES*/
CREATE TABLE Autores (
    autor_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);

/*TABELA LIVROS*/
CREATE TABLE Livros (
    livro_id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100),
    autor_id INT,
    FOREIGN KEY (autor_id) REFERENCES Autores(autor_id)
);

/*TABELA USUÁRIOS*/
CREATE TABLE Usuarios (
    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);

/*TABELA EMPRESTIMO*/
CREATE TABLE Emprestimo (
    emprestimo_id INT PRIMARY KEY AUTO_INCREMENT,
    livro_id INT,
    usuario_id INT,
    data_emprestimo DATE,
    data_devolucao DATE,
    FOREIGN KEY (livro_id) REFERENCES Livros(livro_id),
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(usuario_id)
);

/*INSERIR REGISTROS*/
INSERT INTO Autores (nome) VALUES
('J.K. Rowling'),
('Stephen King'),
('George Orwell'),
('Agatha Christie'),
('Tolkien');

INSERT INTO Livros (titulo, autor_id) VALUES
('Harry Potter e a Pedra Filosofal', 1),
('It: A Coisa', 2),
('1984', 3),
('O Caso dos Dez Negrinhos', 4),
('O Senhor dos Anéis', 5);

INSERT INTO Usuarios (nome) VALUES
('João'),
('Maria'),
('José'),
('Ana'),
('Pedro');

INSERT INTO Emprestimo (livro_id, usuario_id, data_emprestimo, data_devolucao) VALUES
(1, 1, '2024-02-01', '2024-02-15'),
(2, 2, '2024-02-03', '2024-02-17'),
(3, 3, '2024-02-05', '2024-02-20'),
(4, 4, '2024-02-07', '2024-02-22'),
(5, 5, '2024-02-09', '2024-02-24');

-- Consulta: Listar todos os livros emprestados no momento, incluindo título do livro, nome do usuário e data de devolução
SELECT Livros.titulo, Usuarios.nome AS nome_usuario, Emprestimo.data_devolucao
FROM Livros
JOIN Emprestimo ON Livros.livro_id = Emprestimo.livro_id
JOIN Usuarios ON Emprestimo.usuario_id = Usuarios.usuario_id;
