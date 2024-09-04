create database daryo_monitoramento;
use daryo_monitoramento;

create table reservatorios(
idReservatorio int primary key auto_increment,
nomeReservatorio varchar (50), 
localReservatorio  varchar (50),
capacidadeLitros float,
altura float, 
largura float,
diametro float, 
tipo varchar (30),
nDistribuições int,
diasAteReabastecimento int
) auto_increment = 1;

insert into reservatorios values 
(default, 'Reservatório sul', 'Zona rural SP', 5000.75, 10.5, 14.0, 15.0, 'cilindro', 2, 7), 
(default, 'Reservatório central', 'Zona rural SP', 2500.00, 8.0, 10.0, 0, 'retangular',  4, 3),
(default, 'Reservatório norte', 'Zona rural SP', 1200.00, 5.0, 6.0, 0, 'quadrado', 1, 5);

select * from reservatorios;

create table sensores (
idSensor int primary key auto_increment,
idReservatorio int, 
tipoSensor varchar (20), 
nome varchar (20), 
dataInstalação date, 
statusSensor varchar (15) check (statusSensor in ('ativo', 'inativo')), 
localização varchar (40),
foreign key (idReservatorio) references reservatorios (idReservatorio)
) auto_increment = 1;

insert into sensores values 
(default, 1, 'Sensor ultrasônico', 'HC-SR04', '2024-09-01', 'ativo', 'Tampa do reservaório'),
(default, 1, 'Sensor ultrasônico', 'HC-SR04', '2024-09-01', 'ativo', 'Topo do resevatório'),
(default, 2, 'Sensor ultrasônico', 'HC-SR04', '2024-09-01', 'ativo', 'Tampa do reservaório'),
(default, 2, 'Sensor ultrasônico', 'HC-SR04', '2024-09-01', 'ativo', 'Topo do resevatório'),
(default, 3, 'Sensor ultrasônico', 'HC-SR04', '2024-09-01', 'ativo', 'Tampa do reservaório'),
(default, 3, 'Sensor ultrasônico', 'HC-SR04', '2024-09-01', 'ativo', 'Topo do resevatório');
   
   
select * from sensores;

create table limiteAgua (
idLeitura int primary key auto_increment,
idSensor int,
idReservatorio int,
nivelAtual int, 
volumeAgua float, 
dataLeitura date, 
statusNivel varchar (15)  check(statusNivel in ('Abaixo do ideal', 'Normal', 'Acima do ideal', 'Transbordando', '')),
foreign key (idReservatorio) references reservatorios (idReservatorio),
foreign key (idSensor) references sensores (idSensor)
)auto_increment = 1;

describe limiteAgua;

insert into limiteAgua values 
(default, 1, 1, 5.05, 50000.00, '2024-09-01', 'Normal'),
(default, 2, 1, 0.00, 00000.00, '2024-09-01', ''),
(default, 3, 2, 1.01, 10000.01, '2024-09-01', 'Abaixo do Ideal'),
(default, 4, 2, 0.00, 00000.00, '2024-09-01', ''), 
(default, 5, 3, 7.00, 70000.00, '2024-09-01', 'Acima do ideal'), 
(default, 6, 3, 0.00, 00000.00, '2024-09-01', ''),
(default, 5, 3, 10.0, 10000.00, '2024-09-02', 'Transbordando'),
(default, 6, 3, 10.0, 10000.00, '2024-09-02', 'Transbordando');

select * from limiteAgua;

create table alertas (
idAlerta int primary key auto_increment,
idLeitura int,
idSensor int, 
idReservatorio int, 
dataAlerta date, 
tipoAlerta varchar (15) check (tipoAlerta in ('Abaixo do ideal', 'Acima do ideal', 'Transbordando')),
descrição varchar (100),
statusAlerta varchar (15) check (statusAlerta in ('Resolvido', 'Pendente', 'Em manutenção')),
foreign key (idReservatorio) references reservatorios (idReservatorio),
foreign key (idSensor) references sensores (idSensor),
foreign key (idLeitura) references limiteAgua (idLeitura)
) auto_increment = 1;

describe alertas;

insert into alertas values 
(default, 3, 3, 2, '2024-09-01', 'Abaixo do ideal', 'O nível da água está abaixo do ideal', 'Pendente'),
(default, 5, 5, 3, '2024-09-01', 'Acima do ideal', 'O nível da água está acima do ideal', 'Em manutenção'), 
(default, 7, 5, 3, '2024-09-01', 'Transbordando', '!ALERTA! O nível da água está no limite do reservatório', 'Resolvido'),
(default, 8, 6, 3, '2024-09-01', 'Transbordando', '!ALERTA! O nível da água está no limite do reservatório', 'Resolvido');

select * from alertas;

create table manutençãoReservatorios(
idManuteção int primary key auto_increment,
idSensor int, 
idReservatorio int,
tipoManutenção varchar (50), 
custoManutenção int, 
statusManutenção varchar (20) check (statusManutenção in ('Em andamento', 'Finalizado', 'Não inciada')),
dataManutenção date, 
foreign key (idReservatorio) references reservatorios (idReservatorio),
foreign key (idSensor) references sensores (idSensor)
);

describe manutençãoReservatorios;

insert into manutençãoReservatorios values 
(default, 1, 1, 'Troca de sensor', 150, 'Em andamento', '2024-09-02'),
(default, 4, 2, 'Troca de sensor', 150, 'Finalizado', '2024-09-02');

select * from manutençãoReservatorios;