<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
      integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <link rel="stylesheet" href="/css/mypage/cancel_and_refund/cancel_application_list.css" />
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
<div class="content">
  <div class="title fs-3">주문 내역</div>

  <hr class="hr" />
  <div>
    <div>교환신청은 상품 수령 후 7일 이내만 가능합니다.</div>
    <div>
      단, 사용 및 상품이 훼손된 경우는 7일 이내라도 교환이 불가합니다.
    </div>
    <div>
      교환 신청 이후 재고 사정에 따라 품절이 발생 될 수 있습니다.
    </div>
  </div>

 <table class="table text-center mt-5 mb-5">
  <thead>
    <tr class="border-top border-bottom border-dark border-3">
      <th>주문일자</th>
      <th>주문번호</th>
      <th>주문상품정보</th>
      <th>결제금액</th>
      <th>신청</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="item" items="${resultMap}">
      <tr>
        <form action="/mypage/cancelApplication">
          <td><fmt:formatDate value="${item.ORDER_DATE}" pattern="yyyyMMdd" /></td>
          <td>${item.ORDER_UID}</td>
          <td><a href="#">${item.PRODUCT_NAME}</a></td>
          <td>${item.PAY_AMOUNT+2500}원</td>
           <td>
            <c:choose>
              <c:when test="${item.CONDITION_NAME == '주문완료'or item.CONDITION_NAME == '배송준비중' or item.CONDITION_NAME == '결제완료'}">
      <form action="/mypage/cancelApplication/${item.ORDER_UID}">
        <button class="button">취소 신청</button>
      </form>   
              </c:when>
              <c:when test="${item.CONDITION_NAME == '배송완료'}">
                <form action="/mypage/refundExchangeApplication">
                  <input type="hidden" name="orderUid" value="${item.ORDER_UID}" />
                  <button class="button">반품/교환 신청</button>
                </form>
              </c:when>
              <c:otherwise>
                <span class="text-muted">-</span>
              </c:otherwise>
            </c:choose>
          </td>
        </form>
      </tr>
    </c:forEach>
  </tbody>
</table>
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
