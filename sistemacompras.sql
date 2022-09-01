show databases;

create database if not exists sistema_compras;
use sistema_compras;

DROP TABLE IF EXISTS fornecedorr;
CREATE TABLE fornecedorr(
id_fornecedor int primary key auto_increment,
nome_fornecedor varchar(30)  not null,
endereco text(100),
CNPJ char(14) unique,
contato_fornecedor int not null

);
insert into fornecedor (nome_fornecedor, CNPJ, endereco, contato_fornecedor) values
('jessica','4422315679031','Rua Duque de Caxias 102','0303456234');
insert into fornecedor (nome_fornecedor,CNPJ,endereco,contato_fornecedor) values
('Heitor', '12263725148536', 'Rua Joaquim 03', '03036751242');

DROP TABLE IF EXISTS estoques;
create table estoques( 
id_estoque int primary key auto_increment,
nome_estoque varchar(20),
endereço_estoque varchar(30)

);

DROP TABLE IF EXISTS produtos;

create table produtos(
id_produto int primary key auto_increment,
nome_produto varchar(20),
preco_produto decimal(30),
descricao_produto varchar(100),
idFornecedor_Pdt int,
idEstoque_Pdt int,

constraint fk_produto_fornecedora foreign key (idFornecedor_Pdt) references fornecedor(id_fornecedor),

constraint fk_produto_estoquee foreign key (idEstoque_Pdt) references estoque(id_estoque)

);

Select * From produto;

insert into produto (nome_produto, preco_produto, descricao_produto) values
('Livro Percy Jackson', '100.0', 'Livro sobre mitologia grega, com deuses e semideusess e suas aventuras');

DROP TABLE IF EXISTS clientes;
create table clientes(
id_cliente int primary key auto_increment,
nome_cliente varchar(30),
CPF char(11) unique,
contato_cliente int,
endereco_cliente varchar(40)

);
insert into cliente (nome_cliente, CPF, contato_cliente, endereco_cliente) values
('José da Silva', '11435632145', '96785641', 'Rua São Paulo 21'),
('Maria da Silva', '13781732615','Rua Carmen 432');


DROP TABLE IF EXISTS pedidos;
create table pedidos(
id_Pedido int primary key auto_increment,
idcliente_Pdd int,
idproduto_Pdd int,


constraint fk_pedido_clientes foreign key (idcliente_Pdd) references cliente(id_cliente),
constraint fk_pedido_produtos  foreign key (idproduto_Pdd) references produto(id_produto)


);

DROP TABLE IF EXISTS pagamentos;
create table pagamentos(
id_pagamento int primary key auto_increment,
idCliente_Pag int,
tipo_pagamento varchar(20),
constraint fk_pagamento_cliente foreign key (idcliente_Pag) references cliente(id_cliente)

);
insert into pagamentos (tipo_pagamento) values 
('pix');

DROP TABLE IF EXISTS rastreamento;
create table rastreamento(
id_rastreio int primary key auto_increment,
idPedido_Rastreio int,
idCliente_Rastreio int,
cod_rastreio varchar(20),
status_pedido varchar(30),
constraint fk_rastreamento_cliente foreign key (idCliente_Rastreio) references cliente(id_cliente),
constraint fk_rastreamento_pedido foreign key (idPedido_Rastreio) references pedido(id_pedido)

);

insert into rastreamento( status_pedido, cod_rastreio) values
('Em rota de entrega','123287284-BR');

--  clientes por nomes
select *  from clientes
order by nome_cliente;

-- use where 

select * from information_schema.table_constraints
where constraint_schema = 'fornecedor';


ALTER TABLE CLIENTE 
ADD Emaills            varchar(30);

select produto,
count(preco_produto) as produto
group by cliente
having count(preco_produto) < 200;
