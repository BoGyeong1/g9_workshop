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
    <link rel="stylesheet" href="/css/mypage/reviews/review_regi.css" />
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
          <div class="title fs-3">리뷰 작성하기</div>
          <hr class="hr" />
          <div class="mt-3 text">
            <div>조건에 적합하지 않은 리뷰는 노출되지 않습니다.</div>
            <div>
              욕설, 비방, 상품과 무관한 내용, 반복문자, 특정 효능에 있어 오해의
              소지가 있는 내용을 담고 있거나
            </div>
            <div>
              타인의 권리를 침해하는 동영상 및 사진은 삭제될 수 있습니다.
            </div>
            <div>저작권 침해에 대한 책임은 본인에게 있습니다.</div>
            <div>
              다만, 상품에 대한 불만, 판매자에게 불리한 내용이라는 이유만으로
              삭제하지 않습니다.
            </div>
            <div>
              개인 정보 입력은 금지되어 있으며, 발생하는 피해에 대해 지구공방은
              책임지지 않습니다.
            </div>
          </div>
          <c:if test="${empty reviewId}">
          <c:set var="formAction" value="Insert"/>
          </c:if>
          <c:if test="${not empty reviewId}">
              <c:set var="formAction" value="Update"/>
          </c:if>

         <form action="/mypage/reviewRegi${formAction}" method="POST">
         <input type="hidden" name="PRODUCT_UID" value="${resultMap.PRODUCT_UID}">
          <input type="hidden" name="reviewId" value="${resultMap.REVIEW_UID}">
          <table
            class="table border-top border-bottom border-3 border-dark mt-5"
          >
            <tbody>
              <tr>
                <th>주문상세번호</th>
                <td>${resultMap.ORDER_DETAIL_UID}
                <input type="hidden" name="ORDER_DETAIL_UID" value="${resultMap.ORDER_DETAIL_UID}">
                </td>
                  
              </tr>
              <tr>
                <th>상품명</th>
                <td>${resultMap.PRODUCT_NAME}
                 <input type="hidden" name="PRODUCT_NAME" value="${resultMap.PRODUCT_NAME}">
                </td>
              </tr>
<tr>
  <th>상품만족도</th>
  <td>
  		<div class="text-bold">별점을 선택해주세요</div>
<fieldset>
  <input type="radio" name="RATING" value="5" id="rate1" ${resultMap.RATING == 5 ? "checked" : ""}><label for="rate1">★</label>
  <input type="radio" name="RATING" value="4" id="rate2" ${resultMap.RATING == 4 ? "checked" : ""}><label for="rate2">★</label>
  <input type="radio" name="RATING" value="3" id="rate3" ${resultMap.RATING == 3 ? "checked" : ""}><label for="rate3">★</label>
  <input type="radio" name="RATING" value="2" id="rate4" ${resultMap.RATING == 2 ? "checked" : ""}><label for="rate4">★</label>
  <input type="radio" name="RATING" value="1" id="rate5" ${resultMap.RATING == 1 ? "checked" : ""}><label for="rate5">★</label>
</fieldset>
  </td>
</tr>
              <tr>
                <th>한줄 리뷰</th>
                <td>
                  <input type="text" name="CONTENT" id="content" value="${resultMap.CONTENT}"class="title" />
                </td>
              </tr>
              
            </tbody>
          </table>
          <div class="d-flex justify-content-center">
           
              <button class="saveBtn mb-5">저장하기</button>
          </div>
            </form>
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
