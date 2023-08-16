drop database db_CDS;
create database db_CDS;
use db_CDS;
create table tb_artistas(
cod_art int not null,
nome_art varchar(100) not null unique,
primary key (cod_art)
);

create table tb_gravadoras(
cod_grav int not null,
nome_grav varchar(50) not null unique,
primary key (cod_grav)
);

create table tb_categorias(
cod_cat int not null,
nome_cat varchar(50) not null unique,
primary key (cod_cat)
);

create table tb_estados(
sigla_est char(2) not null,
nome_est varchar(50) not null unique,
primary key (sigla_est)
);

create table tb_cidades(
cod_cid int not null,
sigla_est char(2) not null,
primary key (cod_cid),
foreign key (sigla_est) references tb_estados(sigla_est)
);

create table tb_clientes(
cod_cli int not null,
cod_cid int not null,
nome_cli varchar(50) not null,
end_cli varchar(100) not null,
renda_cli decimal(9,2) not null default 0 check(renda_cli >=0),
sexo_cli char(1) not null default 'F' check(sexo_cli in('F','M')),
primary key (cod_cli),
foreign key (cod_cid) references tb_cidades(cod_cid)
);

create table tb_conjuge(
cod_cli int not null,
cod_conj int not null,
nome_conj varchar(50) not null,
renda_conj decimal(9,2) not null default 0 check(renda_conj >=0),
sexo_conj char (1) not null default 'F' check(sexo_conj in('F','M')),
primary key (cod_conj),
foreign key (cod_cli) references tb_clientes (cod_cli)
);

create table tb_funcionarios(
cod_func int not null,
nome_func varchar(50) not null,
end_func varchar(100) not null,
sal_func decimal(9,2) not null default 0 check(sal_func <= 0),
sexo_func char(1) not null default 'F' check(sexo_func in('F','M')),
primary key (cod_func)
);

create table tb_dependentes(
cod_dep int not null,
cod_func int not null,
nome_dep varchar(100) not null,
sexo_dep char (1) not null default 'F' check(sexo_dep in('F','M')),
primary key (cod_dep),
foreign key (cod_func) references tb_funcionarios(cod_func)
);

create table tb_titulos(
cod_tit int not null,
cod_cat int not null,
cod_grav int not null,
nome_cd varchar(50) not null unique,
val_cd decimal(9,2) not null check( val_cd <= 0),
qntd_estq int not null check(qntd_estq <= 0),
primary key (cod_tit),
foreign key (cod_cat) references tb_categorias(cod_cat)
);

create table tb_pedidos(
num_ped int not null,
cod_cli int not null,
cod_func int not null,
data_ped datetime not null,
val_ped decimal(9,2) not null default 0 check(val_ped >=0),
primary key (num_ped),
foreign key (cod_cli) references tb_clientes(cod_cli),
foreign key (cod_func) references tb_funcionarios(cod_func)
);

create table tb_tit_peidos(
num_ped int not null,
cod_tit int not null,
qntd_cd int not null check(qntd_cd >=1),
val_cd decimal(9,2) not null check(val_cd >0),
foreign key (num_ped) references tb_pedidos(num_ped),
foreign key (cod_tit) references tb_titulos(cod_tit)
);

create table tb_tit_artistas(
cod_tit int not null,
cod_art int not null,
foreign key (cod_tit) references tb_titulos(cod_tit),
foreign key (cod_art) references tb_artistas(cod_art)
);

insert into	tb_artistas(cod_art,nome_art) values (1,"Marisa Monte");
insert into tb_artistas(cod_art,nome_art) values (2,"Gilberto Gil");
insert into tb_artistas(cod_art,nome_art) values (3,"Caetano Veloso");
insert into	tb_artistas(cod_art,nome_art) values (4,"Milton Nascimento");
insert into tb_artistas(cod_art,nome_art) values (5,"legião Urbana");
insert into tb_artistas(cod_art,nome_art) values (6,"The Beatles");
insert into tb_artistas(cod_art,nome_art) values (7,"Rita Lee");


select * from tb_artistas;
select * from tb_gravadoras;
select * from tb_categorias;
select * from tb_estados;
select * from tb_cidades;
select * from tb_clientes;
select * from tb_conjuge;
select * from tb_funcionarios;
select * from tb_dependentes;
select * from tb_titulos;
select * from tb_pedidos;
select * from tb_tit_peidos;
select * from tb_tit_artistas;