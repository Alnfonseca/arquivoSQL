-- apagar o banco de dados
drop database db_manicure;
create database db_manicure;
-- acessando  banco de dados
use db_manicure;
-- visualizar os bancos
show databases;
-- criando tabelas
create table tb_Produtos(
codProd int,
descricao varchar(100),
quantidade decimal(9,2),
dataEntrada date,
valorUnit decimal(9,2)
);
-- visualizar tabelas
show tables;
-- visualizar a estrutura da tabela
desc tb_Produtos;
-- inserindo registros nas tabelas
insert into tb_Produtos(codProd,descricao,quantidade,dataEntrada,valorUnit)values(1,'Alicate de unha',10,'2023/08/01',5.50);
insert into tb_Produtos(codProd,descricao,quantidade,dataEntrada,valorUnit)values(2,'Algodão',100,'2023/07/01',3.50);
insert into tb_Produtos(codProd,descricao,quantidade,dataEntrada,valorUnit)values(3,'Esmalte ',12,'2023/08/01',15.00);
insert into tb_Produtos(codProd,descricao,quantidade,dataEntrada,valorUnit)values(4,'Acetona',35,'2023/07/01',3.50);
insert into tb_Produtos(codProd,descricao,quantidade,dataEntrada,valorUnit)values(5,'Unha postiça',50,'2023/07/01',9.99);
insert into tb_Produtos(codProd,descricao,quantidade,dataEntrada,valorUnit)values(6,'Unha',50,'2023/07/01',7.99);
insert into tb_Produtos(codProd,descricao,quantidade,dataEntrada,valorUnit)values(7,'Postiça',50,'2023/07/01',10.00);
-- visualizar os regitros dentro das tabelas
select * from tb_Produtos;
-- alterando registros da tabela
update tb_Produtos set descricao = 'Palito de unha', valorUnit = 1.35 where codProd = 6;
update tb_Produtos set descricao = 'Mascara de proteção', valorUnit = 20.50 where codProd = 7;
select * from tb_Produtos;
-- apagar registros das tabelas 
delete from tb_Produtos where codProd = 7;
select * from tb_Produtos;