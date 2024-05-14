CREATE DATABASE escola3;

use escola3;

CREATE TABLE alunos (
    aluno_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    idade INT,
    turma VARCHAR(10)
);

/* REGISTROS DA TABELA ALUNOS*/
INSERT INTO alunos (nome, idade, turma) VALUES
('João', 15, 'A'),
('Maria', 16, 'B'),
('Pedro', 14, 'A'),
('Ana', 15, 'B');

CREATE TABLE notas (
    nota_id INT AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT,
    disciplina VARCHAR(20),
    nota INT,
    FOREIGN KEY (aluno_id) REFERENCES alunos(aluno_id)
);

/* REGISTROS DA TABELA NOTAS*/
INSERT INTO notas (aluno_id, disciplina, nota) VALUES
(1, 'Matemática', 90),
(2, 'Matemática', 95),
(3, 'Matemática', 100),
(4, 'Matemática', 85),
(1, 'História', 80),
(2, 'História', 75),
(3, 'História', 85),
(4, 'História', 90);

SELECT * FROM alunos;
SELECT * FROM notas;

/*Consulta com Subconsulta para Encontrar Alunos com Nota Máxima em Matemática*/
SELECT nome
FROM alunos
WHERE aluno_id IN (SELECT aluno_id FROM notas WHERE disciplina = 'Matemática' AND nota = (SELECT MAX(nota) FROM notas WHERE disciplina = 'Matemática'));