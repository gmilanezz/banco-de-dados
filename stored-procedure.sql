create database jogo
use jogo

create table personagens(
id int primary key identity (1,1),
nome varchar (25) not null,
habilidade varchar (25) not null,
)

create table itens(
id int primary key identity (1,1),
nome varchar (25) not null,
poder varchar (50) not null,
forca varchar (2) not null,
agilidade varchar (2) not null,
defesa varchar (2) not null
)

create table personagemItem (
id int primary key identity (1,1),
idItem int not null,
idPersonagem int not null,
constraint fk_personagemItem_itens foreign key (idItem)
references itens (id),
constraint fk_personagemItem_personagens foreign key (idPersonagem)
references personagens (id)
)

create procedure inserirP
@nome varchar (25),
@habilidade varchar (25)
as
insert into personagens(nome, habilidade)
values(@nome, @habilidade)
select nome, habilidade from personagens

create procedure inserirI
@nome varchar (25),
@poder varchar (50),
@forca varchar (2),
@agilidade varchar (2),
@defesa varchar (2)
as
insert into itens (nome, poder, forca, agilidade, defesa)
values(@nome, @poder, @forca, @agilidade, @defesa)
select nome, poder, forca, agilidade, defesa from itens

create procedure inserirPI
@idItem int, 
@idPersonagem int
as
insert into personagemItem(idItem, idPersonagem)
values(@idItem, @idPersonagem)
select idItem, idPersonagem from personagemItem

select p.nome, p.habilidade i.nome, i.poder, i.forca, i.agilidade, i.defesa, x.idItem, x.idPersonagem from personagemItem x 
inner join personagem p on x.idPersonagem = personagens.id inner join itens i on x.idItem = itens.id
