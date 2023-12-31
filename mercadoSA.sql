drop database dbmercadoSA;
create database dbmercadoSA;
use dbmercadoSA;
create table tbfuncionarios(
codfunc int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
cpf char(14) not null unique,
salario decimal(9,2) default 0 check(salario >= 0),
sexo char(1) default 'F' check(sexo in('F','M')),
primary key(codfunc)
);
create table tbClientes(
codcli int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
telcel char(10),
primary key (codcli)
);
create table tbfornecedores(
codforn int not null auto_increment,
nome varchar(100)not null,
email varchar(100),
cnpj char(18) not null unique,
primary key(codforn)
);
create table tbusuarios(
codusu int not null auto_increment,
nome varchar(50) not null,
senha varchar(20) not null,
codfunc int not null,
primary key (codusu),
foreign key (codfunc) references tbfuncionarios(codfunc)
);
create table tbprodutos(
codprod int not null auto_increment,
descricao varchar(100),
dataEntrada date,
horaEntrada time,
quantidade decimal(9,2),
valorunit decimal (9,2),
primary key (codprod),
codforn int not null,
foreign key(codforn) references tbfornecedores(codforn)
);
create table tbvendas(
codvendas int not null auto_increment,
codusu int not null,
codcli int not null,
codprod int not null,
datavenda date,
quantidade decimal(9,2),
valortotal decimal(9,2),
primary key (codvendas),
foreign key(codusu) references tbusuarios(codusu),
foreign key(codcli) references tbClientes(codcli),
foreign key(codprod) references tbprodutos(codprod)
);
desc tbfuncionarios;
desc tbClientes;
desc tbfornecedores;
desc tbusuarios;
desc tbprodutos;
desc tbvendas;

-- inserir registros nas tabelas
insert into tbfuncionarios(nome,email,cpf,salario,sexo) values ("José Afonso de Souza","jafonsosouza@gmail.com",'124.214.253.86',1500.00,"M");
insert into tbClientes(nome,email,telcel)values ("Alberto Araujo","albertoaraujo@gmail.com",'98231-3241');
insert into tbClientes(nome,email,telcel)values ("Luciano","luluaraujo@gmail.com",'91331-3221');
insert into tbfornecedores(nome,email,cnpj)values ("Alimentos SA","saalimentos.hotmail.com",'22.222.111.0001/15');
insert into tbfornecedores(nome,email,cnpj)values ("Verduras LTDA","verduras.saldaveis@hotmail.com",'23.258.145.0001/25');
insert into tbusuarios(nome,senha,codfunc)values ("pedro",'123456',1);
insert into tbprodutos(descricao,dataEntrada,horaEntrada,quantidade,valorunit,codforn) values ("Banana","2023/08/10","16:53",10,5.50,2);
insert into tbprodutos(descricao,dataEntrada,horaEntrada,quantidade,valorunit,codforn) values ("Morango","2023/08/09","16:00",100,5.35,1);
insert into tbprodutos(descricao,dataEntrada,horaEntrada,quantidade,valorunit,codforn) values ("Bicicleta","2023/08/06","12:34",80,850,1);
insert into tbvendas(codusu,codcli,codprod,datavenda,quantidade,valortotal) values (1,1,2,"2023/08/10",10,50.00);
insert into tbvendas(codusu,codcli,codprod,datavenda,quantidade,valortotal) values (1,2,1,"2023/08/10",20,30.00);
insert into tbvendas(codusu,codcli,codprod,datavenda,quantidade,valortotal) values (1,2,1,"2023/08/09",20,10.00);
select * from tbfuncionarios;
select * from tbClientes;
select * from tbfornecedores;
select * from tbusuarios;
select * from tbprodutos;
select * from tbvendas;

-- inner join 
select usu.nome as 'Nome do Usuário',
func.nome as 'Nome do Funcionário',
func.email as 'E-mail do Fucnionario'
from tbusuarios as usu
inner join tbfuncionarios as func
on usu.codfunc = func.codfunc;

select forn.nome, forn.nome, forn.cnpj, prod.descricao
from tbprodutos as prod
inner join tbfornecedores as forn
on prod.codforn = forn.codforn;

-- perguntando para a tabela vendas o nome, email, telcel da tabela do cliente e datavenda, valor total da tabela de vendas; 
select cli.nome, cli.email, cli.telcel, vend.datavenda, vend.valortotal 
from tbClientes as cli
inner join tbvendas as vend
on vend.codcli = cli.codcli;

-- perguntando para a tabela vendas sobre as tabelas cliente e produto;
select cli.nome, cli.email, prod.descricao, vend.datavenda 
from tbvendas as vend
inner join tbClientes as cli
on vend.codcli = cli.codcli
inner join tbprodutos as prod
on vend.codprod = prod.codprod;

--  selecionando com palavras que tem a letra "b"
select cli.nome, cli.email, prod.descricao, vend.datavenda 
from tbvendas as vend
inner join tbClientes as cli
on vend.codcli = cli.codcli
inner join tbprodutos as prod
on vend.codprod = prod.codprod
where prod.descricao like '%b%';

-- selecionando tudo que esta no codigo 1


select usu.nome,func.nome,vend.datavenda, vend.quantidade, vend.valortotal
  from tbusuarios as usu
  inner join tbfuncionarios as func
  on usu.nome = func.nome
  inner join tbvendas as vend
  on usu.codusu = vend.codusu;


  select func.nome as 'func', usu.nome as 'usu', vend.dataVenda, vend.valortotal, prod.descricao, .prod.dataEntrada, forn.nome as 'forn', forn.cnpj
  from tbfuncionarios as func
  inner join tbusuarios as usu
  on usu.codfunc = func.codfunc
inner join tbvendas as vend
on usu.codusu = vend.codusu
inner join tbprodutos as prod
on vend.codprod = prod.codprod
inner join tbfornecedores as forn
on prod.codforn = forn.codforn;

-- Perguntar para a tabela funcionario quais os produtos cadastrados
-- left
select prod.descricao, prod.quantidade from tbfuncionarios as func
left join tbprodutos as prod on func.codfunc = prod.codprod;

-- right
select prod.descricao, prod.quantidade from tbfuncionarios as func
right join tbprodutos as prod on func.codfunc = prod.codprod;

-- inner
select prod.descricao, prod.quantidade from tbfuncionarios as func
inner join tbprodutos as prod on func.codfunc = prod.codprod;
