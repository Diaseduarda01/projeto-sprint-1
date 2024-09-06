create database ProjetoPI;
use ProjetoPI;

-- Tabela 1 (Login)
create table Login (
Id int primary key auto_increment,
NomeProprietário varchar(50),
NomeEmpresa varchar(30),
EmailContato varchar(50),
Telefone char(16),
CNPJ char(18));

insert into Login values
(default, 'Thais Vitória', 'Daryo LTDA', 'daryo.reservatorios@sptech.school', '(11) 95936-2181', '12.123.321/0001-12');

select * from Login;

-- Tabela 2 (DadosSensor)
create table DadosSensor (
Id int primary key auto_increment,
Empresa varchar(30),
IdentReservatório char(1),
TipoSensor varchar(20),
IdentSensor int,
Medição decimal(3,2),
Localização varchar(30));

insert into DadosSensor values
(default, 'Daryo LTDA', 'A', 'ultrassônico','1','4', 'topotampa');

select * from DadosSensor;

-- Tabela 3 (DadosReservatório)
create table DadosReservatório (
Id int primary key auto_increment,
IdentReservatório char(1),
Empresa varchar(30),
TipoReservatório varchar(20),
CapacidadeLitros int,
QtdArduinos int);

insert into DadosReservatório values
(default, 'A', 'Daryo LTDA', 'Cilindro','1000', '1');

select * from DadosReservatório;




