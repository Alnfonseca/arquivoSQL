drop database dbLojaABC;

create database dbLojaABC;
use dbLojaABC;

create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100),
email varchar(100),
cpf char(14)unique,
dNasc date,
endereco varchar(100),
cep char(9),
numero char(10),
bairro varchar(100),
estado char(2),
cidade varchar(100),
primary key(codFunc)
);

create table tbUsuarios(
codUsu int not null auto_increment,
usuario varchar(30) not null,
senha varchar(10) not null,
codFunc int not null,
primary key (codUsu),
foreign key	(codFunc) references tbFuncionarios (codFunc) 
);

insert into tbUsuarios(usuario, senha, codFunc)values('admin', 'admin', 2);

	select * from tbUsuarios where usuario = 'admin' and senha = 'admin';
-- insert into tbFuncionarios(nome,email,cpf,dNasc,endereco,cep,numero,bairro,estado,cidade)values();

-- Busca por codigo
select * tbFuncionarios where codFunc = 1;

-- busca por nome
select * tbFuncionarios where nome like	'%m%';

-- inserir um campo de codigo nao existente
select	codFunc+1 from tbFuncionarios order by codFunc desc;

-- buscar funcionarios
from * tbFuncionarios where nome = "@nome";

-- Alterar Funcionários
update tbFuncionarios set nome = @nome, email = @email, cpf = @cpf, dNasc = @dNasc, endereco = @endereco, cep = @cep, numero = @numero, bairro = @bairro, estado = @estado, cidade = @cidade where codFunc = @codFunc;

-- Alterar usuarios
-- update into tbUsuarios set usuario = @usuario, senha = @senha where codUsu = @codUsu;

-- excluindo Funcionarios
delete from tbFuncionarios where codFunc = @codFunc;

select usu.usuario, usu.senha, func.codFunc from tbFuncionarios as func inner join tbUsuarios as usu on func.codFunc = usu.codFunc where nome = 'Roberto';

select codFunc from tbFuncionarios where nome = @nome;