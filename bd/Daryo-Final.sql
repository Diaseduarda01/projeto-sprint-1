CREATE DATABASE DaryoTM;
USE DaryoTM;

CREATE TABLE Empresa(
idEmpresa int primary key auto_increment,
nomeEmpresa varchar(50) not null,
cnpjEmpresa varchar(14) not null unique,
enderecoEmpresa varchar(50)not null,
telefoneEmpresa varchar(15)not null,
emailEmpresa varchar(40)not null,
dataDoCadastro date not null
);

SELECT * FROM Empresa;

INSERT INTO Empresa VALUES
(default, 'Fazenda Nascente do Sol', '12345678000195', 'Avenida das Hortências, N° 45', '1112233344', 'contatonascente@sptech.school', '2024-01-15'),
(default, 'Fazenda Reserva Hídrica', '98765432000156', 'Estrada do Sertão, N° 200', '2223344556', 'infohidrica@sptech.school', '2023-11-22'),
(default, 'Fazenda Rio Sereno', '19283746000162', 'Rua do Rio, N° 78', '3334455667', 'riosereno@sptech.school', '2024-03-09'),
(default, 'Fazenda Campos Verdes', '56473829000180', 'Rodovia Verde, N° 120', '4445566778', 'fazendacampos@sptech.school', '2024-05-30');




CREATE TABLE Usuario(
idUsuario int primary key auto_increment,
nomeCompletoUsuario varchar(50) not null,
emailUsuario varchar(60)not null,
loginUsuario varchar(20) not null,
senhaUsuario varchar(8)not null,
telefoneUsuario varchar(15)not null,
nivelAcesso varchar(20) not null, constraint chkNivel check (nivelAcesso in ('Administrador', 'Usuário Comum'))
);

SELECT * FROM Usuario;

INSERT INTO Usuario VALUES
(default, 'Clara Silva', 'clarasilva@sptech.school', 'clarasilva95', '13579@Cs', '11912345678', 'Administrador'),
(default, 'Felipe Alves', 'felipealves@sptech.school', 'felipealves01', '0987#Fa', '11919386582', 'Usuário Comum');





CREATE TABLE Reservatorios(
idReservatorio int primary key auto_increment,
nomeReservatorio varchar (40)not null,
localReservatorio  varchar (60)not null,
capacidadeMaxLitros float not null,
altura float not null,
diametro float not null
);

SELECT * FROM Reservatorios;

INSERT INTO Reservatorios VALUES
(default, 'Reservatório Leste', 'Fazenda Nascente do Sol', 80000.00, 8.00, 4.00),
(default, 'Reservatório Oeste', 'Fazenda Nascente do Sol', 40000.00, 4.00, 2.00),
(default, 'Reservatório Norte', 'Fazenda Rio Sereno', 90000.00, 9.00, 4.50),
(default, 'Reservatório Sul', 'Fazenda Rio Sereno', 20000.00, 2.00, 1.00);





CREATE TABLE Sensores(
idSensor int primary key auto_increment,
tipoSensor varchar(30) not null,
nomeSensor varchar (20) not null,
posicaoDoSensor varchar(40) not null,
alcanceSensor float not null, 
dataDaInstalacao date not null,
statusSensor varchar(10) not null, constraint chkStatus check (statusSensor in ('Ativo', 'Inativo'))
);

SELECT * FROM Sensores;

INSERT INTO Sensores VALUES
(default, 'Sensor Ultrassônico', 'HC-SR04', 'Topo', 4.00, '2024-02-20', 'Ativo'),
(default, 'Sensor Ultrassônico', 'HC-SR04', 'Tampa flutuante', 4.00, '2024-06-28', 'Ativo');





CREATE TABLE LeituraDaAgua (
idLeitura int primary key auto_increment not null,
distanciaDaBorda float not null,
nivelDaAgua float not null,
alturaReservatorio float not null,
volumeAguaLitros float not null,
dataLeitura date not null,
statusReservatorio varchar(15), constraint chkReservatorio check (statusReservatorio in ('Normal', 'Vigilante', 'Crítico'))
);

SELECT * FROM LeituraDaAgua;

-- Para calcularmos o volume aproximado da água utilizamos o cálculo de Volume = V = π * r * h
-- O que se traduz para: 3,14 * raio da base (metade do diâmetro elevado a 2) * altura
-- Consideramos 8 de altura e 4 de diâmetro de um reservatório cilíndrico

INSERT INTO LeituraDaAgua VALUES 
(default, 3.00, 5.00, 8.00, 60000.00, '2024-09-06', 'Normal'),
(default, 1.20, 6.80, 8.00, 85000.00, '2024-09-02', 'Vigilante'),
(default, 0.90, 7.10, 8.00, 90000.00, '2024-09-13', 'Crítico');





CREATE TABLE Alertas (
idAlerta int primary key auto_increment,
dataDoAlerta date not null,
tipoAlerta varchar (15), constraint chkAlerta check (tipoAlerta in ('Vigilante', 'Crítico')),
textoAlerta varchar(50), constraint chkTexto check (textoAlerta in ('Fique atento ao seu tanque!', 'Seu tanque precisa de intervenção imediata!'))
);

SELECT * FROM Alertas;

INSERT INTO Alertas VALUES
(default, '2024-09-06', 'Vigilante', 'Fique atento ao seu tanque!'),
(default, '2024-09-10', 'Crítico', 'Seu tanque precisa de intervenção imediata!');