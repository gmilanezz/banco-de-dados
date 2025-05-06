create database transacao

use transacao

create table clientes (
	clienteid int primary key,
	nome varchar(100),
	saldo decimal(10,2)
);

insert into clientes(clienteid, nome, saldo)
values(1, 'cliente A', 1000.00), (2, 'cliente B', 500.00);

create procedure transferirSaldoEntreClientes
	@clienteOrigem int,
	@clienteDestinado int,
	@valorTransferencia decimal(10,2)
as
begin
	begin transaction trasnferirSaldo;
if ((select saldo from clientes where clienteid = @clienteOrigem >= @valorTransferencia)
	begin
	update clientes
	set saldo = saldo - @valorTransferencia
	where clienteid = @clienteOrigem;
	update clientes
	set saldo = saldo + @valorTransferencia
	where clienteid = @clienteDestinado;
	commit transaction transferirSaldo;
	print 'transferência realizada com sucesso!'
	end
	else
	begin
	rollback transaction transferirSaldo;
	print 'saldo insuficiente para realizar a transferência'
	end
end;