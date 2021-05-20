'use strict';

/* 
lista e explicação dos Datatypes:
https://codewithhugo.com/sequelize-data-types-a-practical-guide/
*/

module.exports = (sequelize, DataTypes) => {
    let Responsavel = sequelize.define('Responsavel', {
        idResponsavel: {
            field: 'idResponsavel',
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        fkEmpresa: {
            field: 'fkEmpresa',
            type: DataTypes.INTEGER,
            foreignKey: true,
            allowNull: true,
        },
        nome: {
            field: 'nome',
            type: DataTypes.STRING,
            allowNull: true,
        },
        login: {
            field: 'loginResponsavel',
            type: DataTypes.STRING,
            allowNull: false
        },
        senha: {
            field: 'senha',
            type: DataTypes.STRING,
            allowNull: false
        },
        email: {
            field: 'email',
            type: DataTypes.STRING,
            allowNull: false,
        },
        telCelular: {
            field: 'telCelular',
            type: DataTypes.STRING,
            allowNull: true,
        },
        telFixo: {
            field: 'telFixo',
            type: DataTypes.STRING,
            allowNull: true,
        },
    },
        {
            tableName: 'tb_responsavel',
            freezeTableName: true,
            underscored: true,
            timestamps: false,
        });

    return Responsavel;
};
