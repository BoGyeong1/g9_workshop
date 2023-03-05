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
        <div class="fs-4">배송내역</div>   


        <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="condition" id="condition-all" value="all" checked>
        <label class="form-check-label" for="condition-all">전체</label>
        </div>
        <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="condition" id="condition-preparing" value="상품준비중">
        <label class="form-check-label" for="condition-preparing">배송준비중</label>
        </div>
        <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="condition" id="condition-shipping" value="배송중">
        <label class="form-check-label" for="condition-shipping">배송중</label>
        </div>
        <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="condition" id="condition-completed" value="배송완료">
        <label class="form-check-label" for="condition-completed">배송완료</label>
        </div>

               

                <table class="mt-2 mb-5 table table-bordered">
                <thead>
                <tr>
                <th class="text-center table-light">ORDER_UID</th>
                <th class="text-center table-light">USER_UID</th>
                <th class="text-center table-light">상품명</th>
                <th class="text-center table-light">수량</th>
                <th class="text-center table-light">총가격</th>
                <th class="text-center table-light">주문날짜</th>
                <th class="text-center table-light">주문상태</th>
                <th class="text-center table-light">배송/반송</th>
                <th class="text-center table-light">택배사</th>
                <th class="text-center table-light">운송장번호</th>
                <th class="text-center table-light">운송장등록</th>
                </tr>
                </thead>
                <tbody id="memberListTable">
                <c:forEach items="${resultMap}" var="resultData" varStatus="loop">
                <tr>
                <td class="text-center">${resultData.ORDER_UID}</td>
                <td class="text-center">${resultData.USER_UID}</td>
                <td class="text-center">${resultData.PRODUCT_NAME}</td>
                <td class="text-center">${resultData.QUANTITY}</td>
                <td class="text-center">${resultData.TOTAL_PRICE}</td>
                <td class="text-center">${resultData.ORDER_DATE}</td>
                <td class="text-center">${resultData.CONDITION_NAME}</td>
                <td class="text-center">${resultData.WAYBILL_TYPE}</td>
                <td class="text-center">${resultData.LOGISTICS_NAME}</td>
                <td class="text-center">${resultData.WAYBILL_CODE}</td>
                <td class="text-center">
                <a href="/admin/order/waybillCode/${resultData.ORDER_DETAIL_UID}" class="btn btn-primary" id="waybillBtn">운송장 등록</a>
            
                </td>
                </tr>
                </c:forEach>
                </tbody>
                </table>
           
    
    </div>

    </div>

<script>
$(document).ready(function() {
  // 라디오 버튼 값이 변경되면 이벤트 리스너가 실행
  $('input[type=radio][name=condition]').change(function() {
    // 선택된 라디오 버튼의 값을 확인
    var selectedValue = $("input[type=radio][name=condition]:checked").val();
    // 전체를 선택한 경우에는 Ajax 요청을 보내지 않음
    if (selectedValue == 'all') {
          window.location.href = "/admin/order/shppingList";
      return;
    }
    // 선택된 값을 Ajax 요청으로 서버로 전송.
    $.ajax({
  type: "POST",
  url: "/admin/order/shppingList/condition",
  data: {condition: selectedValue},
  dataType: 'json',
  success: function(response) {
    var tableHtml = '';
    $.each(response, function(index, resultData) {
      tableHtml += '<tr>';
      tableHtml += '<td class="text-center">' + resultData.ORDER_UID + '</td>';
      tableHtml += '<td class="text-center">' + resultData.USER_UID + '</td>';
      tableHtml += '<td class="text-center">' + resultData.PRODUCT_NAME + '</td>';
      tableHtml += '<td class="text-center">' + resultData.QUANTITY + '</td>';
      tableHtml += '<td class="text-center">' + resultData.TOTAL_PRICE + '</td>';
      tableHtml += '<td class="text-center">' + resultData.ORDER_DATE + '</td>';
      tableHtml += '<td class="text-center">' + resultData.CONDITION_NAME + '</td>';
      tableHtml += '<td class="text-center">' + resultData.WAYBILL_TYPE + '</td>';
      tableHtml += '<td class="text-center">' + resultData.LOGISTICS_NAME + '</td>';
      tableHtml += '<td class="text-center">' + resultData.WAYBILL_CODE + '</td>';
      tableHtml += '</tr>';
    });
    $('#memberListTable').html(tableHtml);
  },
  error: function(xhr, status, error) {
    // 에러 처리
  }
});
  });
});

</script>




    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>
</body>

</html>