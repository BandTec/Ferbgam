var express = require('express');
var router = express.Router();
var sequelize = require('../models').sequelize;
var Sala = require('../models').Sala;
var env = process.env.NODE_ENV || 'development';



//Pegar todas as salas 
router.get('/:idEmpresa', async (req, res, next) => {
    const idEmpresa = req.params.idEmpresa;
    let salas;
    let novasSalas = [];

    Sala.findAll({ where: { fkEmpresa: idEmpresa } }).then((response) => {
        salas = response;

        let getSala = new Promise((resolve, reject) => {
            salas.forEach((sala, index, array) => {

                let instrucaoSql = `
            SELECT sensor.tipoLeitura, sensor.statusSensor FROM tb_sensor as sensor
            INNER JOIN tb_sala as sala
            ON sensor.fkSala = sala.idSala
            WHERE fkSala = ${sala.idSala}`;

                sequelize.query(instrucaoSql, {
                    model: Sala
                }).then(resultado => {
                    novasSalas.push({
                        idSala: sala.idSala,
                        nomeSala: sala.nomeSala,
                        area: sala.areaSala,
                        descricao: sala.descricao,
                        andar: sala.andar,
                        fkEmpresa: sala.fkEmpresa,
                        sensores: resultado
                    })

                    if (index == array.length - 1) resolve();
                })

            });
        })

        getSala.then(() => {
            res.send(novasSalas);
        }).catch((error) => {
            console.log(error);
        });
    }).catch((error) => {
        console.log(error);
    })
});





module.exports = router;