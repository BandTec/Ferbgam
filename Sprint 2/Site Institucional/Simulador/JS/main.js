function calculate() {
    var name = in_name.value;
    var employ = Number(in_employ.value);
    var payment = Number(in_payment.value);
    var meters = Number(in_meters.value);
    var pack = Number(se_pack.value);
    var pack_percent = pack / 100;
    var eco = (employ * payment) * pack_percent;
    var price_meters = (meters * 100) * pack_percent;

    div_javascript.style.display = 'block';
    result_name.innerHTML = `${name}`;
    result_eco.innerHTML = `${eco}`;
    result_price.innerHTML = `${price_meters}`;
    result_porcent.innerHTML = `${pack}`
}