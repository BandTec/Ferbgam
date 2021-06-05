let sala = sessionStorage.getItem('sala');
sala = JSON.parse(sala);
document.title = sala.nomeSala;


let qtdTemp = 0;
let qtdHumi = 0;
let qtdLumi = 0;



for (let i = 0; i < sala.sensores.length - 1; i++) {
    if (sala.sensores[i].statusSensor == 'ativo' && sala.sensores[i].tipoLeitura == 'temperatura') {
        qtdTemp++;
    }

    if (sala.sensores[i].statusSensor == 'ativo' && sala.sensores[i].tipoLeitura == 'luminosidade') {
        qtdLumi++;
    }

    if (sala.sensores[i].statusSensor == 'ativo' && sala.sensores[i].tipoLeitura == 'umidade') {
        qtdHumi++;
    }
}




console.log(qtdTemp);
console.log(qtdHumi);
console.log(qtdLumi);








let contextLuminosity = document.querySelector('#chartLuminosity').getContext('2d');

let config = {
    type: 'bar',
    data: {
        labels: [],
        datasets: [{
            label: 'Lux',
            data: [1200, 500, 750, 984, 1000, 475, 1600, 800],
            backgroundColor: [
                '#d50606',
                '#548235',
                '#548235',
                '#FF8800',
                '#d50606',
                '#FF8800',
                '#d50606',
                '#548235',
            ],
            borderWidth: 1
        }]
    },
    options: {
        legend: {
            position: "top",
            align: "start"
        },
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
};





let contextTemperature = document.querySelector('#chartTemperature').getContext('2d');



let configTemp = {
    type: 'bar',
    data: {
        labels: [],
        datasets: [{
            label: 'Cº',
            data: [],
            backgroundColor: [
                '#FF8800',
                '#FFBB33',
                '#548235',
                '#FF8800',
                '#FFFF25',
                '#FF8800',
                '#548235',
                '#d50606',
            ],
            borderWidth: 1
        }]
    },
    options: {
        legend: {
            position: "top",
            align: "start"
        },
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
};





let contextHumidity = document.querySelector('#chartHumidity').getContext('2d');



let configHumi = {
    type: 'bar',
    data: {
        labels: [],
        datasets: [{
            label: '%',
            data: [],
            backgroundColor: [
                '#FFFF25',
                '#FFBB33',
                '#d50606',
                '#d50606',
                '#FFFF25',
                '#548235',
                '#d50606',
                '#FFFF25',

            ],
            borderWidth: 1
        }]
    },
    options: {
        legend: {
            position: "top",
            align: "start"
        },
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
};

let chartTemperature;
let chartHumidity;
let chartLuminosity;


if (qtdTemp > 0) {


    chartTemperature = new Chart(contextTemperature, configTemp);

} else {
    document.getElementById('chartTemperature').classList.add('occult');
    document.getElementById('temp-block').classList.remove('occult');
}





if (qtdHumi > 0) {

    chartHumidity = new Chart(contextHumidity, configHumi);


} else {
    document.getElementById('chartHumidity').classList.add('occult');
    document.getElementById('humi-block').classList.remove('occult');
}





if (qtdLumi > 0) {

    chartLuminosity = new Chart(contextLuminosity, config);


} else {
    document.getElementById('chartLuminosity').classList.add('occult');
    document.getElementById('lumi-block').classList.remove('occult');
}

console.log(sala);
let salaArray = [sala];

setInterval(() => {

    fetch(`http://localhost:9001/api/sendData/${JSON.stringify(salaArray)}`).then(response => {
        response.json().then(data => {
            console.log(data);
            fetch(`/leituras/ultimasPorSala/${sala.idSala}/${qtdHumi + qtdLumi + qtdTemp}`).then(response => {
                if (response.ok) {
                    response.json().then(data => {
                        data.forEach(leitura => {

                            if (leitura.tipoLeitura == 'temperatura') {
                                chartTemperature.data.labels.push(leitura.valorLeitura);
                                chartTemperature.data.datasets[0].data.push(leitura.valorLeitura);
                                chartTemperature.update();
                            }

                            if (leitura.tipoLeitura == 'umidade') {
                                chartHumidity.data.labels.push(leitura.valorLeitura);
                                chartHumidity.data.datasets[0].data.push(leitura.valorLeitura);
                                chartHumidity.update();
                            }

                            if (leitura.tipoLeitura == 'luminosidade') {
                                chartLuminosity.data.labels.push(leitura.valorLeitura);
                                chartLuminosity.data.datasets[0].data.push(leitura.valorLeitura);
                                chartLuminosity.update();
                            }


                        });
                    })
                }
            })
        })
    });


}, 2000);




// let contadoraaa = 0;
// setInterval(() => {
//     let teste = parseInt(Math.random() * 100);
//     chartTemperature.data.labels.push(contadoraaa++);
//     chartTemperature.data.datasets[0].data.push(teste)
//     chartTemperature.update();
// }, 2000)