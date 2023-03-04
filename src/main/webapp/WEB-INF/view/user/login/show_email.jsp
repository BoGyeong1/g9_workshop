<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>지구공방 - 이메일 찾기</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
      crossorigin="anonymous"
    />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/css/login/show_email.css" />
  </head>
  <body>
   <%-- [GYEONG] 23.02.14 header --%>
   <%@ include file="/WEB-INF/view/user/common/simple_header.jsp" %>

    <main class="main">
      <div class="container width">
        <div>
        <%-- [GYEONG] 23.02.14 이메일 표시 --%>
          <div class="d-flex justify-content-center">
            <img src="/img/logo/G9_Logo_Black.png" class="logo" />
          </div>
          <div class="fristText">회원님의 아이디는</div>
          <div><span class="email">${resultMap.EMAIL}</span> 입니다.</div>
        </div>

        <%-- [GYEONG] 23.02.14 비밀번호 찾기 / 로그인하기 버튼  --%>
        <form action="/user/findPassword">
          <div class="d-flex row justify-content-center mt-5 mb-4">
            <button class="find_pw_btn">비밀번호 찾기</button>
          </div>
        </form>
        <form action="/user/login">
          <div class="d-flex row justify-content-center mb-5">
            <button class="login_btn">로그인 하기</button>
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
