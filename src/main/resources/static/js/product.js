function count(type) {
    const resultElement = document.getElementById('cnt');
    let number = resultElement.value;
    if (type === 'plus') {
        number = parseInt(number) + 1;
    } else if (type === 'minus') {
        if (number > 1) {
            number = parseInt(number) - 1;
        }
    }
    resultElement.value = number;
    updateTotal();
}

function updateTotal() {
    const cnt = document.getElementById("cnt").value;
    const price = document.getElementById("price").value;
    const discount_rate = document.getElementById("discount_rate").value;
    const total_price = cnt * price * (100 - discount_rate) / 100;
    document.getElementById("total_price").innerHTML = "총 상품 금액 " + total_price.toLocaleString() + "원";
}

window.onload = function () {
    updateTotal();
};