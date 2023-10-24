drop database db_LStreetwear;

create database db_LStreetwear;

use db_LStreetwear;

create table tbLogin(
codUsu int not null auto_increment,
usuario varchar(50) not null,
senha varchar(10) not null,
primary key (codUsu)
);

create table tbProdutos(
codUsu int not null,
codProd int not null auto_increment,
nomeProd varchar(100) not null,
marcaProd varchar(100) not null,
quant int(50) not null,
tamanho varchar(2) not null,
dataRep date not null,
preco decimal(5,2) not null,
primary key(codProd),
foreign key	(codUsu) references tbLogin (codUsu)
);

-- insert into	tbLogin (codUsu, usuario, senha) values (1, 'admin', 'admin');

-- insert into tbProdutos(nomeProd, marcaProd, quant, tamanho, dataRep, preco, codUsu) values ('Camisa Corinthans III', 'Nike', 20, 'G','2023/11/10', 299.99, 1);

-- select codUsu from tbLogin;

-- select codProd+1 from tbProdutos order by codProd desc;

update set nomeProd = @nomeProd, marcaProd = @marcaProd, quant = @quant, tamanho = @tamanho, dataRep = @dataRep, preco = @preco, codUsu = @codUsu where codUsu = @codUsu;

select codUsu from tbProdutos where codProd = @codProd;