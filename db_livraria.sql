drop database db_livraria;

create database db_livraria;

use db_livraria;

create table tb_genero(
id_genero int not null,
descricao varchar(100) not null,
primary key (id_genero)
);
create table tb_autor(
id_aut int not null,
nome_aut varchar(100) not null unique,
email_aut varchar(100) not null unique,
primary key (id_aut)
);
create table tb_cliente(
id_cli int not null,
nome_cli varchar(100) not null,
telefone_cli varchar(45) not null unique,
primary key (id_cli)
);
create table tb_venda(
id_venda int not null,
id_cli int not null,
data_venda date not null,
total float not null,
primary key (id_venda),
foreign key (id_cli) references tb_cliente(id_cli)
);
create table tb_livro(
id_livro int not null,
id_genero int not null,
titulo_livro varchar(100) not null unique,
preco_livro float not null default 0 check (preco_livro >= 0),
estoque_livro int not null check (estoque_livro >= 0),
primary key (id_livro),
foreign key (id_genero) references tb_genero(id_genero)
);
create table tb_itens_da_venda(
id_venda int not null,
id_livro int not null,
qntd_livro int not null,
subtotal varchar(45) not null,
foreign key (id_venda) references tb_venda(id_venda),
foreign key (id_livro) references tb_livro(id_livro)
);
create table tb_escreve(
id_livro int not null,
id_aut int not null,
foreign key (id_livro) references tb_livro(id_livro),
foreign key (id_aut) references tb_autor(id_aut)
);
desc tb_genero;
desc tb_autor;
desc tb_cliente;
desc tb_venda;
desc tb_livro;
desc tb_itens_da_venda;
desc tb_escreve;

insert into tb_genero(id_genero,descricao) values (1,"romance");
insert into tb_genero(id_genero,descricao) values (2,"Aventura");
insert into tb_genero(id_genero,descricao) values (3,"Ficção Científica");
insert into tb_genero(id_genero,descricao) values (4,"Terror");
insert into tb_genero(id_genero,descricao) values (5,"Conto");
insert into tb_genero(id_genero,descricao) values (6,"Autoajuda");
insert into tb_genero(id_genero,descricao) values (7,"Biografia");
insert into tb_genero(id_genero,descricao) values (8,"Autobiografia");
insert into tb_genero(id_genero,descricao) values (9,"Manual");
insert into tb_genero(id_genero,descricao) values (10,"HQ");

select * from tb_genero;
insert into tb_autor (id_aut,nome_aut,email_aut) values (1,"carlos Eduardo","autorcarlos@hotmail.com");
insert into tb_autor (id_aut,nome_aut,email_aut) values (2,"Eduarda Costa","gabiaut@hotmail.com");
insert into tb_autor (id_aut,nome_aut,email_aut) values (3,"carla Amorim","carlamorin@hotmail.com");
insert into tb_autor (id_aut,nome_aut,email_aut) values (4,"Julia Silva","silvaju@gmail.com");
insert into tb_autor (id_aut,nome_aut,email_aut) values (5,"Klebio Dias","klebiodias@gmail.com");
insert into tb_autor (id_aut,nome_aut,email_aut) values (6,"Felipe Santana","feesantana@hotmail.com");
insert into tb_autor (id_aut,nome_aut,email_aut) values (7,"José Augusto","augustojose@hotmail.com");
insert into tb_autor (id_aut,nome_aut,email_aut) values (8,"Lucas Souza","lsouza@gmail.com");
insert into tb_autor (id_aut,nome_aut,email_aut) values (9,"Amanda Fonseca","mandsfonseca@hotmail.com");
insert into tb_autor (id_aut,nome_aut,email_aut) values (10,"Gabliela Araujo","araujogabi@gmail.com");

select * from tb_autor;
insert into tb_cliente (id_cli,nome_cli,telefone_cli) values (1,"larissa","(11) 91824-6193");
insert into tb_cliente (id_cli,nome_cli,telefone_cli) values (2,"Luiz","(12) 90913-1432");
insert into tb_cliente (id_cli,nome_cli,telefone_cli) values (3,"Isabela","(30) 91758-0098");
insert into tb_cliente (id_cli,nome_cli,telefone_cli) values (4,"Rayane","(19) 91263-0151");
insert into tb_cliente (id_cli,nome_cli,telefone_cli) values (5,"Rayssa","(41) 99592-9139");
insert into tb_cliente (id_cli,nome_cli,telefone_cli) values (6,"João","(44) 99850-9209");
insert into tb_cliente (id_cli,nome_cli,telefone_cli) values (7,"Pedro","(4) 97123-0989");
insert into tb_cliente (id_cli,nome_cli,telefone_cli) values (8,"Gabriel","(8) 96281-1123");
insert into tb_cliente (id_cli,nome_cli,telefone_cli) values (9,"Guilherme","(10) 91123-0012");
insert into tb_cliente (id_cli,nome_cli,telefone_cli) values (10,"Leonardo","(20) 10472-1468");
select * from tb_cliente;

insert into tb_venda (id_venda,id_cli,data_venda,total) values (1,4,'08/08/2023',25.49);
insert into tb_venda (id_venda,id_cli,data_venda,total) values (2,9,'08/07/2023',30.00);
insert into tb_venda (id_venda,id_cli,data_venda,total) values (3,8,'10/08/2023',52.35);
insert into tb_venda (id_venda,id_cli,data_venda,total) values (4,2,'20/08/2023',41.00);
insert into tb_venda (id_venda,id_cli,data_venda,total) values (5,3,'10/06/2023',36.63);
insert into tb_venda (id_venda,id_cli,data_venda,total) values (6,7,'24/06/2023',19.99);
insert into tb_venda (id_venda,id_cli,data_venda,total) values (7,5,'30/07/2023',22.00);
insert into tb_venda (id_venda,id_cli,data_venda,total) values (8,6,'12/08/2023',29.99);
insert into tb_venda (id_venda,id_cli,data_venda,total) values (9,10,'18/07/2023',50.00);
insert into tb_venda (id_venda,id_cli,data_venda,total) values (10,1,'21/08/2023',100.00);
select * from tb_venda;

insert into tb_livro (id_livro,id_genero,titulo_livro,preco_livro,estoque_livro) values (1,2,"O Ladrão de Raios",20.00,50);
insert into tb_livro (id_livro,id_genero,titulo_livro,preco_livro,estoque_livro) values (2,1,"E é assim que Acaba",33.99,112);
insert into tb_livro (id_livro,id_genero,titulo_livro,preco_livro,estoque_livro) values (3,4,"IT-A Coisa",71.59,20);
insert into tb_livro (id_livro,id_genero,titulo_livro,preco_livro,estoque_livro) values (4,3,"Luzes do Norte",34.99,50);
insert into tb_livro (id_livro,id_genero,titulo_livro,preco_livro,estoque_livro) values (5,7,"Em Busca de Mim",36.99,30);
insert into tb_livro (id_livro,id_genero,titulo_livro,preco_livro,estoque_livro) values (6,5,"Conto de Fadas dos Irmãos Grimm",20.00,50);
insert into tb_livro (id_livro,id_genero,titulo_livro,preco_livro,estoque_livro) values (7,6,"O poder do Hábito",42.99,10);
insert into tb_livro (id_livro,id_genero,titulo_livro,preco_livro,estoque_livro) values (8,8,"Quando ninguém está olhando",40.00,40);
insert into tb_livro (id_livro,id_genero,titulo_livro,preco_livro,estoque_livro) values (9,9,"Tempo pra tudo",19.20,120);
insert into tb_livro (id_livro,id_genero,titulo_livro,preco_livro,estoque_livro) values (10,10,"The Avengers",20.00,30);
select * from tb_livro;

insert into tb_itens_da_venda (id_venda,id_livro,qntd_livro,subtotal) values (1,2,1,20.00);
insert into tb_itens_da_venda (id_venda,id_livro,qntd_livro,subtotal) values (2,1,2,50.00);
insert into tb_itens_da_venda (id_venda,id_livro,qntd_livro,subtotal) values (3,3,1,30.00);
insert into tb_itens_da_venda (id_venda,id_livro,qntd_livro,subtotal) values (4,5,1,19.99);
insert into tb_itens_da_venda (id_venda,id_livro,qntd_livro,subtotal) values (5,6,2,35.00);
insert into tb_itens_da_venda (id_venda,id_livro,qntd_livro,subtotal) values (6,4,1,18.00);
insert into tb_itens_da_venda (id_venda,id_livro,qntd_livro,subtotal) values (7,7,1,19.00);
insert into tb_itens_da_venda (id_venda,id_livro,qntd_livro,subtotal) values (8,9,1,16.00);
insert into tb_itens_da_venda (id_venda,id_livro,qntd_livro,subtotal) values (9,10,3,39.00);
insert into tb_itens_da_venda (id_venda,id_livro,qntd_livro,subtotal) values (10,8,2,70.00);
select * from tb_itens_da_venda;

update tb_genero set descricao = "Acadêmico" where id_genero = 9;
update tb_cliente set nome_cli = "Augusto" where id_cli = 9;
update tb_livro set titulo_livro = "Manual do Aluno" where id_livro = 9;
update tb_livro set titulo_livro = "Relatos de um Gato Viajante" where id_livro = 6;
update tb_livro set titulo_livro = "Harry Potter e o Cálice de Fogo" where id_livro = 1;

delete