<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/css/admin/memberlist.css">
    <title>지구공방 - Admin</title>

</head>

<body>
    <%@ include file="/WEB-INF/view/admin/common/adminheader.jsp" %>
    <div class="d-flex">
        <%@ include file="/WEB-INF/view/admin/common/adminnav.jsp" %>
        <div class="w-100 m-5">

            <div class="fs-4">상세주문내역</div>

                <table class="mt-2 mb-5 table table-bordered">
                <thead>
                <tr>
                <th class="text-center table-light">ORDER_DETAIL_UID</th>
                <th class="text-center table-light">USER_UID</th>
                <th class="text-center table-light">상품명</th>
                <th class="text-center table-light">가격</th>
                <th class="text-center table-light">수량</th>
                <th class="text-center table-light">주문날짜</th>
                <th class="text-center table-light">주문상태</th>
                <th class="text-center table-light">결제수단</th>
                <th class="text-center table-light">택배정보</th>
                </tr>
                </thead>
                <tbody id="orderListTable">
                <c:forEach items="${resultMap}" var="resultData" varStatus="loop">
                <tr>
                <td class="text-center">${resultData.ORDER_DETAIL_UID}</td>
                <td class="text-center">${resultData.USER_UID}</td>
                <td class="text-center">${resultData.PRODUCT_NAME}</td>
                <td class="text-center">${resultData.PRICE}</td>
                <td class="text-center">${resultData.QUANTITY}</td>
                <td class="text-center">${resultData.ORDER_DATE}</td>
                <td class="text-center">${resultData.CONDITION_NAME}</td>
                <td class="text-center">${resultData.PAYMENT_METHOD}</td>
                <td class="text-center">
                <div>${resultData.LOGISTICS_NAME}</div>
                <div>${resultData.WAYBILL_CODE}</div>
                </td>
                </tr>
                </c:forEach>
                </tbody>
                </table>
           

            <div class="fs-4">배송지 정보</div>

                <table class="mt-2 mb-5 table table-bordered">
                <thead>
                <tr>
                <th class="text-center table-light">수령인 이름</th>
                <th class="text-center table-light">수령인 전화번호</th>
                <th class="text-center table-light">배송지 이름</th>
                <th class="text-center table-light">우편번호</th>
                <th class="text-center table-light">주소</th>
                <th class="text-center table-light">상세주소</th>
                </tr>
                </thead>
                <tbody id="orderListTable">
                <tr>
                <td class="text-center">${address.RECIPIENT_NAME}</td>
                <td class="text-center">${address.RECIPIENT_TEL}</td>
                <td class="text-center">${address.ADDRESS_NAME}</td>
                <td class="text-center">${address.ZIP_CODE}</td>
                <td class="text-center">${address.ADDRESS}</td>
                <td class="text-center">${address.DETAIL}</td>
                </tr>
                </tbody>
                </table>
            
           
        </div>
    </div>






    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>
</body>

</html>