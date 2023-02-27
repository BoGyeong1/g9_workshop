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
    <link rel="stylesheet" href="/css/mypage/reviews/reviewlist.css" />
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
          <div class="title fs-3">상품리뷰</div>

          <hr class="hr" />
          <div class="mt-5">
            <button id="possibleReviewBtn" class="possibleReview">
              <span>작성가능한 상품</span>
            </button>
            <button class="recordReview"><span>내가 작성한 리뷰</span></button>
          </div>

          <table class="table text-center mt-5">
  <thead>
    <tr class="border-top border-bottom border-dark border-3">
      <th>주문날짜</th>
      <th>주문상품정보</th>
      <th>리뷰 작성</th>
    </tr>
  </thead>
  <tbody id="reviewList">
    <c:forEach var="product" items="${resultMap}">
      <tr>
        <td><a href="#">${product.ORDER_DATE}</a></td>
        <td><a href="#">${product.PRODUCT_NAME}</a></td>
        <td>
          <form action="/mypage/reviewRegi/${product.ORDER_DETAIL_UID}">
            <button type="submit" class="reviewRegiBtn" data-order-detail-uid="${product.ORDER_DETAIL_UID}">리뷰 작성하기</button>
          </form>
        </td>
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
