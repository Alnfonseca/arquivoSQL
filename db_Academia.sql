-- apagando o bd
drop database dbAcademia; 
-- criando banco de dados
create database dbAcademia;
--acessando o banco de dados
use dbAcademia;
-- visializar o banco de dados
show databases;
--criando tabelas
create table tbUsuarios(
    codigo int,
    nome varchar(50),
    senha varchar(50)
);
create table tbFuncionarios(
    codigo int(100),
    email varchar(100),
    cpf char(14)
);
-- visualizar as tableas criadas
show tables;
-- visualizar a estrutura da tabela
desc tbUsuarios;
desc tbFuncionarios;

