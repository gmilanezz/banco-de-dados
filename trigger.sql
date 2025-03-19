create database aulaTrigger

use aulaTrigger

create table caixa(
	id int primary key identity(1,1),
	dataVenda date,
	saldo_inicial float,
	saldo_final float
)

create table vendas(
	id int primary key identity(1,1),
	dataVenda date,
	valor float
)

create trigger tgr_novaVenda
	on vendas for insert
	as
	begin
		declare
		@valor float,
		@data datetime
		select @data = dataVenda, @valor = valor from inserted
		update caixa set saldo_final = saldo_final + @valor
		where dataVenda = @data
	end

insert into caixa (dataVenda, saldo_final, saldo_inicial)
values(getdate(),0,0)

select * from caixa
select * from vendas

insert into vendas(dataVenda, valor)
values(getdate(),50)

create trigger tgr_novaVenda_delete
	on vendas for delete
	as
	begin
		declare
		@valor float,
		@data datetime
		select @data = dataVenda, @valor = valor from deleted
		update caixa set saldo_final = saldo_final - @valor
		where dataVenda = @data
	end

insert into caixa (dataVenda, saldo_final, saldo_inicial)
values(getdate(),0,0)

select * from caixa
select * from vendas

delete from vendas
where id = 2