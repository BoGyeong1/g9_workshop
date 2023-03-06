<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
      integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <link rel="stylesheet" href="/css/mypage/reviews/reviewlist2.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
          <span>
            <form>
            <button type="submit" formaction="/mypage/reviewlist" id="possibleReviewBtn" class="possibleReview">작성가능한 상품</button>
            <button type="submit" formaction="/mypage/myReviewList" class="recordReview ms-3">내가 작성한 리뷰</button>
          </form>
          </div>

                <table class="table text-center mt-5" id="table">
                  <thead>
                    <tr class="border-top border-bottom border-dark border-3">
                      <th>작성날짜</th>
                      <th>상품명</th>
                      <th>내용</th>
                      <th>별점</th>
                      <th>수정 / 삭제</th>
                    </tr>
                  </thead>
                  <tbody id="reviewList">
                          <c:if test="${empty resultMap}">
                          <tr><td colspan="5"><div>내가 작성한 리뷰내역이 없습니다.</div></tr>
                          </c:if>
                    <c:forEach var="product" items="${resultMap}">
                      <tr>
                        <td><fmt:formatDate value="${product.CREATE_DATE}" pattern="yyyy-MM-dd" var="createDate" />${createDate}</a></td>
                        <td>${product.PRODUCT_NAME}</td>
                        <td>
                          <form action="/mypage/reviewRegi/${product.ORDER_DETAIL_UID}">
                            <a class="">${product.CONTENT}</a>
                          </form>
                        </td>
                        <td>
                <span class="rating">
                  <input type="radio" id="star5-${product.REVIEW_UID}" name="rating-${product.REVIEW_UID}" value="5" disabled="disabled" ${product.RATING eq 5 ? "checked" : ""}/>
                  <label class="full" for="star5-${product.REVIEW_UID}"></label>
                  <input type="radio" id="star4-${product.REVIEW_UID}" name="rating-${product.REVIEW_UID}" value="4" disabled="disabled" ${product.RATING eq 4 ? "checked" : ""}/>
                  <label class="full" for="star4-${product.REVIEW_UID}"></label>
                  <input type="radio" id="star3-${product.REVIEW_UID}" name="rating-${product.REVIEW_UID}" value="3" disabled="disabled" ${product.RATING eq 3 ? "checked" : ""}/>
                  <label class="full" for="star3-${product.REVIEW_UID}"></label>
                  <input type="radio" id="star2-${product.REVIEW_UID}" name="rating-${product.REVIEW_UID}" value="2" disabled="disabled" ${product.RATING eq 2 ? "checked" : ""}/>
                  <label class="full" for="star2-${product.REVIEW_UID}"></label>
                  <input type="radio" id="star1-${product.REVIEW_UID}" name="rating-${product.REVIEW_UID}" value="1" disabled="disabled" ${product.RATING eq 1 ? "checked" : ""}/>
                  <label class="full" for="star1-${product.REVIEW_UID}"></label>
                </span>
                        </td>
                        <td>
                <form >
                  <button type="submit" id="editBtn" formaction="/mypage/editReview/${product.REVIEW_UID}">수정</button>
                  <button type="submit" id="deleteBtn"formaction="/mypage/deleteReview/${product.REVIEW_UID}">삭제</button>
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
