<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="./css/style.css">
    <title>g9 - OrderList </title>

     <%-- header --%>
    <%@ include file="/WEB-INF/view/user/common/header.jsp" %>

<body>
    <!-- main  -->
    <main>
        <div class="container p-5" style="height: 1200px;">
            <div class="text-center display-6 fw-bold mb-5">주문서</div>
            <table class="table">
                <thead>
                    <tr class="text-center">
                        <th scope="col" colspan="2">상품정보</th>
                        <!-- <th scope="col">상품정보</th> -->
                        <th scope="col">수량</th>
                        <th scope="col">상품금액</th>
                        <th scope="col">적립금 할인</th>
                        <th scope="col">배송비</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <!-- 상품이미지 -->
                        <td style=" width: 16px; ">
                            <img src="/docs/img/item/item5.png" alt="상품5" width="200px">
                        </td>
                        <!-- 상품명 & 옵션 -->
                        <td class="align-middle">
                            <!-- 상품명 -->
                            <div class="">
                                친환경 물통
                            </div>
                            <!-- 옵션 -->
                            <div class="text-secondary ">
                                우드 / M / 친환경
                            </div>

                            <!-- 도착예정 -->
                            <div style="font-size: 0.5rem;" class="text-success fw-bold">
                                지금 결제 시 <strong>2/11(목)</strong> 도착예정
                            </div>
        </div>
        </td>
        <!-- 수량 -->
        <td class="align-middle text-center">
            <div>
                1
            </div>
        </td>

        <!-- 상품금액 & 적립금할인  -->
        <td class="align-middle text-center">20,000원</td>
        <td class="align-middle text-center">0원</td>

        <!-- 구매 & 삭제 버튼 -->
        <td class="align-middle text-center">
            <div>3,000원</div>
        </td>
        </tr>
        </tbody>
        </table>



        <!-- 혜택 (적립금)  -->
        <table class="table">
            <thead>
                <th scope="col" colspan="4">
                    적립금
                </th>

            </thead>

            <tbody>
                <tr>
                    <td class="text-left">
                        보유 적립금 <span class="text-success fw-bold"> 1,000원 </span>
                        <button class="btn btn-dark btn-sm">적용</button>
                    </td>

                </tr>

            </tbody>
        </table>
        <!-- 배송정보 -->
        <table class="table">
            <thead>
                <tr>

                    <th scope="col" colspan="4">배송정보

                        <button class="btn btn-outline-dark btn-sm">배송정보 불러오기</button>
                    </th>
                </tr>
            </thead>
            <tbody>

                <tr>
                    <td scope="row">받는 분</td>
                    <td colspan="3"><input type="text" class="form-control w-25" name="" id=""></td>
                </tr>
                <tr>
                    <td scope="row">연락처</td>
                    <td colspan="3">
                        <form name="frm" method="post" action="?">
                            <input type="text" name="phone" class="phone form-control w-25" maxlength="13"
                                placeholder="핸드폰번호" style="display:inline-block">
                        </form>

                        </div>
                    </td>
                </tr>
                <tr>
                    <td scope="row">주소</td>
                    <td colspan="3">
                        <div class="mb-3">
                            <input type="text" class="form-control w-50 " id="address" placeholder="서울특별시 강남구 삼성동 158"
                                style="display:inline-block" required>
                            <label for="address"></label>
                            <button class="btn btn-outline-dark btn-sm">🔍</button>
                        </div>

                        <div class="mb-3">
                            <label for="address2">상세주소<span class="text-muted">&nbsp;(필수 아님)</span></label>
                            <input type="text" class="form-control" id="address2" placeholder="상세주소를 입력해주세요.">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td scope="row">배송장소</td>
                    <td colspan="3">
                        <div class="dropdown">
                            <button class="btn btn-outline-dark dropdown-toggle" type="button" data-bs-toggle="dropdown"
                                aria-expanded="false">
                                배송 장소 선택
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">문 앞에 두고 가주세요</a></li>
                                <li><a class="dropdown-item" href="#">직접 수령할게요 </a></li>
                                <li><input type="text" class="form-control" name="" id="" placeholder="직접입력"></li>
                            </ul>
                        </div>
                    </td>
                </tr>

            </tbody>
        </table>

        <!-- 결제수단 -->
        <table class="table">
            <thead>
                <th scope="col" colspan="4">
                    결제수단
                </th>

            </thead>

            <tbody>
                <tr>
                    <td class="text-center">
                        <div class="dropdown">
                            <button class="btn btn-outline-dark dropdown-toggle  w-75" type="button"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                결제수단 선택
                            </button>
                            <ul class="dropdown-menu w-75 text-center">
                                <li><a class="dropdown-item" href="#">신용카드</a></li>
                                <li><a class="dropdown-item" href="#">계좌이체</a></li>
                                <li><a class="dropdown-item" href="#">무통장입금</a></li>
                            </ul>
                        </div>
                    </td>

                </tr>
            </tbody>
        </table>


        <!-- 결제 약관 -->
        <div class="text-center">
            구매조건을 확인하였으며, 개인정보 수집 및 이용과 제 3자 제공에 동의합니다.




            <button class="btn btn-dark" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample"
                aria-expanded="false" aria-controls="collapseExample">
                보기
            </button>
            </p>
            <div class="collapse" id="collapseExample">
                <div class="card card-body">
                    <p>주문동의
                    </p>
                    <p>주문할 상품의 상품명, 가격, 배송정보 등 판매조건을 확인하였으며, 구매진행에 동의합니다. (전자상거래법 제8조 2항) </p>

                    <p>개인정보 수집 및 이용 동의</p>
                    <p>수집목적</p>
                    <p>구매한 물품의 배송/설치 등 고객과 체결한 계약의 이행</p>
                    <p>수집항목</p>
                    <p>- 배송정보 (주문자 및 수취인 이름, 주소, 연락처)</p>
                    <p>- 결제정보 (신용카드, 계좌, 휴대폰 정보)</p>
                    <p>보유기간 : 수집 목적 달성 시 까지</p>
                    <p>- 단, 관계 법령의 규정에 의하여 일정 기간 보유하여야할 필요가 있는 경우, 해당 기간동안 보관합니다.</p>
                    <p>- 법령에 따라 보관하여야 하는 기간은 홈페이지 하단의 ‘개인정보처리방침’을 참고하시기 바랍니다.</p>
                    <p>- 개인정보 수집 및 이용 동의를 거부하실 권리가 있으며, 이를 거부 시 결제가 제한됩니다.</p>
                    <p>개인정보 제3자 제공동의</p>
                    <p>- 제공받는 자 : (주) 지구공방 / Dav - Team </p>
                    <p>- 목적 : 주문처리/배송, 고객상담 및 불만처리</p>
                    <p>- 제공항목 : 받는 분, 주소, 연락처</p>
                    <p>- 보유 및 이용기간 : 이용목적 달성 시까지</p>
                    <p>- 개인정보 제 3자 제공 동의를 거부하실 권리가 있으며, 거부 시 결제가 제한됩니다.</p>
                </div>
            </div>

            <!-- 주문 & 쇼핑 버튼  -->
            <div class="d-flex justify-content-center m-3">
                <form action="">
                    <button class="btn btn-lg btn-success">총 1개 주문하기</button>
                </form>
            </div>

        </div>


    </main>

  <%-- Footer Include --%>
    <%@ include file="/WEB-INF/view/user/common/footer.jsp" %>


    <!-- 휴대폰번호 하이푼 자동생성  -->
    <script>
        $('.phone').keydown(function (event) {
            var key = event.charCode || event.keyCode || 0;
            $text = $(this);
            if (key !== 8 && key !== 9) {
                if ($text.val().length === 3) {
                    $text.val($text.val() + '-');
                }
                if ($text.val().length === 8) {
                    $text.val($text.val() + '-');
                }
            }

            return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>

</html>