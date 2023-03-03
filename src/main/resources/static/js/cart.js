document.addEventListener('DOMContentLoaded', function () {
    let price = 0;
    let deliveryPrice = 3000;
    document.querySelectorAll('input[name="price"]').forEach(function (input) {
        price += parseInt(input.value);
    });
    let totalPrice = document.getElementById('totalPrice');
    totalPrice.innerHTML = price.toLocaleString() + "원";

    let deliveryCharge = document.getElementById('deliveryCharge');
    let pay = document.getElementById('pay');
    if (price >= 50000) {
        deliveryCharge.innerHTML = "무료 ="
        pay.innerHTML = price.toLocaleString() + "원";
    } else {
        deliveryCharge.innerHTML = deliveryPrice.toLocaleString() + "원 =";
        pay.innerHTML = (price + deliveryPrice).toLocaleString() + "원";
    }

});