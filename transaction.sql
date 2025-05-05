create database aulaTransacao
use aulaTransacao

create table contas (
	idconta int primary key,
	saldo decimal(10, 2)
);

insert into contas (idconta, saldo) values (1, 1000.00);
insert into contas (idconta, saldo) values (2, 500.00);

begin transaction
update contas set saldo = saldo - 100 where idconta = 1;
update contas set saldo = saldo + 100 where idconta = 2;

rollback;

commit;

select * from contas