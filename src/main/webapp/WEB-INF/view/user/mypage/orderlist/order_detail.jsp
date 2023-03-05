<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>지구공방 - 마이페이지</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
      integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/css/mypage/orderlist/order_detail.css" />
  </head>
  <body>
   <%-- [GYEONG] 230215 header --%>
    <%@ include file="/WEB-INF/view/user/common/header.jsp" %>
    
    <main>
      <div class="container">
        <!-- 마이페이지 상단메뉴 -->
         <%@ include file="/WEB-INF/view/user/mypage/mypage_nav/mypage_top_nav.jsp" %>
        
        <!-- 마이페이지 왼쪽메뉴 -->
        <%@ include file="/WEB-INF/view/user/mypage/mypage_nav/mypage_left_nav.jsp" %>

        <!-- 마이페이지 본문 -->
        <div class="content">
          <%-- 주문 상세내역 --%>
<%
// resultMap에서 orderDetails 정보 추출
List<Map<String, Object>> orderDetails = (List<Map<String, Object>>)request.getAttribute("resultMap");

// 총 결제금액 계산
int totalAmount = 0;
for(Map<String, Object> orderDetail : orderDetails) {
    int price = (Integer)orderDetail.get("PRICE");
    int quantity = (Integer)orderDetail.get("QUANTITY");
    int discountRate = (Integer)orderDetail.get("DISCOUNT_RATE");
    int discountedPrice = price - (price * discountRate / 100); // 할인율 반영된 상품가격
    totalAmount += (discountedPrice * quantity);
}

int shippingFee = 2500;
int totalPrice = totalAmount + shippingFee;
%>
          <div class="title fs-3">주문 / 배송 내역</div>
          <hr class="hr" />

          <div>
<table class="table text-center">
  <thead>
    <tr class="border-bottom border-3 border-dark">
      <th>주문날짜/번호</th>
      <th>상품정보</th>
      <th>판매가 (할인율)</th>
      <th>수량</th>
      <th>주문상태</th>
      <th>택배정보</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="item" items="${resultMap}">
      <tr>
        <td>
          <fmt:formatDate value="${item.ORDER_DATE}" pattern="yyyyMMdd" /> / ${item.ORDER_DETAIL_UID}
        </td>
        <td>${item.PRODUCT_NAME}</td>
        <td>
          <c:choose>
            <c:when test="${item.DISCOUNT_RATE > 0}">
              <span class="text-muted">${item.PRICE}</span>
              <br>
              <strong>${item.PRICE - (item.PRICE * item.DISCOUNT_RATE / 100)}</strong>
            </c:when>
            <c:otherwise>
              ${item.PRICE}
            </c:otherwise>
          </c:choose>
        </td>
        <td>${item.QUANTITY}</td>
        <td>${item.CONDITION_NAME}</td>
        <td>
          <c:if test="${item.LOGISTICS_NAME != null}">
            <div>${item.LOGISTICS_NAME}</div>
          </c:if>
          <c:if test="${item.LOGISTICS_NAME == null}">
            <div>-</div>
          </c:if>
          <div>
            <c:if test="${item.WAYBILL_CODE != null}">
              <a href="#">${item.WAYBILL_CODE}</a>
            </c:if>
            <c:if test="${item.WAYBILL_CODE == null}">
              -
            </c:if>
          </div>
        </td>
      </tr>
    </c:forEach>
                 <tr class="sumBorder">
            <td colspan="6" class="text-end bg-secondary bg-opacity-25 text-dark">
                총 결제금액 : <%= totalAmount %>원 + 배송비 <%= shippingFee %>원 =
                <span class="text-danger fw-bold"><%= totalPrice %></span>원
            </td>
        </tr>
              </tbody>
            </table>

            <%-- 구매자 정보 --%>
          <div class="title fs-3 mt-5">구매자 정보</div>
          <hr class="hr"/>
          <table class="table">
            <tr>
              <th class="col-4">주문하시는 분</th>
              <td class="col-4">${userInfo.USER_NAME}</td>
              <th class="col-4">이메일 주소</th>
              <td class="col-4">${userInfo.EMAIL}</td>
            </tr>
            <tr>
              <th>휴대폰 번호</th>
              <td colspan="3">${userInfo.TEL}</td>
            </tr>
          </table>
                      
            <%-- 배송지 정보 --%>
            <div class="title fs-3 mt-5">배송지 정보</div>
            <hr class="hr" />
           <form action="/mypage/editAddress/${resultMap[0].ORDER_UID}">
            <div class="d-flex justify-content-end">
              <button class="editBtn">배송지 수정</button>
            </div>
            </form>
            <div>
            <table class="table mb-5">
              <tr>
                  <th>받으시는 분</th>
                  <td>${shippingAddress.RECIPIENT_NAME}</td>
              </tr>
              <tr>
                  <th>휴대폰 번호</th>
                  <td>${shippingAddress.RECIPIENT_TEL}</td>
              </tr>
              <tr>
                  <th>주소</th>
                  <td>[${shippingAddress.ZIP_CODE}] ${shippingAddress.ADDRESS} ${shippingAddress.DETAIL}</td>
                      </tr>
                  <tr>
                  <th>배송 장소</th>
                  <td>${shippingAddress.DELIVERY_LOCATION}</td>
                      </tr>
            </table>
              <form action="/mypage/orderlist">
              <div class="d-flex justify-content-center mb-5">
                <button class="checkBtn">확인</button>
              </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </main>
    <%-- [GYEONG] 230215 footer --%>
    <%@ include file="/WEB-INF/view/user/common/footer.jsp" %>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
