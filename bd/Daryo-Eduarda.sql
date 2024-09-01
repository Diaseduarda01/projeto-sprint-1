create database daryo;

use daryo;

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(25) NOT NULL,
    sobrenome VARCHAR(25),
    cpf VARCHAR(11) NOT NULL UNIQUE,
    email VARCHAR(60),
    telefone VARCHAR(15),
    endereco VARCHAR(255),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/* 
Cliente e Usuário:
O relacionamento entre cliente e usuario foi definido como 1, 
 onde 1 cliente pode ter múltiplos usuários associados.
*/
	 
CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    nome VARCHAR(25) NOT NULL,
    sobrenome VARCHAR(25),
    cpf VARCHAR(11) NOT NULL UNIQUE,
    email VARCHAR(60),
    login VARCHAR(20) NOT NULL UNIQUE,
    senha CHAR(8),
    telefone VARCHAR(15),
    nvlAcesso CHAR(1),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

/*
Contato: A tabela contato pode estar ligada tanto a um cliente quanto a um usuario.
Isso é útil caso diferentes pessoas devam ser notificadas sobre o status dos reservatórios.
*/

CREATE TABLE contato (
    id_contato INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NULL,
    id_usuario INT NULL,
    nome VARCHAR(60),
    telefone VARCHAR(15),
    email VARCHAR(60),
    mensagem TEXT(300),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE reservatorio (
    id_reservatorio INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    cep VARCHAR(8),
    endereco VARCHAR(255),
    capacidade DECIMAL(7,2),
    altura DECIMAL(5,2),
    largura DECIMAL(5,2),
    altura_sensor DECIMAL(5,2),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

/*
Reservatório e Sensor: Cada reservatorio tem vários sensores associados,
 e os dados coletados são armazenados na tabela registro_sensor.
*/

CREATE TABLE sensor (
    id_sensor INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(50) NOT NULL,
    altura_sensor DECIMAL(5,2),
    nivel_agua DECIMAL(5,2),
    data_instalacao DATE,
    id_reservatorio INT,
    FOREIGN KEY (id_reservatorio) REFERENCES reservatorio(id_reservatorio)
);

CREATE TABLE registro_sensor (
    id_registro INT AUTO_INCREMENT PRIMARY KEY,
    id_sensor INT,
    nivel_agua DECIMAL(5,2),
    data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_sensor) REFERENCES sensor(id_sensor)
);

/*
Notificação: A tabela notificacao armazena alertas gerados a partir dos dados coletados pelo sensor,
 ligando cada notificação ao registro_sensor e ao contato que deve receber a notificação.
*/

CREATE TABLE notificacao (
    id_notificacao INT AUTO_INCREMENT PRIMARY KEY,
    id_registro INT,
    id_contato INT,
    nivel_alerta VARCHAR(50),
    mensagem TEXT,
    data_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_registro) REFERENCES registro_sensor(id_registro),
    FOREIGN KEY (id_contato) REFERENCES contato(id_contato)
);


-- 1FN: Não há colunas repetidas, e cada coluna contém valores atômicos.
-- 2FN: Não há dependências parciais, pois todas as tabelas têm chaves primárias simples ou compostas que determinam todos os atributos.
-- 3FN: Não há dependências transitivas. Todos os atributos não chave dependem diretamente da chave primária.




-- Populando as tabelas com dados para simulação
INSERT INTO cliente (nome, sobrenome, cpf, email, telefone, endereco) VALUES
('João', 'Silva', '12345678901', 'joao.silva@email.com', '99999-9999', 'Rua A, 123'),
('Maria', 'Oliveira', '23456789012', 'maria.oliveira@email.com', '98888-8888', 'Avenida B, 456');

INSERT INTO usuario (id_cliente, nome, sobrenome, cpf, email, login, senha, telefone, id_nvl_acesso) VALUES
(1, 'Pedro', 'Santos', '34567890123', 'pedro.santos@email.com', 'pedro', 'senha123', '97777-7777', 1),
(2, 'Ana', 'Costa', '45678901234', 'ana.costa@email.com', 'ana', 'senha456', '96666-6666', 3);

INSERT INTO contato (id_cliente, id_usuario, nome, telefone, email, mensagem) VALUES
(1, NULL, 'João Silva', '99999-9999', 'joao.silva@email.com', 'João confira o nível da água'),
(NULL, 2, 'Ana Costa', '96666-6666', 'ana.costa@email.com', 'Ana confira o nível da água');

INSERT INTO reservatorio (id_cliente, cep, endereco, capacidade, altura, largura, altura_sensor) VALUES
(1, '12345678', 'Fazenda A, Zona Rural', 10000.00, 10.00, 5.00, 1.00),
(2, '87654321', 'Sítio B, Zona Rural', 8000.00, 8.00, 4.00, 0.80);

INSERT INTO sensor (modelo, altura_sensor, nivel_agua, data_instalacao, id_reservatorio) VALUES
('HC-SR04', 1.00, 7.50, '2024-01-01', 1),
('HC-SR04', 0.80, 6.20, '2024-01-02', 2);

INSERT INTO registro_sensor (id_sensor, nivel_agua, data_registro) VALUES
(1, 7.00, '2024-09-01 08:00:00'),
(1, 6.50, '2024-09-01 09:00:00'),
(2, 5.80, '2024-09-01 08:30:00'),
(2, 5.50, '2024-09-01 09:30:00');

INSERT INTO notificacao (id_registro, id_contato, nivel_alerta, mensagem, data_envio) VALUES
(1, 1, '50%', 'Nível de água em 50% no reservatório A', '2024-09-01 08:05:00'),
(3, 2, '50%', 'Nível de água em 50% no reservatório B', '2024-09-01 08:35:00');

CREATE TABLE nvl_acesso (
    id_nvl_acesso INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL
);

ALTER TABLE usuario
ADD COLUMN id_nvl_acesso INT,
DROP COLUMN nvlAcesso,
ADD FOREIGN KEY (id_nvl_acesso) REFERENCES nvl_acesso(id_nvl_acesso);

INSERT INTO nvl_acesso (descricao) VALUES
('Administrador'),
('Gerente'),
('Usuário Comum');

-- exibições
select * from cliente;
select * from usuario;
select * from contato;
select * from notificacao;
select * from nvl_acesso;
select * from reservatorio;
select * from sensor;
select * from registro_sensor;

--  Selecione todos os sensores instalados após 1º de janeiro de 2024.
select * from sensor where data_instalacao >= '2024-01-01';

-- selecione todos os usuários, ordenando os resultados pelo nome em ordem alfabética.
select * from usuario order by nome ;

--  Selecione todos os registros de sensores onde o nível de água é maior que 6.0 e o reservatório associado está localizado no CEP '12345678'
select * from sensor where nivel_agua > 6;

--  Selecione todos os clientes cujo nome começa com "M".
select * from cliente where nome like 'm%';

-- Insira um novo registro na tabela usuario com os dados de um novo usuário associado ao id_cliente 1.
insert into usuario values (default,1,'maria eduarda', 'andrade', '23557896567', 'eduarda@email.com','eduarda','senha890','987865656','2');

-- Atualize o endereço de um reservatório com id_reservatorio 2 para "Fazenda C, Zona Rural".
update reservatorio set endereco = 'Fazenda C, Zona Rural' where id_reservatorio = 2;





