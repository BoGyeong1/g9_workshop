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
<div class="container">
  <div class="row">
  <c:set var="formAction" value="${empty waybills['WAYBILL_CODE'] ? 'Insert' : 'Update'}" />
    <div class="col-md-6 col-md-offset-3">
      <h2 class="text-center">운송장 등록</h2>
      <form action="/admin/order/waybillCode${formAction}" id="waybillForm" method="POST">
        
        <div class="form-group m-4">
        
        <input type="hidden" name="ORDER_DETAIL_UID" value="${waybills.ORDER_DETAIL_UID}">
          
          <label for="waybillType">택배사</label>
            <select class="form-control" id="logistics" name="LOGISTICS_UID">
                <c:forEach var="logistics" items="${logistics}">
                    <option value="${logistics.LOGISTICS_UID}" ${waybills.LOGISTICS_UID == logistics.LOGISTICS_UID ? 'selected' : ''}>${logistics.LOGISTICS_NAME}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group m-4">
          <label for="waybillCode">운송장 번호</label>
          <input type="text" class="form-control" id="waybillCode" name="WAYBILL_CODE" value="${waybills.WAYBILL_CODE}" >
        </div>
        <div class="form-group m-4">
          <label for="orderConditions">배송 진행 상태</label>
            <select class="form-control" id="orderConditions" name="ORDER_CONDITION_UID">
                <c:forEach var="orderConditions" items="${orderConditions}">
                    <option value="${orderConditions.ORDER_CONDITION_UID}" ${waybills.ORDER_CONDITION_UID == orderConditions.ORDER_CONDITION_UID ? 'selected' : ''}>${orderConditions.CONDITION_NAME}</option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group m-4">
          <label for="orderConditions">배송 / 반송</label>
            <select class="form-control" id="waybillType" name="WAYBILL_TYPE_UID">
                <c:forEach var="waybillType" items="${waybillType}">
                    <option value="${waybillType.WAYBILL_TYPE_UID}" ${waybills.WAYBILL_TYPE_UID == waybillType.WAYBILL_TYPE_UID ? 'selected' : ''}>${waybillType.WAYBILL_TYPE}</option>
                </c:forEach>
            </select>
        </div>
        <div class="d-flex justify-content-center m-5">
        <button type="submit" class="btn btn-dark" id="submitWaybill">등록</button>
        </div>
      </form>
    </div>
  </div>
</div>
            
            

        </div>
    </div>






    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>
</body>

</html>