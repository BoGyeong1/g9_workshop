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
        <div class="container p-5" style="height: 650px;">
            <div class="text-center display-6 fw-bold mb-5">주문완료</div>
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


        <!-- 총 결제금액 -->
        <div class="text-end">
            <span class="text-success fw-bold fs-3">총 결제금액 23,000원 </span>

        </div>

        <hr>
        <div class="text-center">
            <span class="text-success fw-bold fs-3">
                <div> 2/11 (목) 도착예정 </div>
                <div> 정상적으로 주문이 완료되었습니다. </div>
                <div> 주문해주셔서 감사합니다! </div>

            </span>
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