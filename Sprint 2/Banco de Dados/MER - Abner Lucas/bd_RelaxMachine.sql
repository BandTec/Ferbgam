create database relaxmachine;
use relaxmachine;

create table tb_empresa (
	idEmpresa int primary key auto_increment,
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
	fkEmpresa int,
    foreign key(fkEmpresa) references tb_empresa(idEmpresa),
    idResponsavel int,
    primary key(fkEmpresa, idResponsavel),
    nome varchar(80) not null,
    login char(8) unique not null,
    senha varchar(45) not null,
    email varchar(80) not null,
    telCelular varchar(20) not null,
    telFixo varchar(20)
);

create table tb_sala (
	idSala int primary key auto_increment,
    area double not null,
    descricao varchar(45) not null,
    andar varchar(20),
    fkEmpresa int,
    foreign key(fkEmpresa) references tb_empresa(idEmpresa)
);

create table tb_sensor (
	idSensor int primary key auto_increment,
    tipoSensor varchar(15) not null,
    check (tipoSensor = 'temperatura' or tipoSensor = 'umidade' or tipoSensor = 'luminosidade'),
    statusSensor varchar(15) not null,
    check (statusSensor = 'ativo' or statusSensor = 'inativo' or statusSensor = 'manutenção'),
    unidadeMedida varchar(10) not null,
    check (unidadeMedida = '°C' or unidadeMedida = 'UR %' or unidadeMedida = 'Lux'),
    fkSala int,
    foreign key(fkSala) references tb_sala(idSala)
);

create table tb_leitura (
	fkSensor int,
    foreign key(fkSensor) references tb_sensor(idSensor),
    idLeitura int,
    primary key(fkSensor,idLeitura),
    dataHoraRegister datetime default current_timestamp not null,
    valorLeitura float not null
);

insert into tb_empresa values
	(null,'13264578964513','Log Logistica','Centro de Logisticas LTDA LOG','462315978','logsuporte@outlook.com','Avenida Santanna Mendes','RJ','Rio de janeiro','338',default,'Lapa','12123456'),
	(null,'12345678965432','Law Advocacia','Escritórios de Advocacia Santanna','123456789','lawadvsuporte@gmail.com','Rua Avelino Silva','SP','São Caetano','124','Predio 2','Vila Pinhais','12346587'),
	(null,'33633533412358','Money Contabilidade','Contabilidade Figueira Souza LTDA','33456721','moncontabil@outlook.com','Rua Afonso Sardinha','SP','Osasco','12','apt 64','Jardim Melo','37195842'),
	(null,'13264578965412','Hemolines Solution','Soluções Hemolines LTDA','11122233','hmssolutions@hotmail.com','Avenida Faria Lima','SP','São Paulo','355',default,'Pinheiros','55789965'),
	(null,'34365698987885','World Telecom','Telecomunicações Centrais','12545672','wlrdtelecom@gmail.com','Rua Augusta','SP','São Paulo','224',default,'Lapa','37558469');

insert into tb_responsavel values
	(1,1,'André Maurício','12345678','123','andre@gmail.com','923456789','36364578'),
    (2,1,'John Lennon','11234568','MyP@sswrd','johnlenn@outlook.com','958556421',default),
    (3,1,'João Santos','33545687','meucachorro','joaosantos7775@gmail.com','998756134','12346789'),
    (4,1,'Lucca Guerdes','77864531','af112356789456','lucsguerd@hotmail.com','978462345',default),
    (4,2,'Pedro Gonçalves','44638951','B@outisl8976$','pedrogonca@outlook.com','123456789','56789453');
    
insert into tb_sala values 
	(null,34.5,'Esse é o laboratório 3 da equipe X',default,1),
	(null,44.3,'Sala de reunião','15',4),
	(null,30,'Esse é o laboratório 1, equipe 3','4',2),
	(null,25.4,'Esse é o laboratório 2 da equipe de Analistas','5',2),
	(null,28,'Sala 36',default,3),
	(null,40,'Sala de Suporte Técnico','1',3);

insert into tb_sensor values
	(null,'temperatura','ativo','°C',1),
	(null,'temperatura','ativo','°C',2),
	(null,'temperatura','inativo','°C',4),
	(null,'umidade','ativo','UR %',2),
	(null,'temperatura','ativo','°C',3),
	(null,'umidade','ativo','UR %',3),
	(null,'luminosidade','ativo','Lux',3),
	(null,'temperatura','ativo','°C',1),
	(null,'temperatura','ativo','°C',2),
	(null,'umidade','ativo','UR %',1),
	(null,'umidade','ativo','UR %',2),
	(null,'temperatura','ativo','°C',4),
	(null,'temperatura','manutenção','°C',1),
	(null,'umidade','inativo','UR %',2),
	(null,'luminosidade','manutenção','Lux',5);

insert into tb_leitura values
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
    
select * from tb_empresa;
select * from tb_responsavel;
select * from tb_sala;
select * from tb_leitura;
select * from tb_sensor;
desc tb_empresa;
-- inserindo uma empresa
insert into tb_empresa values
	(null,'13264567894562','Bandtec','Faculdade de Tecnologia Bandeirantes','34659785','bandtec@gmail.com',
    'Rua Haddock Lobo','SP','São Paulo','595',default,'Cerqueira César','12346858');

select * from tb_empresa;
select * from tb_responsavel;

-- Inserindo um responsável na empresa Bandtec
insert into tb_responsavel values
	(6,1,'Fernando Brandão','3332221','@365','fernando.brandao@bandtec.com.br','955645321',default);

-- Exibindo as empresas com seus respectivos responsáveis
select e.idEmpresa, e.nomeFantasia, e.uf, e.cidade,  e.telefone as 'Telefone da Empresa',
		r.idResponsavel, r.nome, r.telCelular as 'Telefone do responsável'
        from tb_empresa as e inner join tb_responsavel as r on e.idEmpresa = r.fkEmpresa;
        
-- Exibindo as empresas e suas respectivas salas
select e.idEmpresa, e.nomeFantasia as 'Nome da empresa', e.uf, e.cidade,  e.telefone as 'Telefone da Empresa',
		s.idSala, s.area as 'Área total do ambiente(m²)', s.descricao as 'Descrição da sala', s.andar
        from tb_empresa as e join tb_sala as s on e.idEmpresa = s.fkEmpresa order by idEmpresa; 

-- Exibindo as salas e seus respectivos sensores
select * from tb_sala inner join tb_sensor on idSala = fkSala;

-- Exibindo dados do sensor com suas respectivas leituras
select * from tb_sensor inner join tb_leitura on idSensor = fkSensor;

-- Exibindo dados do sensor com suas respectivas leituras de forma especificada
select * from tb_sensor inner join tb_leitura on idSensor = fkSensor where idSensor = 2;

-- Contando a quantidade de sensores de determinada sala
select count(se.idSensor) as 'Quantidade de sensores' from tb_sensor as se where fkSala = 1;

-- Selecionando os dados do sensor com suas respectivas leituras, tal como a sala em que o sensor se encontra e a empresa que o mesmo pertence.
-- Também seria possível adicionar um where para especificar de qual empresa, sala ou sensor se deseja capturar os dados
select se.idSensor, se.tipoSensor, se.statusSensor,
		l.idLeitura, l.valorLeitura, se.unidadeMedida, l.dataHoraRegister,
        e.nomeFantasia, sa.descricao, sa.idSala
        from tb_sensor as se join tb_leitura as l on se.idSensor = l.fkSensor 
        join tb_sala as sa on sa.idSala = se.fkSala
        join tb_empresa as e on e.idEmpresa = sa.fkEmpresa ;



