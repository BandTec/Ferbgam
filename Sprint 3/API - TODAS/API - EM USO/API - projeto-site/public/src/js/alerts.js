function generateAlert(context, type, text) {
    var alert = document.createElement('div');
    var textAlert = document.createElement('p');
    var closeAlert = document.createElement('div');
    var iconCloseAlert = document.createElement('i');

    alert.className = 'alert';
    alert.id = 'cadastroAlert';

    closeAlert.className = 'close-btn';

    iconCloseAlert.className = 'fas fa-times';

    textAlert.innerHTML = text;

    closeAlert.appendChild(iconCloseAlert);
    alert.appendChild(textAlert);
    alert.appendChild(closeAlert);

    if (type == 'warning') {
        alert.style.backgroundColor = 'var(--cancel-color)';
        alert.style.border = ''
        // border-left: 10px solid #3CB371;
    }
    else {
        alert.style.backgroundColor = 'var(--confirm-color)';
    }

    context.appendChild(alert);

    alert.classList.add('visible');


    setTimeout(() => {
        alert.classList.remove('visible');

    }, 3000);

}