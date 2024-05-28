use escola;

select * FROM alunos;

alter table alunos drop column Idade;
/* ADD UMA NOVA COLUNA ABAIXO DO NOME, POR EXEMPLO*/
alter table alunos add column Idade int after Nome;

insert into alunos (Nome, Idade, DataNascimento, Turma_Id) values ("João", 15, '2009-03-15', 1);

SELECT * FROM alunos WHERE Turma_Id = 1;

create table cursos (
	Id int primary key auto_increment,
    NomeCurso varchar(255) not null
);

INSERT INTO cursos (NomeCurso) VALUES
('BD II'),
('PW II'),
('PAM I');

select * from cursos;

insert into turmas (nomeTurma, professorResponsavel) values ('DS', 'Marcio');

select * from turmas;

ALTER TABLE alunos
ADD COLUMN Curso_ID INT,
ADD FOREIGN KEY (Curso_ID) REFERENCES Cursos(ID);

SELECT 
    alunos.Nome AS Nome,
    cursos.NomeCurso,
    notas.Nota
FROM 
    alunos
INNER JOIN 
    cursos ON alunos.Curso_ID = cursos.ID
LEFT JOIN 
    notas ON alunos.ID = notas.Aluno_ID;
    
/**/

select * from cursos;

SELECT
    Alunos.Nome AS NomeAluno,
    Cursos.NomeCurso
FROM
    Alunos
LEFT JOIN
    Cursos ON Alunos.Curso_ID = Cursos.ID;
    
    /**/
    
    SELECT 
    Alunos.Nome AS NomeAluno,
    Cursos.NomeCurso
FROM 
    Alunos
RIGHT JOIN 
    Cursos ON Alunos.Curso_ID = Cursos.ID;
