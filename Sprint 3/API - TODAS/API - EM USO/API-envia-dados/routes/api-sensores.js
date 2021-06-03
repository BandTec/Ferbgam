var express = require('express');
var router = express.Router();
var sequelize = require('../models').sequelize;
// var Leitura = require('../models').Leitura;
var env = process.env.NODE_ENV || 'development';

const { ArduinoDataTemp } = require("../app-sensores/newserial");
const { ArduinoDataHumidity } = require("../app-sensores/serialHumidity");

const { ArduinoDataSwitch } = require("../app-sensores/serialSwitch");
const { ArduinoDataLuminosity } = require("../app-sensores/serialLuminosidity");

router.get("/sendData/:vetorSalas", (request, response) => {
    const temperature = ArduinoDataTemp.List[ArduinoDataTemp.List.length - 1];
    const Humidity = ArduinoDataHumidity.List[ArduinoDataHumidity.List.length - 1];
    //luminosidade = ArduinoDataLuminosity.List[ArduinoDataLuminosity.List.length -1]

    let vetorSalas = request.params.vetorSalas;

    var instrucaoSql = "";

    vetorSalas = Array.from(vetorSalas);



    setInstrucao = (dbo) => {
        if (dbo != undefined && dbo != '' && dbo != null) {




            instrucaoSql = `INSERT into tb_leitura (fkSensor, dataHoraRegister, valorLeitura)
            values 
            
            (1,default,'${Humidity + 20}'),
            (1,default,'${temperature + 30}'),
            (1,default,'${temperature + 5}');`;
        } else {
            instrucaoSql = `INSERT INTO tb_leitura (fkSensor, dataHoraRegister, valorLeitura) VALUES 
            (1,default,'${Humidity + 20}'),
            (1,default,'${temperature + 30}'),
            (1,default,'${temperature + 5}');`;
        }
    }

    if (env == "dev") {

        // Na variável abaixo, coloque o Insert que será executado no Workbench
        // salvo exceções, é igual a SQL Server



        // instrucaoSql = `INSERT INTO tb_leitura (fkSensor, dataHoraRegister, valorLeitura) VALUES 
        // (1,default,'${Humidity + 20}'),
        // (1,default,'${temperature + 30}'),
        // (1,default,'${temperature + 5}');`;
        // // (${temperature + 10}, ${Humidity + 20}, '${agora()}', 1),
        // // (${temperature - 10}, ${Humidity + 20}, '${agora()}', 2),
        // // (${temperature + 5}, ${Humidity - 20}, '${agora()}', 3),
        // (${temperature - 5}, ${Humidity - 20}, '${agora()}', 4);`
        setInstrucao();
    } else {

        // Na variável abaixo, coloque o Insert que será executado no SQL Server
        // salvo exceções, é igual a Workbench
        // instrucaoSql = `INSERT into dbo.leitura (temperatura, umidade, momento, fkcaminhao)
        // values (${temperature + 10}, ${Humidity + 20}, '${agora()}', 1),
        // (${temperature - 10}, ${Humidity + 20}, '${agora()}', 2),
        // (${temperature + 5}, ${Humidity - 20}, '${agora()}', 3),
        // (${temperature - 5}, ${Humidity - 20}, '${agora()}', 4);`;
        setInstrucao('dbo');
    }


    response.send(vetorSalas);
    // sequelize.query(instrucaoSql, {
    //     //model: Leitura,
    //     //mapToModel: true
    // }).then(resultado => {
    //     console.log(`\n\nRegistro inserido com sucesso!\nO comando executado foi como abaixo:\n`);
    //     console.log(instrucaoSql)
    //     console.log(`\nFim do comando SQL executado.`);
    //     response.status(200).send("Dado inserido com sucesso.");
    // }).catch(erro => {
    //     console.error(erro);
    //     response.status(500).send(erro.message);
    // });
});

function agora() {
    const agora_d = new Date();
    return `${agora_d.getFullYear()}-${agora_d.getMonth() + 1}-${agora_d.getDate()} ${agora_d.getHours()}:${agora_d.getMinutes()}:${agora_d.getSeconds()}`;
}

module.exports = router;