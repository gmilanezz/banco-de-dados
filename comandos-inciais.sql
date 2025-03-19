create database lojaDB
use lojaDB

create table clientes(
id int primary key identity(1,1),
nome varchar(100) not null,
email varchar(150),
dataCadastro date not null
)

create table produtos(
id int primary key identity(1,1),
nomeProduto varchar(100) not null,
preco float not null
)

insert into clientes (nome,email,dataCadastro)
values ('Milanez','alex@fiap.com.br','02-11-2025')

insert into clientes (nome,email,dataCadastro)
values ('Henrique','henrique@fiap.com.br','02-11-2025')

insert into clientes (nome,email,dataCadastro)
values ('Nicolas','nicolas@fiap.com.br','02-11-2025')

select * from clientes

insert into produtos(nomeProduto,preco)
values ('Shampoo para carecas',18.99)

insert into produtos(nomeProduto,preco)
values ('Cera automotiva',10)

insert into produtos(nomeProduto,preco)
values ('Boné Santos NeyDay',0.99)

select * from produtos

update produtos set preco=0.79
where id=3

update clientes set email='profalex@fiap.com.br'
where id=1