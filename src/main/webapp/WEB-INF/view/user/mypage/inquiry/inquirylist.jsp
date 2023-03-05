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
    <link rel="stylesheet" href="/css/mypage/inquiry/inquirylist.css" />
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
  <div class="title fs-3">1:1상담 등록/수정/삭제</div>
  <hr />
  <div class="d-flex justify-content-end">
    <form action="/mypage/inquiryRegi">
      <button class="inquiryBtn">1:1 문의하기</button>
    </form>
  </div>

  <table class="table text-center mt-5">
    <thead>
      <tr class="border-top border-bottom border-dark border-3">
        <th>문의유형</th>
        <th>제목</th>
        <th>작성일</th>
        <th>답변 상태</th>
      </tr>
    </thead>
    <tbody>
          <c:if test="${empty resultMap}">
          <tr><td colspan="4"><div>1:1문의내역이 없습니다.</div></tr>
          </c:if>
      <!-- resultMap을 이용하여 문의 리스트를 출력 -->
      <c:forEach var="inquiry" items="${resultMap}">
        <tr>
          <td>${inquiry.CATEGORY_NAME}</td>
          <td><a href="/mypage/inquiryView/${inquiry.PRIVATE_INQUIRY_UID}">${inquiry.TITLE}</a></td>
           <fmt:parseDate value="${inquiry.CREATE_DATE}" var="date" pattern="yyyy-MM-dd HH:mm:ss" />
          <td><fmt:formatDate value="${date}" pattern="yyyy-MM-dd" /></td>
           <td>
          <!-- 답변 여부에 따라서 "미답변" 또는 "답변완료"를 표시 -->
          <c:if test="${not empty inquiry.PRIVATE_INQUIRY_ANSWER_UID}">
            답변완료
          </c:if>
          <c:if test="${empty inquiry.PRIVATE_INQUIRY_ANSWER_UID}">
            미답변
          </c:if>
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
