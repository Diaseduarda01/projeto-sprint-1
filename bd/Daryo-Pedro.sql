create database daryo;

use daryo;

create table cliente(
idclientes int auto_increment primary key,
nome varchar(50),
telefone varchar(50),
email varchar(50),
endereço varchar(50)
);

create table reservatorios(
idreservatorio int auto_increment primary key,
capacidadeTotal float,
dataInstalacao date,
localizacao varchar(50),
energiagasta int,
tipoReservatorio varchar(50)
);

create table sensores(
idsensores int auto_increment primary key,
nome varchar(50),
tipo varchar(50),
dataInstalacao date
);

create table manutencao (
idmanutencao int auto_increment primary key,
datamanutencao date,
tipoManutencao varchar(50),
statusManutencao varchar (50) check ( statusManutencao in ( 'Iniciando', 'Em andamento', 'Finalizado'))
);


insert into cliente values

(default, 'Claudio', '119809858', 'claudio20@gmail.com', 'Av. Agua de cristal'),
(default, 'vitu', '119541243', 'victor11@gmail.com', 'Av. Valmir Ramir'),
(default, 'nicole', '11782309', 'nickmui@gmail.com', 'Av. Agua de cristal');

insert into reservatorios values
(default, '500', '2024-12-22', 'Rio grande', '50000', 'retangular'),
(default, '700', '2025-01-15', 'Cabunçu', '70000', 'circular'),
(default, '600', '2024-11-01', 'Águas Claras', '60000', 'circular');

insert into sensores values 
(default, 'HC-SR04', 'Ultrassonico', '2025-01-10'),
(default, 'HC-SR04', 'Ultrassonico', '2025-02-01'),
(default, 'HC-SR04', 'Ultrassonico', '2024-12-01');

INSERT INTO manutencao VALUES
(default, '2024-12-29', 'Limpeza', 'Iniciando'),
(default, '2025-01-25', 'Limpeza', 'Iniciando'),
(default, '2024-11-20', 'Limpeza', 'Iniciando');


