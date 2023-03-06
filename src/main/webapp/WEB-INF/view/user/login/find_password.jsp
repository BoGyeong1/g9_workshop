<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>지구공방 - 비밀번호 찾기</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/css/login/find_password.css" />
  </head>
  <body>
  <%-- [GYEONG] 23.02.14 header --%>
   <%@ include file="/WEB-INF/view/user/common/simple_header.jsp" %>


  <main>
      <%-- 비밀번호 찾기 --%>
    <div class="container width">
      <form action="/user/showPassword" method="POST">
        <div class="title fs-3">비밀번호 찾기</div>
        <hr class="hr" />

          <c:if test="${not empty error.error}">
            <div class="alert alert-warning mt-3 mx-auto text-center" role="alert">
              이메일 주소나 이름, <br>
              휴대폰 번호가 일치하지 않습니다.<br>
              다시 확인해주세요.
            </div>
          </c:if>
        <div class="d-flex row justify-content-center mt-5 mb-3">
          <input
            type="email"
            name="EMAIL"
            id="email"
            class="input"
            placeholder="이메일 주소"
            required
          />
        </div>
        <div class="d-flex row justify-content-center mb-3">
          <input
            type="text"
            name="USER_NAME"
            id="name"
            class="input"
            placeholder="이름"
            required
          />
        </div>
        <div class="d-flex row justify-content-center mt-3 mb-3">
          <input
            type="text"
            name="TEL"
            id="phone"
            class="input"
            placeholder="휴대폰 번호"
            required
          />
        </div>
      <%-- 발급버튼 --%>
        <div class="d-flex row justify-content-center mt-5 mb-5">
           <button class="find_password_btn">임시 비밀번호 발급</button>
        </div>
      </form>
     </div>
  </main>
        <%-- [GYEONG] 23.02.14 footer --%>
 <%@ include file="/WEB-INF/view/user/common/simple_footer.jsp" %>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
