create table tb_empresa
(
    idEmpresa int primary key identity,
    loginEmpresa varchar(50) unique,
    senhaEmpresa varchar(50) not null,
    nomeEmpresa varchar(80) not null,
    cnpj char(14) not null,
    telefone varchar(20) not null,
    email varchar(80) not null,
    logradouro varchar(80) not null,
    uf char(2) not null,
    cidade varchar(60) not null,
    numero varchar(45) not null,
    complemento varchar(45),
    bairro varchar(60) not null,
    cep char(8) not null
);

create table tb_responsavel
(
    idResponsavel int primary key identity,
    fkEmpresa int,
    foreign key(fkEmpresa) references tb_empresa(idEmpresa),
    nomeResponsavel varchar(80) not null,
    loginResponsavel varchar(50) unique not null,
    senhaResponsavel varchar(50) not null,
    email varchar(80) not null,
    telefone varchar(20) not null
);

create table tb_sala
(
    idSala int primary key identity,
    nomeSala varchar(50),
    area decimal(8,2) not null,
    descricao varchar(50) not null,
    andar varchar(20),
    fkEmpresa int,
    foreign key(fkEmpresa) references tb_empresa(idEmpresa)
);

create table tb_sensor
(
    idSensor int primary key identity,
    tipoSensor varchar(15) not null,
    tipoLeitura varchar(15) not null,
    statusSensor varchar(15) not null,
    unidadeMedida varchar(5) not null,
    fkSala int,
    foreign key(fkSala) references tb_sala(idSala)
);

create table tb_leitura
(
    idLeitura int primary key identity,
    fkSensor int,
    foreign key(fkSensor) references tb_sensor(idSensor),
    dataHoraRegister datetime default current_timestamp not null,
    valorLeitura decimal(10,2)
);


sp_columns tb_empresa;
sp_columns tb_responsavel;
sp_columns tb_sala;
sp_columns tb_sensor;
sp_columns tb_leitura;


-- INSERINDO DADOS NA TABELA EMPRESA
insert into tb_empresa
values
    ('loglogistica', 'Urubu100', 'Log Logistica', '13264578964513', '462315978', 'logsuporte@outlook.com', 'Avenida Santanna Mendes', 'RJ', 'Rio de janeiro', '338', default, 'Lapa', '12123456'),
    ('lawadv', 'Urubu100', 'Law Advocacia', '12345678965432', '123456789', 'lawadvsuporte@gmail.com', 'Rua Avelino Silva', 'SP', 'São Caetano', '124', 'Predio 2', 'Vila Pinhais', '12346587'),
    ('moneycontab', 'Urubu100', 'Money Contabilidade', '33633533412358', '33456721', 'moncontabil@outlook.com', 'Rua Afonso Sardinha', 'SP', 'Osasco', '12', 'apt 64', 'Jardim Melo', '37195842'),
    ('hemolines', 'Urubu100', 'Hemolines Solution', '13264578965412', '11122233', 'hmssolutions@hotmail.com', 'Avenida Faria Lima', 'SP', 'São Paulo', '355', default, 'Pinheiros', '55789965'),
    ('wrldtele', 'Urubu100', 'World Telecom', '34365698987885', '12545672', 'wlrdtelecom@gmail.com', 'Rua Augusta', 'SP', 'São Paulo', '224', default, 'Lapa', '37558469');

-- INSERINDO DADOS NA TABELA RESPONSAVEL
insert into tb_responsavel
    (fkEmpresa, nomeResponsavel, loginResponsavel, senhaResponsavel, email, telefone)
VALUES
    (1, 'Henrique', 'henri@ue', 'urubu100', 'admin@gmail.com', '95577231');

-- INSERINDO DADOS NA TABELA SALA
insert into tb_sala
values
    ('Sala 1', 34.5, 'Esse é o laboratório 3 da equipe X', default, 1),
    ('Sala 1', 44.3, 'Sala de reunião', '15', 4),
    ('Sala 1', 30, 'Esse é o laboratório 1, equipe 3', '4', 2),
    ('Sala 2', 25.4, 'Esse é o laboratório 2 da equipe de Analistas', '5', 2),
    ('Sala 1', 28, 'Sala 36', default, 3),
    ('Sala 2', 40, 'Sala de Suporte Técnico', '1', 3);

insert into tb_sensor
values
    ('dht11', 'temperatura', 'ativo', '°C', 1),
    ('dht11', 'temperatura', 'ativo', '°C', 2),
    ('dht11', 'temperatura', 'inativo', '°C', 4),
    ('dht11', 'umidade', 'ativo', 'UR %', 2),
    ('dht11', 'temperatura', 'ativo', '°C', 3),
    ('dht11', 'umidade', 'ativo', 'UR %', 3),
    ('ldr', 'luminosidade', 'ativo', 'Lux', 3),
    ('dht11', 'temperatura', 'ativo', '°C', 1),
    ('dht11', 'temperatura', 'ativo', '°C', 2),
    ('dht11', 'umidade', 'ativo', 'UR %', 1),
    ('dht11', 'umidade', 'ativo', 'UR %', 2),
    ('dht11', 'temperatura', 'ativo', '°C', 4),
    ('dht11', 'temperatura', 'manutenção', '°C', 1),
    ('dht11', 'umidade', 'inativo', 'UR %', 2),
    ('ldr', 'luminosidade', 'manutenção', 'Lux', 5);



select *
from tb_empresa;
select *
from tb_responsavel;
select *
from tb_sala;
select *
from tb_sensor;
select *
from tb_leitura;



insert into tb_sala
values
    ('Sala 2', 44.3, 'Sala de reunião', '15', 1),
    ('Sala 3', 30, 'Esse é o laboratório 1, equipe 3', '4', 1),
    ('Sala 4', 25.4, 'Esse é o laboratório 2 da equipe de Analistas', '5', 1),
    ('Sala 5', 28, 'Sala 36', default, 1),
    ('Sala 6', 40, 'Sala de Suporte Técnico', '1', 1);


insert into tb_sensor
VALUES
    ('dht11', 'temperatura', 'ativo', 'C°', 1),
    ('ldr', 'luminosidade', 'ativo', 'Lux', 1),
    ('dht11', 'temperatura', 'ativo', 'C°', 7),
    ('dht11', 'temperatura', 'ativo', 'C°', 8),
    ('ldr', 'luminosidade', 'ativo', 'Lux', 9),
    ('dht11', 'temperatura', 'ativo', 'C°', 10),
    ('dht11', 'temperatura', 'ativo', 'C°', 11);

insert into tb_sensor
VALUES
    ('dht11', 'temperatura', 'inativo', 'C°', 1),
    ('ldr', 'luminosidade', 'manutenção', 'Lux', 1),
    ('dht11', 'temperatura', 'inativo', 'C°', 7),
    ('dht11', 'temperatura', 'manutenção', 'C°', 8),
    ('ldr', 'luminosidade', 'ativo', 'Lux', 9),
    ('dht11', 'temperatura', 'inativo', 'C°', 10),
    ('dht11', 'temperatura', 'ativo', 'C°', 11);


SELECT sensor.idSensor, sensor.tipoSensor , sensor.tipoLeitura, sensor.unidadeMedida , sensor.statusSensor
FROM tb_sensor as sensor
    INNER JOIN tb_sala as sala
    ON sensor.fkSala = sala.idSala
WHERE fkSala = 8;


update tb_sensor set statusSensor = 'inativo' where idSensor = 19;


-- SALAS DA BANDTEC
insert into tb_sala
values
    ('Sala 1A', 44.3, 'Sala de CCO', '1°', 9),
    ('Sala 1B', 28.3, 'Sala de CCO', '1°', 9),
    ('Sala 2A', 44.3, 'Sala de Uso Geral', '2°', 9),
    ('Sala 2B', 28.3, 'Sala de Uso Geral', '2°', 9),
    ('Sala 3A', 44.3, 'Sala de ADSA', '3°', 9),
    ('Sala 3B', 28.3, 'Sala de ADSA', '3°', 9),
    ('Secretaria', 10, 'Adminstração', 'Térreo', 9);

select *
from tb_sala join tb_empresa on fkEmpresa = idEmpresa
where idEmpresa = 9;


insert into tb_sensor
VALUES
    ('dht11', 'temperatura', 'ativo', 'C°', 12),
    ('dht11', 'umidade', 'ativo', 'UR %', 12),
    ('ldr', 'luminosidade', 'ativo', 'Lux', 12),

    ('dht11', 'temperatura', 'inativo', 'C°', 13),
    ('dht11', 'temperatura', 'ativo', 'C°', 13),
    ('dht11', 'temperatura', 'ativo', 'C°', 13),

    ('dht11', 'umidade', 'manutenção', 'UR %', 14),
    ('dht11', 'umidade', 'manutenção', 'UR %', 14),
    ('dht11', 'umidade', 'manutenção', 'UR %', 14),

    ('dht11', 'temperatura', 'ativo', 'C°', 15),
    ('dht11', 'temperatura', 'inativo', 'C°', 15),
    ('dht11', 'umidade', 'inativo', 'UR %', 15),

    ('dht11', 'temperatura', 'inativo', 'C°', 16),
    ('dht11', 'temperatura', 'inativo', 'C°', 16),
    ('dht11', 'temperatura', 'inativo', 'C°', 16),

    ('dht11', 'temperatura', 'ativo', 'C°', 17),
    ('dht11', 'umidade', 'ativo', 'UR %', 17),
    ('ldr', 'luminosidade', 'ativo', 'Lux', 17),

    ('dht11', 'temperatura', 'ativo', 'C°', 18),
    ('dht11', 'umidade', 'ativo', 'UR %', 18),
    ('ldr', 'luminosidade', 'ativo', 'Lux', 18);



insert into tb_sensor values
	('dht11','temperatura','ativo','°C',12),
	('dht11','temperatura','ativo','°C',12),
	('dht11','temperatura','inativo','°C',12),
	('dht11','umidade','ativo','UR %',13),
	('dht11','temperatura','ativo','°C',13),
	('dht11','umidade','ativo','UR %',14),
	('ldr','luminosidade','ativo','Lux',14),
	('dht11','temperatura','ativo','°C',15),
	('dht11','temperatura','ativo','°C',16),
	('dht11','umidade','ativo','UR %',17),
	('dht11','umidade','ativo','UR %',18),
	('dht11','temperatura','ativo','°C',17),
	('dht11','temperatura','manutenção','°C',18),
	('dht11','umidade','inativo','UR %',15),
	('ldr','luminosidade','manutenção','Lux',16);
