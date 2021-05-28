
// FUNÇÃO QUE VERIFICA O TIPO DE LOGIN
function login() {
    var radioBtn = document.getElementById('radio_empresa');
    let form = new URLSearchParams(new FormData(form_login));

    if (radioBtn.checked) {
        loginEmpresa(form);
    }
    else {
        loginResponsavel(form);
    }
}


// FUNÇÃO QUE FAZ A REQUISIÇÃO DE LOGIN COMO EMPRESA
function loginEmpresa(form) {
    fetch("/empresas/autenticarEmpresa", {
        method: "POST",
        body: form
    }).then(response => {

        if (response.ok) {

            response.json().then(json => {
                sessionStorage.id_usuario_meuapp = json.idEmpresa;
                sessionStorage.nome_usuario_meuapp = json.nomeEmpresa;
                sessionStorage.login_usuario_meuapp = json.loginEmpresa;

                window.location.href = 'dashboard.html';
            });

        } else {
            console.log('Erro de login!');
            response.text().then(error_desc => {
                console.error(error_desc);
            });
        }
    });

    return false;
}

// FUNÇÃO QUE FAZ A REQUISIÇÃO DE LOGIN COMO RESPONSÁVEL
function loginResponsavel(form) {
    fetch("/responsaveis/autenticarResponsavel", {
        method: "POST",
        body: form
    }).then(response => {

        if (response.ok) {

            response.json().then(json => {
                console.log(response);
                window.location.href = 'dashboard.html';
            });

        } else {
            console.log('Erro de login!');
            response.text().then(error_desc => {
                console.error(error_desc);
            });
        }
    });

    return false;
}



