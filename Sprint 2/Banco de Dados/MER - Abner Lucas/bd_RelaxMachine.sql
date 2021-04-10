create database db_rlx_machine;
use db_rlx_machine;

create table empresa (
	idEmpresa int primary key auto_increment,
    cnpj char(14),
    nome varchar(60),
    telefone varchar(20),
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
    login char(20) unique,
    senha varchar(45),
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

create table valoresColetados (
	fkSensor int,
    foreign key(fkSensor) references sensor(idSensor),
    idValoresColetados int,
    primary key(fkSensor,idValoresColetados),
    dataHoraRegister datetime default current_timestamp,
    dadoLeitura varchar(45)
);

insert into empresa values 
	(null,'12345678965432','Century','123456789','Rua Avelino Silva','SP','São Caetano','124','Predio 2','Vila Pinhais','12346587');

insert into empresa values 
	(null,'13264578964513','Log Logistica','462315978','Avenida Santanna Mendes','RJ','Rio de janeiro','338',default,'Lapa','12123456');

select * from empresa;
desc responsavel;
alter table responsavel modify login char(10);


insert into responsavel values
	(null,'André Maurício','1122334455','123','123456789','36364578',1);
    
select * from responsavel;

select e.idEmpresa,e.nome,e.uf,r.nome from empresa as e left join responsavel as r on idEmpresa = fkEmpresa;
desc sensor;
desc sala;

insert into sala values 
	(null,34.5,"Esse é o laboratório 3 da equipe X",1);
    
insert into sala values 
	(null,40,"Esse é o laboratório 1 de Suporte",2);

insert into sensor values
	(null,'temperatura','ativo',1);
    
insert into sensor values
	(null,'umidade','ativo',2);
    
select * from sala;

desc valoresColetados;

insert into valoresColetados values
	(2,2,default,'24,4');
    
insert into valoresColetados values
	(2,1,default,'45.8');
    
insert into valoresColetados values
	(3,1,default,'20.08');
    
select * from valoresColetados;

select s.idSensor,s.tipoSensor,s.statusSensor,
		vc.dataHoraRegister, vc.dadoLeitura,
		sa.descricao
		from sensor as s join valoresColetados as vc on idSensor = fkSensor join sala as sa on s.fkSala = sa.idSala where s.idSensor = 3;
    

