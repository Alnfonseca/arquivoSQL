drop database dbEscola;
create database dbEscola;
use dbEscola;
create table Registro(
    id_aluno int,
    id_turma int,
    ausencia int,
    id_registro int
);
create table Aluno(
    matricula int,
    data_matricula date,
  nome varchar(45),
    endereco varchar(45),
    telefone varchar(45),
    nascimento date,
    altura float,
    peso float,
    id_turma int
);
create table turma(
    id int,
    quant_alunos int,
    horario_aula datetime,
    duracao_aula datetime,
    data_inicio date,
    data_fim date,
    atividade int,
    id_instrutor int,
    id_monitor int
);
create table atividade(
    id int,
    atividade varchar(45)
);
create table monitor(
id_aluno int
);
create table instrutor(
    rg int,
    nome varchar(45),
    nascimento date,
    titulacao varchar(45),
    telefone varchar(45)
);
desc Registro;
desc Aluno;
desc turma;
desc turma;
desc atividade;
desc monitor;
desc instrutor;
