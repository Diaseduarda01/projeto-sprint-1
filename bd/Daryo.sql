create database daryo;
use daryo;

create table reservatorio (
id int primary key auto_increment,
localizacao varchar(100),
capacidade_maxima_litros decimal(7,2),
altura decimal(3,2),
diametro decimal(3,2)
);

select * from reservatorio;
describe reservatorio;

alter table reservatorio change id idReservatorios int auto_increment;
alter table reservatorio change idReservatorios idReservatorio int auto_increment;

insert into reservatorio values
(default, 'Fazenda Daryo', 80.000, 8.00, 4.00);

update reservatorio set capacidade_maxima_litros = 80000.00 where id = 1; 

create table sensores (
idSensor int primary key auto_increment,
tipoSensor varchar(50) not null,
localizacaoSensor varchar(100) not null,
alcanceSensor decimal(3,2) not null,
dataInstalacao date not null,
statusSensor varchar(30) not null
);

select * from sensores;
describe sensores;

alter table sensores add constraint checkStatus check (statusSensor in ('Ativo', 'Inativo'));

insert into sensores (tipoSensor, localizacaoSensor, alcanceSensor, dataInstalacao, statusSensor) values
('Sensor Ultrassônico', 'Tampa do Reservatório', 4.00, '2024-08-28', 'Ativo');

insert into sensores (tipoSensor, localizacaoSensor, alcanceSensor, dataInstalacao, statusSensor) values
('Sensor Ultrassônico', 'Topo do Reservatório', 4.00, '2024-08-28', 'Ativo');

create table leituraAgua (
idLeitura int primary key auto_increment not null,
idSensor int not null,
distanciaMedida decimal (3,2) not null,
nivelAgua decimal(3,2) not null,
volumeAguaLT decimal(7,2) not null,
dataHoraLeitura date not null,
statusReservatorio varchar(30) not null
);

select * from leituraAgua;
describe leituraAgua;

alter table leituraAgua add constraint fk_idSensor foreign key (idSensor) references sensores(idSensor);

show create table leituraAgua;

alter table leituraAgua change column dataHoraLeitura dataLeitura date;

alter table leituraAgua add constraint checkStatusReservatorio check (statusReservatorio in ('Normal', 'Alerta', 'Crítico'));

insert into leituraAgua (idSensor, distanciaMedida, nivelAgua, volumeAguaLT, dataLeitura, statusReservatorio) values
(1, 3.00, 5.00, 50000.00, 20240828, 'Normal');

insert into leituraAgua (idSensor, distanciaMedida, nivelAgua, volumeAguaLT, dataLeitura, statusReservatorio) values
(2, 3.00, 5.00, 50000.00, 20240828, 'Normal');

insert into leituraAgua (idSensor, distanciaMedida, nivelAgua, volumeAguaLT, dataLeitura, statusReservatorio) values
(1, 1.00, 7.00, 70000.00, 20240829, 'Crítico'),
(2, 1.00, 7.00, 70000.00, 20240829, 'Crítico'),
(1, 2.10, 5.90, 49000.00, 20240830, 'Alerta'),
(2, 2.10, 5.90, 49000.00, 20240830, 'Alerta');

create table alertas (
idAlerta int primary key auto_increment,
idLeitura int not null,
dataAlerta date not null,
tipoAlerta varchar (100) not null,
descricaoAlerta TEXT,
foreign key (idLeitura) references leituraAgua (idLeitura)
);

select * from alertas;
describe alertas;

insert into alertas (idLeitura, dataAlerta, tipoAlerta, descricaoAlerta) values
(1, 20240828, 'Análise: Nível Normal', 'O nível da água está dentro do normal; nenhuma ação necessária.'),
(3, 20240829, 'Análise: Nível Crítico', 'O nível da água está fora dos limites seguros; ação imediata necessária!'),
(5, 20240830, 'Análise: Nível Alerta', 'O nível da água está próximo ao limite; monitorar com atenção.');

create table configuracoesSistema (
idConfiguracao int primary key auto_increment not null,
nomeConfiguracao varchar(100) not null,
valorMaximoAgua decimal (3,2)not null,
descricaoValor TEXT
);

select * from configuracoesSistema;

insert into configuracoesSistema (nomeConfiguracao, valorMaximoAgua, descricaoValor) values
('Limite: Nível Muito Alto', 7.00, 'Limite máximo do nível da água em metros'),
('Limite: Nível Muito Baixo', 1.00, 'Limite mínimo do nível da água em metros'),
('Intervalo entre Medições', 5.00, 'Tempo de intervalo entre as medições em minutos');

show tables;

select * from reservatorio;
select * from sensores;
select * from leituraAgua;
select * from alertas;
select * from configuracoesSistema;



