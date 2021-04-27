
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
select * from tb_empresa;
select * from tb_responsavel;
-- Exibindo dados do sensor com suas respectivas leituras
select * from tb_sensor inner join tb_leitura on idSensor = fkSensor;

-- Exibindo dados do sensor com suas respectivas leituras de forma especificada
select * from tb_sensor inner join tb_leitura on idSensor = fkSensor where idSensor = 2;

-- Contando a quantidade de sensores de determinada sala
select fkSala as "Id da sala",count(se.idSensor) as 'Quantidade de sensores' from tb_sensor as se where fkSala = 2;

-- Selecionando os dados do sensor com suas respectivas leituras, tal como a sala em que o sensor se encontra e a empresa que o mesmo pertence.
-- Também seria possível adicionar um where para especificar de qual empresa, sala ou sensor se deseja capturar os dados
select se.idSensor, se.tipoSensor, se.statusSensor,
		l.idLeitura, l.valorLeitura, se.unidadeMedida, l.dataHoraRegister,
        e.nomeFantasia, sa.descricao, sa.idSala
        from tb_sensor as se join tb_leitura as l on se.idSensor = l.fkSensor 
        join tb_sala as sa on sa.idSala = se.fkSala
        join tb_empresa as e on e.idEmpresa = sa.fkEmpresa;