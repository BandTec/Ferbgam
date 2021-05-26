create table tb_empresa (
	idEmpresa int primary key identity,
    loginEmpresa varchar(50) unique,
    senhaEmpresa varchar(50) not null,
    cnpj char(14) not null,
    nomeFantasia varchar(80) not null,
    razaoSocial varchar(80) not null,
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
    idResponsavel int primary key identity,
	fkEmpresa int,
    foreign key(fkEmpresa) references tb_empresa(idEmpresa),
    nome varchar(80) not null,
    loginResponsavel varchar(50) unique not null,
    senhaResponsavel varchar(45) not null,
    email varchar(80) not null,
    telefone varchar(20) not null
);

create table tb_sala (
	idSala int primary key identity,
    area decimal(8,2) not null,
    descricao varchar(50) not null,
    andar varchar(20),
    fkEmpresa int,
    foreign key(fkEmpresa) references tb_empresa(idEmpresa)
);

create table tb_sensor (
	idSensor int primary key identity,
    tipoSensor varchar(15) not null,
    tipoLeitura varchar(15) not null,
    statusSensor varchar(15) not null,
    unidadeMedida varchar(5) not null,
    fkSala int,
    foreign key(fkSala) references tb_sala(idSala)
);

create table tb_leitura (
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
insert into tb_empresa values
	('13264578964513','loglogistica','Urubu100','Log Logistica','Centro de Logisticas LTDA LOG','462315978','logsuporte@outlook.com','Avenida Santanna Mendes','RJ','Rio de janeiro','338',default,'Lapa','12123456'),
	('12345678965432','lawadv','Urubu100','Law Advocacia','Escritórios de Advocacia Santanna','123456789','lawadvsuporte@gmail.com','Rua Avelino Silva','SP','São Caetano','124','Predio 2','Vila Pinhais','12346587'),
	('33633533412358','moneycontab','Urubu100','Money Contabilidade','Contabilidade Figueira Souza LTDA','33456721','moncontabil@outlook.com','Rua Afonso Sardinha','SP','Osasco','12','apt 64','Jardim Melo','37195842'),
	('13264578965412','hemolines','Urubu100','Hemolines Solution','Soluções Hemolines LTDA','11122233','hmssolutions@hotmail.com','Avenida Faria Lima','SP','São Paulo','355',default,'Pinheiros','55789965'),
	('34365698987885','wrldtele','Urubu100','World Telecom','Telecomunicações Centrais','12545672','wlrdtelecom@gmail.com','Rua Augusta','SP','São Paulo','224',default,'Lapa','37558469');
    
-- INSERINDO DADOS NA TABELA RESPONSAVEL
insert into tb_responsavel (fkEmpresa, nome, loginResponsavel, senhaResponsavel, email, telefone) VALUES
	(1, 'Henrique', 'henri@ue', 'urubu100','admin@gmail.com', '95577231');

-- INSERINDO DADOS NA TABELA SALA
insert into tb_sala values 
	(34.5,'Esse é o laboratório 3 da equipe X',default,1),
	(44.3,'Sala de reunião','15',4),
	(30,'Esse é o laboratório 1, equipe 3','4',2),
	(25.4,'Esse é o laboratório 2 da equipe de Analistas','5',2),
	(28,'Sala 36',default,3),
	(40,'Sala de Suporte Técnico','1',3);
    
insert into tb_sensor values
	('dht11','temperatura','ativo','°C',1),
	('dht11','temperatura','ativo','°C',2),
	('dht11','temperatura','inativo','°C',4),
	('dht11','umidade','ativo','UR %',2),
	('dht11','temperatura','ativo','°C',3),
	('dht11','umidade','ativo','UR %',3),
	('ldr','luminosidade','ativo','Lux',3),
	('dht11','temperatura','ativo','°C',1),
	('dht11','temperatura','ativo','°C',2),
	('dht11','umidade','ativo','UR %',1),
	('dht11','umidade','ativo','UR %',2),
	('dht11','temperatura','ativo','°C',4),
	('dht11','temperatura','manutenção','°C',1),
	('dht11','umidade','inativo','UR %',2),
	('ldr','luminosidade','manutenção','Lux',5);

select * from tb_empresa;
select * from tb_responsavel;	
select * from tb_sala;
select * from tb_leitura;
select * from tb_sensor;







