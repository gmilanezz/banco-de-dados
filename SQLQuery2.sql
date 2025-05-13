create database exc02
use exc02

create table sala_de_aula(
	salaid int primary key identity(1,1),
	status_livre varchar(10)
)

create table aluno(
	alunoid int primary key identity(1,1),
	aluno_nome varchar(50)
)

create table disciplina(
	disciplinaid int primary key identity(1,1),
	disciplina_nome varchar(50)
)

insert into sala_de_aula values('aberto')
insert into aluno values('milanez')
insert into disciplina values ('matemática')

create procedure statusSalaDeAula
	@disciplina_nome varchar(50),
	@aluno_nome varchar(50),
	@status_livre varchar(10)
as
begin
	begin transaction conferirHorario;
if ((select status_livre from sala_de_aula where status_livre) = 'aberto')
	begin
	select @status_livre
	where @status_livre = 'aberto'
	commit transaction statusSalaDeAula
	print 'sala de aula disponível!'
	end
	else
	begin
	rollback transaction statusSalaDeAula
	print 'sala de aula não-disponível'
	end;

	begin transaction conferirDisciplina;
if ((select @disciplina_nome from disciplina where disciplina_nome) = 'aberto')
	begin
	select @disciplina_nome
	where @disciplina_nome = 'matematica'
	commit transaction conferirDisciplina
	print 'aluno matriculado em matematica'
	end
	else
	begin
	rollback transaction conferirDisciplina
	print 'aluno não está matriculado em matematica'
	end;