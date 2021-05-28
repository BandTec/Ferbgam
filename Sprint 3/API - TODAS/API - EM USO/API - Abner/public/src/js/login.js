function login_user() {
    let form = new URLSearchParams(new FormData(form_login));
    fetch("/responsaveis/autenticar", {
        method: "POST",
        body: form
    }).then(response => {

        if (response.ok) {

            response.json().then(json => {
                // window.location.href = 'dashboard.html';
                console.log(response);
            });

        } else {

            console.log('Erro de login!');

            response.text().then(error_desc => {
                console.error(error_desc);
                finalize_load(error_desc);
            });
        }
    });

    return false;
}





