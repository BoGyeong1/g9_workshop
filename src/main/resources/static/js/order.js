window.onload = function () {
    getAddressDetail();
    getPrice();
};


// 주소 자동완성 기능
function getAddressDetail() {
    const zipCodeInput = document.getElementById("input-zipcode");
    const addressInput = document.getElementById("input-address");
    const detailInput = document.getElementById("input-detail");

    // name 속성이 address-uid인 모든 인풋 태그들을 가져옴
    const addressUids = document.getElementsByName('address-uid');

    // 선택된 라디오 버튼의 value를 가져와 저장
    let selectedAddressUid;
    for (let i = 0; i < addressUids.length; i++) {
        if (addressUids[i].checked) {
            selectedAddressUid = addressUids[i].value;
            break;
        }
    }

    // 직접 입력인 경우 체크
    if (selectedAddressUid === 'self') {
        zipCodeInput.value = '';
        addressInput.value = '';
        detailInput.value = '';
        detailInput.removeAttribute('readonly');
        return;
    }

    // 직접 입력이 아닌경우 ajax 요청
    $.ajax({
        url: '/order/address/getDetail',
        type: 'GET',
        dataType: 'json',
        data: { addressUid: selectedAddressUid },
        success: function (response) {
            const addressDetail = response; // 서버에서 반환된 데이터를 변수에 저장합니다.

            // deliveryZipCode, deliveryAddress, deliveryDetail 요소의 value를 설정합니다.
            zipCodeInput.value = addressDetail.ZIP_CODE;
            addressInput.value = addressDetail.ADDRESS;
            detailInput.value = addressDetail.DETAIL;
            detailInput.setAttribute('readonly', true);
        },
        error: function (xhr, status, error) {
            console.error(error); // 에러가 발생한 경우 에러를 출력합니다.
        }
    });
}

// 주소입력
function execDaumPostcode() {
    const addressUids = document.getElementsByName('address-uid');
    let selectedAddressUid;
    for (let i = 0; i < addressUids.length; i++) {
        if (addressUids[i].checked) {
            selectedAddressUid = addressUids[i].value;
            break;
        }
    }
    if (selectedAddressUid != 'self') {
        return;
    }

    new daum.Postcode({
        oncomplete: function (data) {
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }

            if (data.userSelectedType === 'R') {
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraAddr += data.bname;
                }
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if (extraAddr !== '') {
                    extraAddr = ' (' + extraAddr + ')';
                }
            }

            document.getElementById('input-zipcode').value = data.zonecode;
            document.getElementById("input-address").value = addr;
            document.getElementById("input-detail").focus();
        }
    }).open();
}

// 주소입력 모달용
function execDaumPostcodeModal() {
    new daum.Postcode({
        oncomplete: function (data) {
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }

            if (data.userSelectedType === 'R') {
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraAddr += data.bname;
                }
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if (extraAddr !== '') {
                    extraAddr = ' (' + extraAddr + ')';
                }
            }

            document.getElementById('input-zipcode-modal').value = data.zonecode;
            document.getElementById("input-address-modal").value = addr;
            document.getElementById("input-detail-modal").focus();
        }
    }).open();
}

// 배송장소 직접입력 노출 / 비노출
function deliveryLocationSelfCheck() {
    // name 속성이 address-uid인 모든 인풋 태그들을 가져옴
    const deliveryLocationUids = document.getElementsByName('delivery-location-uid');

    // 선택된 라디오 버튼의 value를 가져와 저장
    let selectedDeliveryLocationUid;
    for (let i = 0; i < deliveryLocationUids.length; i++) {
        if (deliveryLocationUids[i].checked) {
            selectedDeliveryLocationUid = deliveryLocationUids[i].value;
            break;
        }
    }

    // self 가 아니라면 값을 초기화한 후 숨기며 종료
    if (selectedDeliveryLocationUid != 'self') {
        document.getElementById("delivery-location-self").value = "";
        document.getElementById("delivery-location-self").style.display = "none";
        return;
    } else {
        document.getElementById("delivery-location-self").style.display = "block";
    }
}

function getPrice() {
    const productPrice = document.getElementById("printProductPrice");
    const deliveryPrice = document.getElementById("printDeliveryPrice");
    const totalPrice = document.getElementById("printTotalPrice");

    $.ajax({
        url: '/order/getPrice',
        type: 'GET',
        dataType: 'json',
        success: function (response) {
            const priceInfo = response;

            productPrice.innerHTML = parseInt(priceInfo.productPrice).toLocaleString();
            deliveryPrice.innerHTML = parseInt(priceInfo.deliveryPrice).toLocaleString();
            totalPrice.innerHTML = parseInt(priceInfo.totalPrice).toLocaleString();
        },
        error: function (xhr, status, error) {
            console.error(error);
        }
    });

}

document.getElementById("point-use").addEventListener("change", function () {
    var pointUse = document.getElementById("point-use").value;
    var pointBalance = parseInt(document.getElementById("pointBalance").innerHTML);
    var printTotalPrice = document.getElementById("printTotalPrice");

    // 입력값이 숫자가 아닐 경우
    if (isNaN(pointUse)) {
        alert("숫자만 입력해주세요.");
        document.getElementById("point-use").value = 0;
        return;
    }

    // 보유 포인트보다 사용 포인트가 클 경우
    if (pointUse > pointBalance) {
        alert("보유한 포인트만큼만 사용이 가능합니다.");
        document.getElementById("point-use").value = 0;
        return;
    }

    // 총 가격 출력
    var totalPrice = parseInt(printTotalPrice.innerHTML) - parseInt(pointUse);
    printTotalPrice.innerHTML = totalPrice;
});