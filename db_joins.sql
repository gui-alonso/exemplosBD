CREATE DATABASE JOINS;

use joins;

CREATE TABLE AUTOR(
	ID_AUTOR INT auto_increment primary KEY,
    NOME_AUTOR VARCHAR(30)
);

CREATE TABLE LIVRO(
	ID_LIVRO INT auto_increment primary key,
    NOME_LIVRO varchar(30),
    FK_A INT,
    foreign key(FK_A) references AUTOR(ID_AUTOR)
);

ALTER TABLE LIVRO auto_increment = 50;

INSERT INTO AUTOR (NOME_AUTOR) VALUES
('Paola'),
('Reinaldo'),
('Felipe'),
('Antonia'),
('João');


INSERT INTO LIVRO (NOME_LIVRO, FK_A) VALUES
('Algoritmos', 5),
('BD', 1),
('Python', 3),
('C#', null),
('Java', 2);

/*INNER JOIN*/
select NOME_AUTOR, NOME_LIVRO FROM
	AUTOR
INNER JOIN
	LIVRO
ON
	AUTOR.ID_AUTOR = LIVRO.FK_A;

/*LEFT JOIN*/
select NOME_AUTOR, NOME_LIVRO FROM
	AUTOR
LEFT JOIN
	LIVRO
ON
	AUTOR.ID_AUTOR = LIVRO.FK_A;

/*RIGHT JOIN*/
select NOME_AUTOR, NOME_LIVRO FROM
	AUTOR
right JOIN
	LIVRO
ON
	AUTOR.ID_AUTOR = LIVRO.FK_A;
