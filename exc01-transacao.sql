create database excTransacao
use excTransacao

create table pedidos(
	id int primary key identity(1,1),
	idcliente int,
	valor decimal (10,2),
	statusTransacao varchar(50),
)

insert into pedidos (idcliente, valor, statusTransacao) values (1, 500.00, 'pendente')

begin transaction
update pedidos set valor = valor - 500 where idcliente = 1;

commit;

select * from pedidos