<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>지구공방</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
      crossorigin="anonymous"
    />
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    
    <link rel="stylesheet"  href="/css/login/login.css"  type="text/css" />
  </head>
  <body>
  <%-- [GYEONG] 23.02.14 header --%>
  <header>
   <%@ include file="/WEB-INF/view/user/common/simple_header.jsp" %>
  </header>
    <main >
      <div class="container">
        <div class="d-flex justify-content-center mt-5">
          <img src="/img/logo/G9_Logo_Black.png" class="logo" />
        </div>
        <form class="form-signin" method="post" action="/login">
        <%-- [GYEONG] 23.02.14 로그인 칸 --%>
        <input type="hidden" name="userType" value="user">
        <div class="row justify-content-center mt-5">
          <input
            type="text"
            name="username"
            id="email"
            class="input"
            placeholder="이메일 주소"
          />
        </div>
        <div class="row justify-content-center mt-3">
          <input
            type="password"
            name="password"
            id="password"
            class="input"
            placeholder="비밀번호"
          />
        </div>
        <%-- [GYEONG] 23.02.14 로그인 / 회원가입 버튼 --%>
          <div class="row justify-content-center mt-3">
            <button class="login_btn">로그인</button>
          </div>
        </form>
        <form action="/selectSignup">
          <div class="row justify-content-center mt-3">
            <button class="signup_btn">회원가입</button>
          </div>
        </form>

        <%-- [GYEONG] 23.02.14 아이디 저장 --%>
        <div class="row mt-2 width">
          <span class="d-flex justify-content-start col-5">
            <input
              type="checkbox"
              name="id_save"
              id="id_save"
              class="id_save me-1"
            />
            <label for="idsave">아이디 저장</label>
          </span>
          <%-- [GYEONG] 23.02.14 아이디 찾기 / 비밀번호 찾기 --%>
          <span class="d-flex justify-content-end col-7">
            <form action="/findEmail">
              <button class="find_id_btn">이메일 찾기</button>
            </form>
            <span>&nbsp|&nbsp</span>
            <form action="/findPassword">
              <button class="find_pw_btn">비밀번호 찾기</button>
            </form>
          </span>
        </div>
        <div class="m-4"></div>
        <hr class="hr" />
        <%-- [GYEONG] 23.02.14 간편 로그인 --%>
        <div class="row justify-content-center mt-3">
          <div class="text-center mb-2">간편 로그인</div>
        </div>
        <div class="row justify-content-center mt-3">
          <button class="naver_login_btn">Naver 로그인</button>
        </div>
        <div class="row justify-content-center mt-3">
          <button class="kakao_login_btn">Kakao 로그인</button>
        </div>
      </div>
    </main>

     <%@ include file="/WEB-INF/view/user/common/simple_footer.jsp" %>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
