var express = require('express');
var router = express.Router();
var sequelize = require('../models').sequelize;
var Responsavel = require('../models').Responsavel;
var env = process.env.NODE_ENV || 'development';


let sessoes = [];

/* Recuperar usuário por login e senha */
router.post('/autenticarResponsavel', function (req, res, next) {
    console.log('Recuperando usuário por login e senha');

    var login = req.body.login_user; // depois de .body, use o nome (name) do campo em seu formulário de login
    var senha = req.body.senha_user; // depois de .body, use o nome (name) do campo em seu formulário de login	

    let instrucaoSql = '';

    if (env == 'dev') {
        instrucaoSql = `select * from tb_responsavel where loginResponsavel='${login}' and BINARY senhaResponsavel='${senha}';`;

    } else {
        instrucaoSql = `select * from tb_responsavel where loginResponsavel='${login}' and senhaResponsavel='${senha}' COLLATE SQL_Latin1_General_CP1_CS_AS;`;

    }
    console.log(instrucaoSql);

    sequelize.query(instrucaoSql, {
        model: Responsavel
    }).then(resultado => {
        console.log(`Encontrados: ${resultado.length}`);

        if (resultado.length == 1) {
            sessoes.push(resultado[0].dataValues.login);
            console.log('sessoes: ', sessoes);
            res.json(resultado[0]);
        } else if (resultado.length == 0) {
            res.status(403).send('Login e/ou senha inválido(s)');
        } else {
            res.status(403).send('Mais de um usuário com o mesmo login e senha!');
        }

    }).catch(erro => {
        console.error(erro);
        res.status(500).send(erro.message);
    });
});

/* Cadastrar usuário */
router.post('/cadastrar/:fkEmpresa', function (req, res, next) {
    console.log('Criando um usuário');
    let idEmpresa = req.params.fkEmpresa;
    Responsavel.create({
        fkEmpresa: idEmpresa,
        nomeResponsavel: req.body.nomeResponsavel,
        loginResponsavel: req.body.loginResponsavel,
        senhaResponsavel: req.body.cadastroPassword,
        email: req.body.emailResponsavel,
        telefone: req.body.celularResponsavel,
    }).then(resultado => {
        console.log(`Registro criado: ${resultado}`)
        res.send(resultado);
    }).catch(erro => {
        console.error(erro);
        res.status(500).send(erro.message);
    });
});


/* Verificação de usuário */
router.get('/sessao/:login', function (req, res, next) {
    let login = req.params.login;
    console.log(`Verificando se o usuário ${login} tem sessão`);

    let tem_sessao = false;
    for (let u = 0; u < sessoes.length; u++) {
        if (sessoes[u] == login) {
            tem_sessao = true;
            break;
        }
    }

    if (tem_sessao) {
        let mensagem = `Usuário ${login} possui sessão ativa!`;
        console.log(mensagem);
        res.send(mensagem);
    } else {
        res.sendStatus(403);
    }

});


/* Logoff de usuário */
router.get('/sair/:login', function (req, res, next) {
    let login = req.params.login;
    console.log(`Finalizando a sessão do usuário ${login}`);
    let nova_sessoes = []
    for (let u = 0; u < sessoes.length; u++) {
        if (sessoes[u] != login) {
            nova_sessoes.push(sessoes[u]);
        }
    }
    sessoes = nova_sessoes;
    res.send(`Sessão do usuário ${login} finalizada com sucesso!`);
});


/* Recuperar todos os responsáveis */
router.get('/:fkEmpresa', function (req, res, next) {
    console.log('Recuperando todos os usuários');
    Responsavel.findAll({
        where: {
            fkEmpresa: req.params.fkEmpresa
        }
    }).then(resultado => {
        console.log(`${resultado.count} registros`);

        res.send(resultado)
    }).catch(erro => {
        console.error(erro);
        res.status(500).send(erro.message);
    });
});

module.exports = router;
