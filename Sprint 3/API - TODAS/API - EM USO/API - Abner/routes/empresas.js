var express = require('express');
var router = express.Router();
var sequelize = require('../models').sequelize;
var Empresa = require('../models').Empresa;

/* CADASTRAR EMPRESAS */
router.post('/cadastrarEmpresa', function (req, res, next) {
    console.log('Cadastrando empresa...');

    Empresa.create({
        loginEmpresa: req.body.loginEmpresa,
        senhaEmpresa : req.body.senhaEmpresa,
        nomeEmpresa : req.body.nomeEmpresa,
        cnpj : req.body.cnpjEmpresa,
        telefone: req.body.telefoneEmpresa,
        email : req.body.emailEmpresa,
        logradouro : req.body.logradouroEmpresa,
        uf : req.body.ufEmpresa,
        cidade : req.body.cidadeEmpresa,
        numero : req.body.numeroEmpresa,
        complemento : req.body.complementoEmpresa,
        bairro : req.body.bairroEmpresa,
        cep : req.body.cepEmpresa
    }).then(resultado => {
        console.log(`Registro criado: ${resultado}`)
        res.send(resultado);
    }).catch(erro => {
        console.error(erro);
        res.status(500).send(erro.message);
    });
});

module.exports = router;
