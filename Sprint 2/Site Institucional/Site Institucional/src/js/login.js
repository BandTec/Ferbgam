// essa forma de pegar os elementos é mais precisa, mas funciona da mesma forma que
// aprendemos com o Frizza

let sign_in_btn = document.querySelector('#sign-in-btn');
let sign_up_btn = document.querySelector('#sign-up-btn');
let container = document.querySelector('.container');


console.log(container)
sign_up_btn.addEventListener('click', function () {
    container.classList.add('sign-up-mode')
});

sign_in_btn.addEventListener('click', function () {
    container.classList.remove('sign-up-mode');
})


let equalPass = document.querySelector('#equal-pass')
let minChar = document.querySelector('#minChar');
let upperCase = document.querySelector('#upperCase');
let numericChar = document.querySelector('#numericChar');
let isEqual = false;
let hasMin = false;
let hasUpper = false;
let hasNumber = false;
let validEmail = false;

//Validação da senha no cadastro
function checkPassword() {
    let password = document.querySelector('#cadastroPassword');
    let passToValidate = document.querySelector('#confirmacaoPassword');
    password = password.value;
    passToValidate = passToValidate.value;

    if (password != '' && password != '') {
        if (password == passToValidate) {
            equalPass.classList.replace('far', 'fas');
            equalPass.classList.add('checked');
            isEqual = true;
        } else {
            equalPass.classList.replace('fas', 'far');
            equalPass.classList.remove('checked');
            isEqual = false;
        }


    } else {
        if (equalPass.classList.contains('checked')) {
            equalPass.classList.replace('fas', 'far');
            equalPass.classList.remove('checked');
            isEqual = false;
        }
    }




    if (isEqual || !isEqual) {
        if (password.length > 3) {
            minChar.classList.replace('far', 'fas');
            minChar.classList.add('checked');
            hasMin = true;
        } else {
            minChar.classList.replace('fas', 'far');
            minChar.classList.remove('checked');
            hasMin = false;
        }

        if (password.toString().search(/[A-Z]/g) != -1) {
            upperCase.classList.replace('far', 'fas');
            upperCase.classList.add('checked');
            hasUpper = true;
        } else {
            upperCase.classList.replace('fas', 'far');
            upperCase.classList.remove('checked');
            hasUpper = false;
        }

        if (password.toString().search(/[0-9]/g) != -1) {
            numericChar.classList.replace('far', 'fas');
            numericChar.classList.add('checked');
            hasNumber = true;
        } else {
            numericChar.classList.replace('fas', 'far');
            numericChar.classList.remove('checked');
            hasNumber = false;
        }




    } else {
        if (minChar.classList.contains('checked')) {
            minChar.classList.replace('fas', 'far');
            minChar.classList.remove('checked');
            hasMin = false;
        }

        if (upperCase.classList.contains('checked')) {
            upperCase.classList.replace('fas', 'far');
            upperCase.classList.remove('checked');
            hasUpper = false;
        }


        if (numericChar.classList.contains('checked')) {
            numericChar.classList.replace('fas', 'far');
            numericChar.classList.remove('checked');
            hasNumber = false;
        }
    }
}

function validateEmail(email) {
    let re = /^[^\s@]+@[^\s@]+$/
    return re.test(email)
}


function checkEmail() {
    let emailCadastro = document.querySelector('#emailCadastro');
    emailCadastro = emailCadastro.value;

    validEmail = validateEmail(emailCadastro);
    if (!validEmail) {
        document.querySelector('#error-message-email').classList.add('visible');

        setTimeout(() => {
            document.querySelector('#error-message-email').classList.remove('visible')
        }, 2500);
    }

}


function cadastrar() {
    checkEmail();
    if ((hasMin && hasNumber && hasUpper) && validEmail) {
        alert('Usuário Cadastrado com Sucesso');
    }
}

