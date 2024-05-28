CREATE DATABASE biblioteca;

use biblioteca;

/*CRIAR A TABELA AUTORES*/
CREATE TABLE Autores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    nacionalidade VARCHAR(255)
);
/*INSERIR DADOS NA ATEBLA AUTORES*/
INSERT INTO Autores (nome, nacionalidade) VALUES
    ('Guilherme', 'Brasileiro'),
    ('Autor2', 'Nacionalidade2'),
    ('Autor3', 'Nacionalidade3');
/*SELECIONAR A TABELA E MOSTRAR OS DADOS*/
SELECT * FROM Autores;
SELECT * FROM Autores WHERE id IN (1,2,3);

drop database biblioteca;
