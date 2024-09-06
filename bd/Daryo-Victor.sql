create database DARYO;

use DARYO;

create table sensor(
idSensor int primary key auto_increment,
Distancia float,
DistanciaMax int,
Qtd int,
tiposensor varchar(40),
constraint chkQtd check(Qtd >=1 ),
DataInst date
);

create table reservatorio(
idReservatorio int primary key auto_increment,
Altura float,
Largura float,
Comprimento float,
CapacidadeLT float,
constraint chkCapacidade check (CapacidadeLT >=1),
DataInst date
);

create table investimento(
idInv int primary key auto_increment,
Investimento int,
DataInv date,
Retorno int,
DataRetorno date
);

insert into sensor values
	(default, 0.05, 4, 2, 'Sensor Ultrassonico', '2024-06-21'),
    (default, 1.02, 4, 1, 'Sensor Ultrassonico', '2024-01-12'),
    (default, 2.30, 4, 2, 'Sensor Ultrassonico', '2023-12-09'),
    (default, 3.50, 4, 3, 'Sensor Ultrassonico', '2023-09-21'),
    (default, 1, 4, 2, 'Sensor Ultrassonico', '2024-05-01');
    
select * from sensor;
    
insert into reservatorio values
	(default, 10.5, 10, 5, 5000, '2023-10-12'),
	(default, 12, 20, 5, 25000, '2022-09-21'),
	(default, 15, 50, 5, 10000, '2024-05-09'),
	(default, 5.5, 20, 5, 50000, '2023-10-12');

select * from reservatorio;

insert into investimento values
	(default, 20000, '2024-01-20', 50000, '2024-09-05'),
	(default, 200000, '2024-03-01',400000, '2024-10-15'),
	(default, 100000, '2023-08-20', 900000, '2024-08-20'),
	(default, 20, '2024-01-20', 500, '2024-02-05');
    
select * from investimento;

