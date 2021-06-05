create database relax;
use relax;



create table tb_empresa (
	idEmpresa int primary key auto_increment,
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

create table tb_responsavel (
    idResponsavel int primary key auto_increment,
	fkEmpresa int,
    foreign key(fkEmpresa) references tb_empresa(idEmpresa),
    nomeResponsavel varchar(80) not null,
    loginResponsavel varchar(50) unique not null,
    senhaResponsavel varchar(50) not null,
    email varchar(80) not null,
    telefone varchar(20) not null
);

create table tb_sala (
	idSala int primary key auto_increment,
    nomeSala varchar(50),
    area decimal(8,2) not null,
    descricao varchar(50) not null,
    andar varchar(20),
    fkEmpresa int,
    foreign key(fkEmpresa) references tb_empresa(idEmpresa)
);

create table tb_sensor (
	idSensor int primary key auto_increment,
    tipoSensor varchar(15) not null,
    tipoLeitura varchar(15) not null,
    statusSensor varchar(15) not null,
    unidadeMedida varchar(5) not null,
    fkSala int,
    foreign key(fkSala) references tb_sala(idSala)
);

create table tb_leitura (
	idLeitura int primary key auto_increment,
	fkSensor int,
    foreign key(fkSensor) references tb_sensor(idSensor),
    dataHoraRegister datetime default current_timestamp not null,
    valorLeitura decimal(10,2)
);


desc tb_leitura;
desc tb_empresa;
desc tb_responsavel;
desc tb_sensor;
desc tb_sala;

-- INSERINDO DADOS NA TABELA EMPRESA
insert into tb_empresa values
	(null,'loglogistica','Urubu100','Log Logistica','13264578964513','462315978','logsuporte@outlook.com','Avenida Santanna Mendes','RJ','Rio de janeiro','338',default,'Lapa','12123456'),
	(null,'lawadv','Urubu100','Law Advocacia','12345678965432','123456789','lawadvsuporte@gmail.com','Rua Avelino Silva','SP','São Caetano','124','Predio 2','Vila Pinhais','12346587'),
	(null,'moneycontab','Urubu100','Money Contabilidade','33633533412358','33456721','moncontabil@outlook.com','Rua Afonso Sardinha','SP','Osasco','12','apt 64','Jardim Melo','37195842'),
	(null,'hemolines','Urubu100','Hemolines Solution','13264578965412','11122233','hmssolutions@hotmail.com','Avenida Faria Lima','SP','São Paulo','355',default,'Pinheiros','55789965'),
	(null,'wrldtele','Urubu100','World Telecom','34365698987885','12545672','wlrdtelecom@gmail.com','Rua Augusta','SP','São Paulo','224',default,'Lapa','37558469');
    
-- INSERINDO DADOS NA TABELA RESPONSAVEL
insert into tb_responsavel (fkEmpresa, nomeResponsavel, loginResponsavel, senhaResponsavel, email, telefone) VALUES
	(1, 'Henrique', 'henri@ue', 'urubu100','admin@gmail.com', '95577231');

-- INSERINDO DADOS NA TABELA SALA
insert into tb_sala values 
	(null,'Sala 1',34.5,'Esse é o laboratório 3 da equipe X',default,1),
	(null,'Sala 1',44.3,'Sala de reunião','15',4),
	(null,'Sala 1',30,'Esse é o laboratório 1, equipe 3','4',2),
	(null,'Sala 2',25.4,'Esse é o laboratório 2 da equipe de Analistas','5',2),
	(null,'Sala 1',28,'Sala 36',default,3),
	(null,'Sala 2',40,'Sala de Suporte Técnico','1',3);
    
insert into tb_sensor values
	(null,'dht11','temperatura','ativo','°C',1),
	(null,'dht11','temperatura','ativo','°C',2),
	(null,'dht11','temperatura','inativo','°C',4),
	(null,'dht11','umidade','ativo','UR %',2),
	(null,'dht11','temperatura','ativo','°C',3),
	(null,'dht11','umidade','ativo','UR %',3),
	(null,'ldr','luminosidade','ativo','Lux',3),
	(null,'dht11','temperatura','ativo','°C',1),
	(null,'dht11','temperatura','ativo','°C',2),
	(null,'dht11','umidade','ativo','UR %',1),
	(null,'dht11','umidade','ativo','UR %',2),
	(null,'dht11','temperatura','ativo','°C',4),
	(null,'dht11','temperatura','manutenção','°C',1),
	(null,'dht11','umidade','inativo','UR %',2),
	(null,'ldr','luminosidade','manutenção','Lux',5);

select * from tb_empresa;
select * from tb_responsavel;
select * from tb_sala;
select * from tb_leitura;
select * from tb_sensor where idSensor = 27;



SELECT * FROM tb_leitura WHERE idLeitura = 2892;



SELECT sensor.tipoSensor ,sensor.tipoLeitura, sensor.unidadeMedida ,sensor.statusSensor FROM tb_sensor as sensor
 	INNER JOIN tb_sala as sala 
		ON sensor.fkSala = sala.idSala
	WHERE fkSala = 3;


insert into tb_sala values 
	(null,'Sala 2',34.5,'Sala de atendimento',default,1),
	(null,'Sala 3',44.3,'Sala de testes','15',1),
	(null,'Sala 4',30,'Servidor','4',1),
	(null,'Sala 5',25.4,'Arquivo','5',1);
	
    
insert into tb_sensor values
	(null,'dht11','temperatura','ativo','°C',1),
	(null,'dht11','umidade','manutenção','UR %',1),
	(null,'ldr','luminosidade','inativo','Lux',1),
    (null,'dht11','temperatura','ativo','°C',7),
	(null,'dht11','umidade','manutenção','UR %',7),
	(null,'ldr','luminosidade','inativo','Lux',7),
    (null,'dht11','temperatura','ativo','°C',8),
	(null,'dht11','umidade','inativo','UR %',8),
	(null,'ldr','luminosidade','manutenção','Lux',8),
    (null,'dht11','temperatura','inativo','°C',9),
	(null,'dht11','umidade','ativo','UR %',9),
	(null,'ldr','luminosidade','ativo','Lux',9),
    (null,'dht11','temperatura','inativo','°C',10),
	(null,'dht11','umidade','manutenção','UR %',10),
	(null,'ldr','luminosidade','inativo','Lux',10);
    
select l.idLeitura, l.valorLeitura ,s.tipoLeitura  from tb_leitura as l join tb_sensor as s on fkSensor = idSensor
	join tb_sala on fkSala = idSala
    WHERE idSala = 1
    ORDER BY l.idLeitura DESC LIMIT 3;





select l.idLeitura, l.fkSensor, l.valorLeitura, s.tipoLeitura  from tb_leitura as l join tb_sensor as s on fkSensor = idSensor
	join tb_sala on fkSala = idSala
    WHERE idSala = 3
    order by l.idLeitura DESC LIMIT 3;
    
    
    
select * from tb_leitura WHERE fkSensor = 10  order by idLeitura desc limit 1;



