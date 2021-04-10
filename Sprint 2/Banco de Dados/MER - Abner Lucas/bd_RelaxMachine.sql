create database db_rlx_machine;
use db_rlx_machine;
drop database db_rlx_machine;

create table empresa (
	idEmpresa int primary key auto_increment,
    cnpj char(14),
    nome varchar(60),
    telefone varchar(20),
    email varchar(80),
    logradouro varchar(80),
    uf char(2),
    cidade varchar(60),
    numero varchar(45),
    complemento varchar(45),
    bairro varchar(60),
    cep char(8)
);

create table responsavel (
	idResponsavel int primary key auto_increment,
    nome varchar(60),
    login char(8) unique,
    senha varchar(45),
    email varchar(80),
    telCelular varchar(20),
    telFixo varchar(20),
    fkEmpresa int,
    foreign key(fkEmpresa) references empresa(idEmpresa)
);

create table sala (
	idSala int primary key auto_increment,
    area double,
    descricao varchar(45),
    fkEmpresa int,
    foreign key(fkEmpresa) references empresa(idEmpresa)
);

create table sensor (
	idSensor int primary key auto_increment,
    tipoSensor varchar(45),
    statusSensor varchar(30),
    check (statusSensor='ativo' or statusSensor='inativo' or statusSensor='manutenção'),
    fkSala int,
    foreign key(fkSala) references sala(idSala)
);

create table valorLido (
	fkSensor int,
    foreign key(fkSensor) references sensor(idSensor),
    idValorLido int,
    primary key(fkSensor,idValorLido),
    dataHoraRegister datetime default current_timestamp,
    dadoLeitura varchar(45)
);
desc empresa;

insert into empresa values
	(null,'13264578964513','Log Logistica','462315978','logsuporte@outlook.com','Avenida Santanna Mendes','RJ','Rio de janeiro','338',default,'Lapa','12123456'),
	(null,'12345678965432','Century','123456789','centurysuporte@gmail.com','Rua Avelino Silva','SP','São Caetano','124','Predio 2','Vila Pinhais','12346587'),
	(null,'46234578964521','Fleury','12345678','fleurycontato@gmail.com','Avenida Mackenzie Freitas','SC','Santa Catarina','224',default,'Vila Lemos','46567895'),
	(null,'33633533412358','Money Contabilidade','33456721','moncontabil@outlook.com','Rua Afonso Sardinha','SP','Osasco','12','apt 64','Jardim Melo','37195842'),
	(null,'13264578965412','Hemolines Solution','11122233','hmssolutions@hotmail.com','Avenida Faria Lima','SP','São Paulo','355',default,'Pinheiros','55789965'),
	(null,'34365698987885','World Telecom','12545672','wlrdtelecom@gmail.com','Rua Augusta','SP','São Paulo','224',default,'Lapa','37558469');

select * from responsavel;


insert into responsavel values
	(null,'André Maurício','12345678','123','andre@gmail.com','923456789','36364578',1),
    (null,'John Lennon','11234568','MyP@sswrd','johnlenn@outlook.com','958556421','37412689',1),
    (null,'João Santos','33545687','meucachorro','joaosantos7775@gmail.com','998756134','12346789',3),
    (null,'Lucca Guerdes','77864531','af112356789456','lucsguerd@hotmail.com','978462345','70705370',2),
    (null,'Pedro Gonçalves','44638951','B@outisl8976$','pedrogonca@outlook.com','123456789','56789453',5);
    
select * from responsavel;

select e.idEmpresa,e.nome,e.uf,r.nome as NomeResponsavel from empresa as e left join responsavel as r on idEmpresa = fkEmpresa;
desc sensor;
desc sala;

insert into sala values 
	(null,34.5,"Esse é o laboratório 3 da equipe X",1),
	(null,44.3,"Sala de reunião",4),
	(null,30,"Esse é o laboratório 1, equipe 3",2),
	(null,25.4,"Esse é o laboratório 2 da equipe de Analistas",2),
	(null,28,"Sala 36",3),
	(null,40,"Sala de Suporte Técnico",3);

insert into sensor values
	(null,'temperatura','ativo',1),
	(null,'temperatura','ativo',2),
	(null,'temperatura','inativo',4),
	(null,'umidade','ativo',2),
	(null,'temperatura','ativo',3),
	(null,'umidade','ativo',3),
	(null,'luminosidade','ativo',3),
	(null,'temperatura','ativo',1),
	(null,'temperatura','ativo',2),
	(null,'umidade','ativo',1),
	(null,'umidade','ativo',2),
	(null,'temperatura','ativo',4);

select * from sensor;

desc valoresColetados;
insert into valorLido values
	(1,1,default,'23.00'),
	(1,2,default,'23.5'),
	(1,3,default,'22.4'),
	(1,4,default,'23.9'),
	(2,1,default,'22.2'),
	(2,2,default,'22.4'),
	(2,3,default,'23.1'),
	(4,1,default,'40'),
	(4,2,default,'44'),
	(4,3,default,'55'),
	(5,1,default,'22.5'),
	(5,2,default,'23.5'),
	(6,1,default,'60'),
	(6,2,default,'63'),
	(7,1,default,'746'),
	(7,2,default,'766'),
	(7,3,default,'770'),
	(7,4,default,'775'),
	(7,5,default,'800');
    
select * from valorLido;

select s.idSensor,s.tipoSensor,s.statusSensor,
		vl.dataHoraRegister, vl.dadoLeitura,
		sa.descricao, sa.idSala
		from sensor as s join valorLido as vl on idSensor = fkSensor join sala as sa
        on s.fkSala = sa.idSala where s.idSensor = 2 order by vl.dadoLeitura desc;
    

