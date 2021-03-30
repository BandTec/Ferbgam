window.onscroll = function () { scrollFunction() };

function scrollFunction() {
    if (document.body.scrollTop > 80 || document.documentElement.scrollTop > 80) {
        document.getElementById("id-navbar").style.backgroundColor = "#000";
    }
    else {
        document.getElementById("id-navbar").style.backgroundColor = "#0003";
    }
}