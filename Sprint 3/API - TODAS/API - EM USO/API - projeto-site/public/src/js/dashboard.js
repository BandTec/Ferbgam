var username = sessionStorage.nome_usuario_meuapp;
var user_login = sessionStorage.login_usuario_meuapp;

function loadContent() {
    console.log('Carregando conteudo');
    check_authenticate();
    
}


function check_authenticate() {
    if (user_login == undefined) {
        redirect_login();
    } else {
        validate_session();
    }

}

function log_out() {
    finalize_session();
    sessionStorage.clear();
    redirect_login();
}

function validate_session() {
    fetch(`/empresas/sessao/${user_login}`, { cache: 'no-store' })
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

function finalize_session() {
    fetch(`/empresas/sair/${user_login}`, { cache: 'no-store' });
}

function redirect_login() {
    window.location.href = 'login.html';
}