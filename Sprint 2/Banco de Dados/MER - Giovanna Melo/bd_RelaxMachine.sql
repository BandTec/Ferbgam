Create database Relax_Machine;
USE Relax_Machine;

CREATE TABLE Empresa(
	idEmpresa int primary key auto_increment,
    cnpj char (19),
    nome varchar (50),
    email varchar (45),
    telefone varchar (18),
    logradouro varchar (50),
    bairro varchar (50),
    cidade varchar (50),
    uf char (2),
    numero varchar (5)
);

CREATE TABLE Responsavel(
	idResponsavel int primary key auto_increment,
    nome varchar (50),
    email varchar (50),
    senha varchar (10),
    fkEmpresa int,
    foreign key (fkEmpresa) references Empresa (idEmpresa)
);
DROP TABLE TelefoneResponsavel;
CREATE TABLE TelefoneResponsavel(
	idTelefoneResponsavel int,
    fkResponsavel int, 
    foreign key (fkResponsavel) references Responsavel (idResponsavel),
    primary key (idTelefoneResponsavel, fkResponsavel),
    numero varchar (18),
    tipo varchar (7),
    Check ( tipo = 'Fixo' or tipo = 'Celular')
);

CREATE TABLE Sala(
	idSala int primary key auto_increment,
    descricaoSala varchar (50),
    area double,
    fkEmpresa int,
    foreign key (fkEmpresa) references Empresa (idEmpresa)
);

CREATE TABLE Sensor (
	idSensor int primary key auto_increment,
    tipoSensor varchar (12),
    Check (tipoSensor = 'Temperatura'or tipoSensor = 'Umidade' or tipoSensor = 'Luminosidade'),
    statusSensor varchar (15),
    Check (statusSensor = 'Ativo'or statusSensor = 'Desativado' or statusSensor = 'Em manutenção'),
    fkSala int,
    foreign key (fkSala) references Sala (idSala)
);

CREATE TABLE Variacoes (
	idVariacoes int,
    fkSensor int,
    foreign key (fkSensor) references Sensor (idSensor),
    primary key (idVariacoes, fkSensor),
    dataHoraLeitura datetime default current_timestamp,
    leitura varchar (5)
);

INSERT INTO Empresa (cnpj, nome, email, telefone, logradouro, bairro, cidade, uf, numero) VALUES 
	('548.762.565/5556-54', 'BandTec', 'BandTec@empresa.com.br', '(11) 6545-3254', 'Rua Haddock Lobo', 'Cerqueira César', 'São Paulo', 'SP', '595'),
    ('654.514.544/1154-82', 'Grupo PLL', 'grupoPll@empresa.com', '(11) 5641-8812', 'Avenida Miruna', 'Indianópolis', 'São Paulo', 'SP', '168');
    
    SELECT * FROM Empresa;