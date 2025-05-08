create database exc01
use exc01

create table produtos(
	idproduto int primary key identity(1,1),
	nomeproduto varchar(50),
	estoque int
)

insert into produtos(nomeproduto, estoque)
values('sabonete', '3')

insert into produtos(nomeproduto, estoque)
values('sabonete2', '3')

create procedure atualizarEstoque
	@saldoUnidades int,
	@unidadesAtuais int,
	@unidadesVendidas int,
	@unidadesPosVenda int
as
begin
	begin transaction conferirEstoque;
if ((select estoque from produtos where idproduto = estoque >= @unidadesVendidas)
	begin
	update produtos
	set @saldoUnidades = estoque - @unidadesVendidas
	where idproduto = @unidadesAtuais;
	update produtos
	set @saldoUnidades = estoque + @unidadesVendidas
	where idproduto = @unidadesPosVenda
	commit transaction atualizarEstoque;
	print 'atualização feita com sucesso!'
	end
	else
	begin
	rollback transaction atualizarEstoque;
	print 'estoque não disponível para atualização'
	end;
end;          

select * from produtos