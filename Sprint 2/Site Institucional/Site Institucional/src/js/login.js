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
