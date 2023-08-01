-- Alan Fonseca
drop database dbClinicaMedica;
create database dbClinicaMedica;
use dbClinicaMedica;
create table medico(
    idMedico int,
    nomeMedico varchar (45),
    telefoneMedico varchar (9)
);
create table consulta(
    idConsulta int,
    dataConsulta datetime,
    Medico_idMedico int,
    Paciente_idPaciente int,
    ReceitaMedica_idReceitaMedica int
);
create table receitamedica(
    idReceitaMedica int,
    descricao varchar(500)
);
create table paciente(
    idPaciente int,
    nmPaciente varchar(45),
    telefonePaciente varchar(9),
    convenio varchar(45)
);
show tables;
desc medico;
desc consulta;
desc receitamedica;
desc paciente;