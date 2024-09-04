CREATE DATABASE DaryoEmpresa;
USE DaryoEmpresa;


SELECT * FROM Usuario;

CREATE TABLE Usuario(
idUsuario int primary key auto_increment,
idEmpresa int,
nomeUsuario varchar(100) not null,
emailUsuario varchar(100) not null unique,
senhaUsuario varchar(255) not null unique,
tipoUsuario enum('Cliente','Administrador') not null,
dataDoCadastro date not null
);

SELECT * FROM Empresa;

CREATE TABLE Empresa(
idEmpresa int primary key auto_increment,
nomeEmpresa varchar(100) not null,
cnpjEmpresa varchar(14) not null unique,
enderecoEmpresa varchar(100)not null,
telefoneEmpresa varchar(15)not null,
emailEmpresa varchar(100)not null,
dataDoCadastro date not null
);

SELECT * FROM Reservatorio;

CREATE TABLE Reservatorio (
idReservatorio int primary key auto_increment,
idSensor int not null,
localizacao varchar(100) not null,
capacidadeMaxLitros decimal(7,2)not null,
altura decimal(3,2)not null,
diametro decimal(3,2)not null
);

SELECT * FROM Sensores;

CREATE TABLE Sensores (
idSensor int primary key auto_increment,
idReservatorio int not null,
idUsuario int not null,
tipoSensor varchar(50) not null,
posicaoSensor varchar(100) not null,
alcanceSensor decimal(3,2) not null,
dataDaInstalacao date not null,
statusSensor varchar(30) not null,
FOREIGN KEY (idReservatorio) REFERENCES Reservatorio(idReservatorio),
FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);

SELECT * FROM Configuracoes;

CREATE TABLE Configuracoes (
idConfiguracao int primary key auto_increment not null,
idReservatorio int not null,
nomeConfiguracao varchar(100) not null,
valorMaximoAgua decimal (3,2)not null,
descricao varchar(150)not null,
FOREIGN KEY (idReservatorio) REFERENCES Reservatorio(idReservatorio)
);

SELECT * FROM Leitura;

CREATE TABLE Leitura (
idLeitura int primary key auto_increment not null,
idSensor int not null,
distanciaMedida decimal (3,2) not null,
nivelAgua decimal(3,2) not null,
volumeAguaLitros decimal(7,2) not null,
dataLeitura date not null,
statusReservatorio enum('Normal','Cuidado', 'Crítico') not null
);

SELECT * FROM Alertas;

CREATE TABLE Alertas (
idAlerta int primary key auto_increment,
idLeitura int not null,
dataDoAlerta date not null,
tipoAlerta varchar (100) not null,
descricaoAlerta varchar(150) not null,
foreign key (idLeitura) references Leitura (idLeitura)
);

-- prenchendo dados nas tabelas 

INSERT INTO Usuario VALUES
(default, 1,  'Eduarda', 'dudadias@gmail.com', 'SenhaSuperSegura124', 'Administrador', '2024-09-03'),
(default, 1,  'Victor', 'vitugo@gmail.com', 'SenhaSuperSegura125', 'Administrador', '2024-09-04'),
(default, 1,  'Pedro', 'pemendonca@gmail.com', 'SenhaSuperSegura126', 'Administrador', '2024-09-04'),
(default, 1,  'Nicolly', 'nicksousa@gmail.com', 'SenhaSuperSegura127', 'Administrador', '2024-09-05'),
(default, 1,  'Thais', 'fosaluza@gmail.com', 'SenhaSuperSegura128', 'Administrador', '2024-09-05');

INSERT INTO Empresa VALUES
(default, 'Daryo', 12345678912345, 'Rua Daryo Fazenda Feliz N°01', 11959506544, 'daryo@empresa.com', '20240903');

INSERT INTO Reservatorio VALUES
(default, 1, 'Fazenda Daryo', 80.000, 8.00, 4.00);

INSERT INTO Sensores VALUES
(default, 1, 1, 'Sensor Ultrassônico', 'Tampa do Reservatório', 4.00, '2024-08-28', 'Ativo'),
(default, 1, 2, 'Sensor Ultrassônico', 'Topo do Reservatório', 4.00, '2024-08-28', 'Ativo');

INSERT INTO Configuracoes VALUES
(default, 1, 'Limite: Nível Muito Alto', 7.00, 'Limite máximo do nível da água em metros'),
(default, 1, 'Limite: Nível Muito Baixo', 1.00, 'Limite mínimo do nível da água em metros'),
(default, 1, 'Intervalo entre Medições', 5.00, 'Tempo de intervalo entre as medições em minutos');
select * from leitura;
INSERT INTO Leitura VALUES
(default, 1, 3.00, 5.00, 50000.00, 20240828, 'Normal'),
(default, 2, 1.00, 7.00, 70000.00, 20240829, 'Crítico'),
(default, 1, 2.10, 5.90, 49000.00, 20240830, 'Cuidado');

SELECT * FROM ALERTAS;
INSERT INTO Alertas values
(default, 4, 20240828, 'Análise Nível: Normal', 'O nível da água está dentro do normal; nenhuma ação necessária.'),
(default, 5, 20240829, 'Análise Nível: Cuidado', 'O nível da água está fora dos limites seguros; ação imediata necessária!'),
(default, 6, 20240830, 'Análise Nível: Alerta', 'O nível da água está próximo ao limite; monitorar com atenção.');

SHOW TABLES;
SELECT * FROM Usuario;
SELECT * FROM Empresa;
SELECT * FROM Configuracoes;
SELECT * FROM Reservatorio;
SELECT * FROM Sensores;
SELECT * FROM Leitura;
SELECT * FROM Alertas;


