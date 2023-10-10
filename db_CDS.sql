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
nome_cid varchar(50) not null,
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
sal_func decimal(9,2) not null default 0 check(sal_func >= 0),
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
val_cd decimal(9,2) not null check( val_cd >= 0),
qntd_estq int not null check(qntd_estq >= 0),
primary key (cod_tit),
foreign key (cod_cat) references tb_categorias(cod_cat),
foreign key (cod_grav) references tb_gravadoras(cod_grav)
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

create table tb_tit_pedidos(
num_ped int not null,
cod_tit int not null,
qntd_cd int not null check(qntd_cd >=1),
val_cd decimal(9,2) not null check(val_cd > 0),
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


insert into tb_gravadoras(cod_grav,nome_grav) values (1,"POLYGRAM");
insert into tb_gravadoras(cod_grav,nome_grav) values (2,"EMI");
insert into tb_gravadoras(cod_grav,nome_grav) values (3,"SOM LIVRE");
insert into tb_gravadoras(cod_grav,nome_grav) values (4,"SOM MUSIC");


insert into tb_categorias(cod_cat,nome_cat) values (1,"MPB");
insert into tb_categorias(cod_cat,nome_cat) values (2,"Trilha Sonora");
insert into tb_categorias(cod_cat,nome_cat) values (3,"Rock Internacional");
insert into tb_categorias(cod_cat,nome_cat) values (4,"Rock Nacional");


insert into tb_estados(sigla_est,nome_est) values ("SP","São Paulo");
insert into tb_estados(sigla_est,nome_est) values ("MG","Minas Gerais");
insert into tb_estados(sigla_est,nome_est) values ("RJ","Rio de Janeiro");
insert into tb_estados(sigla_est,nome_est) values ("ES","Espirito Santo");


insert into tb_cidades(cod_cid,sigla_est,nome_cid) values (1,"SP","São Paulo");
insert into tb_cidades(cod_cid,sigla_est,nome_cid) values (2,"SP","Sorocaba");
insert into tb_cidades(cod_cid,sigla_est,nome_cid) values (3,"SP","Jundiaí");
insert into tb_cidades(cod_cid,sigla_est,nome_cid) values (4,"SP","Americana");
insert into tb_cidades(cod_cid,sigla_est,nome_cid) values (5,"SP","Araraquara");
insert into tb_cidades(cod_cid,sigla_est,nome_cid) values (6,"MG","Ouro Preto");
insert into tb_cidades(cod_cid,sigla_est,nome_cid) values (7,"ES","Cachoeira do Itaperimim");


insert into tb_clientes(cod_cli,cod_cid,nome_cli,end_cli,renda_cli,sexo_cli) values (1,1,"José Nogueira","Rua A",1500.00,"M");
insert into tb_clientes(cod_cli,cod_cid,nome_cli,end_cli,renda_cli,sexo_cli) values (2,1,"Ângelo Pereira","Rua B",2000.00,"M");
insert into tb_clientes(cod_cli,cod_cid,nome_cli,end_cli,renda_cli,sexo_cli) values (3,1,"Além Mar Paranhos","Rua C",1500.00,"M");
insert into tb_clientes(cod_cli,cod_cid,nome_cli,end_cli,renda_cli,sexo_cli) values (4,1,"Catarina Souza","Rua D",892.00,"F");
insert into tb_clientes(cod_cli,cod_cid,nome_cli,end_cli,renda_cli,sexo_cli) values (5,1,"Vagner Costa","Rua E",950.00,"M");
insert into tb_clientes(cod_cli,cod_cid,nome_cli,end_cli,renda_cli,sexo_cli) values (6,2,"Antenor da Costa","Rua F",1582.00,"M");
insert into tb_clientes(cod_cli,cod_cid,nome_cli,end_cli,renda_cli,sexo_cli) values (7,2,"Maria Amélia de Souza","Rua G",1152.00,"F");
insert into tb_clientes(cod_cli,cod_cid,nome_cli,end_cli,renda_cli,sexo_cli) values (8,2,"Paulo Roberto Silva","Rua H",3250.00,"M");
insert into tb_clientes(cod_cli,cod_cid,nome_cli,end_cli,renda_cli,sexo_cli) values (9,3,"Fátima Souza","Rua I",1632.00,"F");
insert into tb_clientes(cod_cli,cod_cid,nome_cli,end_cli,renda_cli,sexo_cli) values (10,3,"Joel da Rocha","Rua J",2000.00,"M");


insert into tb_conjuge(cod_conj,cod_cli,nome_conj,renda_conj,sexo_conj) values (1,1,"Carla Nogueira",2500.00,"F");
insert into tb_conjuge(cod_conj,cod_cli,nome_conj,renda_conj,sexo_conj) values (2,2,"Emilia Pereira",5500.00,"F");
insert into tb_conjuge(cod_conj,cod_cli,nome_conj,renda_conj,sexo_conj) values (3,6,"Altiiva da Costa",3000.00,"F");
insert into tb_conjuge(cod_conj,cod_cli,nome_conj,renda_conj,sexo_conj) values (4,7,"Carlos de Souza",3250.00,"M");


insert into tb_funcionarios(cod_func,nome_func,end_func,sal_func,sexo_func) values (1,"Vânia Gabriela Pereira","Rua A",2500.00,"F");
insert into tb_funcionarios(cod_func,nome_func,end_func,sal_func,sexo_func) values (2,"Norberto Pereira da Silva","Rua B",300.00,"M");
insert into tb_funcionarios(cod_func,nome_func,end_func,sal_func,sexo_func) values (3,"Olavo Linhares","Rua C",580.00,"M");
insert into tb_funcionarios(cod_func,nome_func,end_func,sal_func,sexo_func) values (4,"Paula da Silva","Rua D",3000.00,"F");
insert into tb_funcionarios(cod_func,nome_func,end_func,sal_func,sexo_func) values (5,"Rolando Rocha","Rua E",2000.00,"M");
insert into tb_funcionarios(cod_func,nome_func,end_func,sal_func,sexo_func) values (7,"Josefa Alecrim","Rua F",2500.00,"M");


insert into tb_dependentes(cod_dep,cod_func,nome_dep,sexo_dep) values (1,1,"Ana Pereira","F");
insert into tb_dependentes(cod_dep,cod_func,nome_dep,sexo_dep) values (2,1,"Roberto Pereira","M");
insert into tb_dependentes(cod_dep,cod_func,nome_dep,sexo_dep) values (3,1,"Cels Pereira","M");
insert into tb_dependentes(cod_dep,cod_func,nome_dep,sexo_dep) values (4,3,"Brisa Linhares","F");
insert into tb_dependentes(cod_dep,cod_func,nome_dep,sexo_dep) values (5,3,"Mari Sol Linhares","F");
insert into tb_dependentes(cod_dep,cod_func,nome_dep,sexo_dep) values (6,4,"Sonia da Silva","F");


insert into tb_titulos(cod_tit,cod_cat,cod_grav,nome_cd,val_cd,qntd_estq) values (1,1,1,"Tribalistas",30.00,1500);
insert into tb_titulos(cod_tit,cod_cat,cod_grav,nome_cd,val_cd,qntd_estq) values (2,1,2,"Tropicália",50.00,500);
insert into tb_titulos(cod_tit,cod_cat,cod_grav,nome_cd,val_cd,qntd_estq) values (3,1,1,"Aquele Abraço",50.00,600);
insert into tb_titulos(cod_tit,cod_cat,cod_grav,nome_cd,val_cd,qntd_estq) values (4,1,2,"Refazenda",60.00,1000);
insert into tb_titulos(cod_tit,cod_cat,cod_grav,nome_cd,val_cd,qntd_estq) values (5,1,3,"Totalmente Demais",50.00,2000);
insert into tb_titulos(cod_tit,cod_cat,cod_grav,nome_cd,val_cd,qntd_estq) values (6,1,3,"Travessia",55.00,500);
insert into tb_titulos(cod_tit,cod_cat,cod_grav,nome_cd,val_cd,qntd_estq) values (7,1,2,"Courage",30.00,200);
insert into tb_titulos(cod_tit,cod_cat,cod_grav,nome_cd,val_cd,qntd_estq) values (8,4,3,"Legião Urbana",20.00,100);
insert into tb_titulos(cod_tit,cod_cat,cod_grav,nome_cd,val_cd,qntd_estq) values (9,3,2,"The Beatles",30.00,300);
insert into tb_titulos(cod_tit,cod_cat,cod_grav,nome_cd,val_cd,qntd_estq) values (10,4,1,"Rita Lee",30.00,500);


insert into tb_pedidos(num_ped,cod_cli,cod_func,data_ped,val_ped) values (1,1,2,'02/05/02',1500.00);
insert into tb_pedidos(num_ped,cod_cli,cod_func,data_ped,val_ped) values (2,3,4,'02/05/02',50.00);
insert into tb_pedidos(num_ped,cod_cli,cod_func,data_ped,val_ped) values (3,4,7,'02/06/02',100.00);
insert into tb_pedidos(num_ped,cod_cli,cod_func,data_ped,val_ped) values (4,1,4,'02/02/03',200.00);
insert into tb_pedidos(num_ped,cod_cli,cod_func,data_ped,val_ped) values (5,7,5,'02/03/03',300.00);
insert into tb_pedidos(num_ped,cod_cli,cod_func,data_ped,val_ped) values (6,4,4,'02/03/03',100.00);
insert into tb_pedidos(num_ped,cod_cli,cod_func,data_ped,val_ped) values (7,5,5,'02/03/03',50.00);
insert into tb_pedidos(num_ped,cod_cli,cod_func,data_ped,val_ped) values (8,8,2,'02/03/03',50.00);
insert into tb_pedidos(num_ped,cod_cli,cod_func,data_ped,val_ped) values (9,2,2,'02/03/03',2000.00);
insert into tb_pedidos(num_ped,cod_cli,cod_func,data_ped,val_ped) values (10,7,1,'02/03/03',3000.00);


insert into tb_tit_artistas(cod_tit,cod_art) values (1,1);
insert into tb_tit_artistas(cod_tit,cod_art) values (2,2);
insert into tb_tit_artistas(cod_tit,cod_art) values (3,2);
insert into tb_tit_artistas(cod_tit,cod_art) values (4,2);
insert into tb_tit_artistas(cod_tit,cod_art) values (5,3);
insert into tb_tit_artistas(cod_tit,cod_art) values (6,4);
insert into tb_tit_artistas(cod_tit,cod_art) values (7,4);
insert into tb_tit_artistas(cod_tit,cod_art) values (8,5);
insert into tb_tit_artistas(cod_tit,cod_art) values (9,6);
insert into tb_tit_artistas(cod_tit,cod_art) values (10,7);


insert into tb_tit_pedidos(num_ped,cod_tit,qntd_cd,val_cd) values (1,1,2,30.00);
insert into tb_tit_pedidos(num_ped,cod_tit,qntd_cd,val_cd) values (1,2,3,20.00);
insert into tb_tit_pedidos(num_ped,cod_tit,qntd_cd,val_cd) values (2,1,1,50.00);
insert into tb_tit_pedidos(num_ped,cod_tit,qntd_cd,val_cd) values (2,2,3,30.00);
insert into tb_tit_pedidos(num_ped,cod_tit,qntd_cd,val_cd) values (3,1,2,40.00);
insert into tb_tit_pedidos(num_ped,cod_tit,qntd_cd,val_cd) values (4,2,3,20.00);
insert into tb_tit_pedidos(num_ped,cod_tit,qntd_cd,val_cd) values (5,1,2,25.00);
insert into tb_tit_pedidos(num_ped,cod_tit,qntd_cd,val_cd) values (6,2,3,30.00);
insert into tb_tit_pedidos(num_ped,cod_tit,qntd_cd,val_cd) values (6,3,1,35.00);
insert into tb_tit_pedidos(num_ped,cod_tit,qntd_cd,val_cd) values (7,4,2,55.00);
insert into tb_tit_pedidos(num_ped,cod_tit,qntd_cd,val_cd) values (8,1,4,60.00);
insert into tb_tit_pedidos(num_ped,cod_tit,qntd_cd,val_cd) values (9,2,3,15.00);
insert into tb_tit_pedidos(num_ped,cod_tit,qntd_cd,val_cd) values (10,7,2,15.00);
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
select * from tb_tit_artistas;
select * from tb_tit_pedidos;

-- 1. Selecione o nome dos CDs e o nome da gravadora de cada CD. 
select tit.nome_cd as 'nome do cd', nome_grav as 'nome da gravadora' from tb_titulos as tit
inner join tb_gravadoras as grav on tit.cod_tit = tit.cod_grav;

-- 2. Selecione o nome dos CDs e o nome da categoria de cada CD.
select tit.nome_cd as 'nome do cd', cat.nome_cat as 'nome da categoria' from tb_titulos as tit
inner join tb_categorias as cat on tit.cod_tit = tit.cod_grav; 

-- 3. Selecione o nome dos CDs, o nome das gravadoras de cada CD e o nome da categoria de 
-- cada CD.
select tit.nome_cd as 'nome dos cds', grav.nome_grav as 'nome da gravadora', cat.nome_cat as 'nome da categoria' from tb_titulos as tit
inner join tb_gravadoras as grav on tit.cod_tit = tit.cod_grav
inner join tb_categorias as cat on tit.cod_tit = tit.cod_cat;

-- 4. Selecione o nome dos clientes e os títulos dos CDs vendidos em cada pedido que o 
-- cliente fez. 
select cli.nome_cli as 'nome do cliente', tit.nome_cd as 'nome do cd', ped.num_ped as 'numero de pedido' from tb_tit_pedidos as tit_ped
left join tb_clientes as cli on tit_ped.cod_tit = tit.cod_cli
left join tb_titulos as tit on  = cod_tit = cod_tit
left join tb_pedidos as ped on  = ped.num_ped;


-- 5. Selecione o nome do funcionário, número, data e valor dos pedidos que este 
-- funcionário registrou, além do nome do cliente que está fazendo o pedido. 

select nome_func as 'nome do funcionario', num_ped as 'numero do pedido', data_ped as 'data do pedido', val_ped as 'valor do pedido', nome_cli as 'nome do cliente' from tb_pedidos as ped
inner join tb_funcionarios as func on cod_tit = codfunc
inner join tb_clientes as cli on cod_tit = cod_cli