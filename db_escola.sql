create database escola;

use escola;

create table Alunos (
	Id int primary key auto_increment not null,
    Nome varchar (100) not null,
    DataNascimento DATE NOT NULL,
    Turma_Id int,
    foreign key (Turma_Id) references Turmas(Id)
);
select * from Alunos;

insert into Alunos (Nome, DataNascimento, Turma_Id) VALUES ('Diego', '2003-02-14', 2);

create table Turmas (
	Id int primary key auto_increment,
    nomeTurma varchar (100) not null,
    professorResponsavel varchar (255)
);
select * from Turmas;

INSERT INTO Turmas (nomeTurma, professorResponsavel) VALUES ('DS AMS', 'Prof Ferraz');

create table Notas (
	Id int primary key auto_increment,
    Aluno_Id int,
    Disciplina varchar (255) not null,
    Nota decimal(4,2) not null,
    foreign key (Aluno_Id) references Alunos(Id)
);
select * from Notas;

/**/
SELECT
    Alunos.Nome,
    Alunos.DataNascimento,
    Notas.Disciplina,
    Notas.Nota
FROM
    Alunos, Notas
WHERE
    Alunos.ID = Notas.Aluno_ID
    AND Alunos.Turma_ID = 2;