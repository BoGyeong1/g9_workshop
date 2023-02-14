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
    <link rel="stylesheet" href="/css/login/show_password.css" />
  </head>
  <body>
    <%-- [GYEONG] 23.02.14 header --%>
   <%@ include file="/WEB-INF/view/user/common/simple_header.jsp" %>

    <main>
      <div class="container width">
        <div>
          <div class="d-flex justify-content-center">
            <img src="/img/logo/G9_Logo_Black.png" class="logo" />
          </div>
          <div class="fristText fs-5">회원님의 이메일 주소로</div>
          <div class="fs-5">임시 비밀번호가 발급되었습니다.</div>
        </div>
        <form action="/login">
          <div class="d-flex row justify-content-center mt-5 mb-4">
            <button class="find_password_btn">로그인 하기</button>
          </div>
        </form>
        <form action="/home">
          <div class="d-flex row justify-content-center mb-5">
            <button class="login_btn">메인으로 돌아가기</button>
          </div>
        </form>
      </div>
    </main>
    <%-- [GYEONG] 23.02.14 footer --%>
     <%@ include file="/WEB-INF/view/user/common/footer.jsp" %>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
