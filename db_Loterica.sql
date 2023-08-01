drop database dbLoterica;
create database dbLoterica;
use dbLoterica;
create table tbjogos(
codjg int,
nome varchar(45),
valor decimal(9,2),
datajg date
);
insert into tbjogos(codjg,nome,valor,datajg)values(1,'caça-palavras',15.00,'2023/08/05');
insert into tbjogos(codjg,nome,valor,datajg)values(2,'Quina',30.00,'2023/07/15');
insert into tbjogos(codjg,nome,valor,datajg)values(3,'Mega Sena',10.00,'2023/08/10');
insert into tbjogos(codjg,nome,valor,datajg)values(4,'Dupla Sena',20.00,'2023/08/05');
insert into tbjogos(codjg,nome,valor,datajg)values(5,'Dia de Sorte',12.00,'2023/10/25');
insert into tbjogos(codjg,nome,valor,datajg)values(6,'Time Mania',15.00,'2023/08/05');
insert into tbjogos(codjg,nome,valor,datajg)values(7,'Super Sete',19.00,'2024/03/05');
insert into tbjogos(codjg,nome,valor,datajg)values(8,'Sudoku',15.00,'2023/10/05');
insert into tbjogos(codjg,nome,valor,datajg)values(9,'Jogo do Bixo',10.00,'2023/12/05');
insert into tbjogos(codjg,nome,valor,datajg)values(10,'Mega da Virada',100.00,'2024/01/05');
show tables;
select * from tbjogos;
update tbjogos set nome = 'Lotofácil' where codjg = 1;
update tbjogos set valor = 200.00 where codjg = 10;
select * from tbjogos;
delete  from tbjogos where codjg = 8;
delete  from tbjogos where codjg = 3;
delete  from tbjogos where codjg = 6;
show databases;
show tables;
desc tbjogos;
select * from tbjogos;
