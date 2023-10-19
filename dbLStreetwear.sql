drop database db_LStreetwear;

create database db_LStreetwear;

use db_LStreetwear;

create table tbProdutos(
codProd int not null auto_increment,
nomeProd varchar(100) not null,
marcaProd varchar(100) not null,
quant int(50) not null,
tamanho char(2) not null,
dataRep date not null,
preco decimal(5,2) not null,
primary key(codProd)
);

insert into tbProdutos (nomeProd, marcaProd, quant, tamanho, dataRep, preco) values ('Camisa Corinthans III', 'Nike', 20, 'G','2023/11/10' 299.99);