show databases;

create database if not exists loja_roupas;
use loja_roupas;

DROP TABLE IF EXISTS Loja;
create table Loja(
id_loja int primary key auto_increment,
nome_loja varchar(20),
CNPJ varchar(14) unique,
endereco text(30),
contato varchar(15) 
);

insert into Loja (nome_loja,CNPJ,endereco,contato) values 
('roupasmoda', '12542579863431', 'Rua Belo Jardim 21', '9823487943');

DROP TABLE IF EXISTS Cliente;
create table Cliente (
    id_cliente int primary key auto_increment,
    nome varchar(30) NOT NULL,
    cpf char(11) NOT NULL,
    genero varchar(9) NOT NULL, 	-- Feminino // Masculino // Outro
    endereco text(20) NOT NULL,
    contato varchar(9) NOT NULL
    );
    
    insert into Cliente(nome,cpf,genero,endereco,contato) values 
    ('Bruna Beatriz','12359876521','Feminino','Rua Matriz','965871623');
    
    DROP TABLE IF EXISTS Funcionario;
    create table Funcionario ( 
    id int primary key auto_increment,
    nome varchar(30) NOT NULL,
    cpf char(11) NOT NULL,
	cargo varchar(40) NOT NULL

);

insert into Funcionario(nome,cpf,cargo) values
('Maria Clara','12198734556','Atendente');

DROP TABLE IF EXISTS estoquess;
create table estoquess( 
id_estoque int primary key auto_increment,
nome_estoque varchar(20),
endereco_estoque varchar(30)

);

DROP TABLE IF EXISTS Produto;
create table Produto (

    id_produto int primary key  auto_increment,
    nome_produto varchar(100) NOT NULL,
    valor double NOT NULL,
    tipo_produto varchar(20),
    marca varchar(50) NOT NULL,
    quantidade int NOT NULL,
    idEstoque_Pdt int,
    
  constraint fk_produto_estoquee foreign key (idEstoque_Pdt) references estoquess(id_estoque)

 );
 
 insert into Produto(nome_produto,valor,tipo_produto,marca,quantidade) values
 ('Cropped','65.0','blusa','shnei','20');
 
 DROP TABLE IF EXISTS pedidos;
create table pedidos(
id_Pedido int primary key auto_increment,
idcliente_Pdd int,
idproduto_Pdd int,


constraint fk_pedido_clientes foreign key (idcliente_Pdd) references Cliente(id_cliente),
constraint fk_pedido_produtos  foreign key (idproduto_Pdd) references Produto(id_produto)
);



 DROP TABLE IF EXISTS pagamentos;
create table pagamentos(
id_pagamento int primary key auto_increment,
idCliente_Pag int,
tipo_pagamento varchar(20),
constraint fk_pagamento_cliente foreign key (idcliente_Pag) references Cliente(id_cliente)

);
insert into pagamentos (tipo_pagamento) values 
('pix');
 
 --  clientes por nomes
select *  from Cliente
order by nome_cliente;

select * from information_schema.table_constraints
where constraint_schema = 'Produto';

select Produto,
count(valor_produto) as Produto
group by Cliente
having count(valor_produto) < 200;
