let user = sessionStorage.getItem('user');
user = JSON.parse(user);



function loadContent() {
    console.log('Carregando conteudo');
    check_authenticate();

}


function check_authenticate() {
    if (user == undefined) {
        redirect_login();
    } else {
        validate_session();
    }

}



function validate_session() {
    fetch(`/empresas/sessao/${user.loginEmpresa}`, { cache: 'no-store' })
        .then(resposta => {
            if (resposta.ok) {
                resposta.text().then(texto => {
                    console.log('Sessão :) ', texto);
                });
            } else {
                console.error('Sessão :.( ');
                log_out();
            }
        });
}

function log_out() {
    finalize_session();
    sessionStorage.clear();
    redirect_login();
}

function finalize_session() {
    fetch(`/empresas/sair/${user.loginEmpresa}`, { cache: 'no-store' });
}

function redirect_login() {
    window.location.href = 'login.html';
}




listSensors = (data) => {
    let vectorIcons = ''
    let counterLumi = [0, 0, 0];
    let counterUmi = [0, 0, 0];
    let counterTemp = [0, 0, 0];

    data.sensores.forEach((sensor, index, array) => {


        if (sensor.tipoLeitura == 'temperatura' && sensor.statusSensor == 'ativo') {
            counterTemp[0]++
        } else if (sensor.tipoLeitura == 'temperatura' && sensor.statusSensor == 'inativo') {
            counterTemp[1]++
        } else if (sensor.tipoLeitura == 'temperatura' && sensor.statusSensor == 'manutenção') {
            counterTemp[2]++
        }

        if (sensor.tipoLeitura == 'luminosidade' && sensor.statusSensor == 'ativo') {
            counterLumi[0]++
        } else if (sensor.tipoLeitura == 'luminosidade' && sensor.statusSensor == 'inativo') {
            counterLumi[1]++
        } else if (sensor.tipoLeitura == 'luminosidade' && sensor.statusSensor == 'manutenção') {
            counterLumi[2]++
        }

        if (sensor.tipoLeitura == 'umidade' && sensor.statusSensor == 'ativo') {
            counterUmi[0]++
        } else if (sensor.tipoLeitura == 'umidade' && sensor.statusSensor == 'inativo') {
            counterUmi[1]++
        } else if (sensor.tipoLeitura == 'umidade' && sensor.statusSensor == 'manutenção') {
            counterUmi[2]++
        }



        // for (let i = 0; i < counterLumi.length; i++) {
        //     if (i == 0) {
        //         if (counterLumi[i] > 0) {
        //             vectorIcons += `<i class='far fa-lightbulb luminosidade active'><sub>${counterLumi[i]}</sub></i>`
        //         }
        //     } else if (i == 1) {
        //         if (counterLumi[i] > 0) {
        //             vectorIcons += `<i class='far fa-lightbulb luminosidade inactive'><sub>${counterLumi[i]}</sub></i>`
        //         }
        //     } else if (i == 2) {
        //         if (counterLumi[i] > 0) {
        //             vectorIcons += `<i class='far fa-lightbulb luminosidade attention'><sub>${counterLumi[i]}</sub></i>`
        //         }
        //     }
        // }

    });
    console.log(counterTemp);

    let orderIcons = () => {
        for (let i = 0; i < counterLumi.length; i++) {
            if (counterLumi[i] > 0 && i == 0) {
                vectorIcons += `<i class='far fa-lightbulb luminosidade active'><sub>${counterLumi[i]}</sub></i>`
            }
            if (counterLumi[i] > 0 && i == 1) {
                vectorIcons += `<i class='far fa-lightbulb luminosidade inactive'><sub>${counterLumi[i]}</sub></i>`
            }
            if (counterLumi[i] > 0 && i == 2) {
                vectorIcons += `<i class='far fa-lightbulb luminosidade attention'><sub>${counterLumi[i]}</sub></i>`
            }
        }


        for (let i = 0; i < counterTemp.length; i++) {
            if (counterTemp[i] > 0 && i == 0) {
                vectorIcons += `<i class='fas fa-thermometer-empty temperatura active'><sub>${counterTemp[i]}</sub></i>`
            }
            if (counterTemp[i] > 0 && i == 1) {
                vectorIcons += `<i class='fas fa-thermometer-empty temperatura inactive'><sub>${counterTemp[i]}</sub></i>`
            }
            if (counterTemp[i] > 0 && i == 2) {
                vectorIcons += `<i class='fas fa-thermometer-empty temperatura attention'><sub>${counterTemp[i]}</sub></i>`
            }
        }



        for (let i = 0; i < counterUmi.length; i++) {
            if (counterUmi[i] > 0 && i == 0) {
                vectorIcons += `<i class='fas fa-tint umidade active'><sub>${counterUmi[i]}</sub></i>`
            }
            if (counterUmi[i] > 0 && i == 1) {
                vectorIcons += `<i class='fas fa-tint umidade inactive'><sub>${counterUmi[i]}</sub></i>`
            }
            if (counterUmi[i] > 0 && i == 2) {
                vectorIcons += `<i class='fas fa-tint umidade attention'><sub>${counterUmi[i]}</sub></i>`
            }
        }
    }

    orderIcons();

    return vectorIcons

}




listarSalas = () => {

    let containerSalas = document.querySelector('.rooms-container');

    fetch(`/salas/${user.idEmpresa}`, {
        method: 'GET'
    }).then((response) => {
        response.json().then(data => {


            data.forEach(sala => {
                containerSalas.innerHTML += `
                <div id=${sala.idSala} class="boxes-item">
                    <h3>${sala.nomeSala}</h3>
                    <div class="box-text">
                        <p>${sala.descricao}</p>
                        <h4>Sensores: 
                        ${listSensors(sala)}
                        </h4>
                        <h4>Status: <i class='fas fa-circle ideal'></i> </h4>
                    </div>
                </div>`;

                console.log(sala);

            });

            // var http = new XMLHttpRequest();
            fetch('http://localhost:9001/api/sendData/a').then(response => {
                if (response.ok) {
                    response.json().then(data => {
                        console.log(data);
                    })
                }
            });
            // http.send(null);


        })
    });





}





listarSalas();



