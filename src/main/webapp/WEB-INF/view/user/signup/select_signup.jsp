<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
      integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <link rel="stylesheet" href="/css/signup/select_signup.css" />
    <title>지구공방</title>
  </head>
  <body>
    <%-- [GYEONG] 23.02.14 header --%>
    <%@ include file="/WEB-INF/view/user/common/simple_header.jsp" %>

    <main>
      <!-- 로고 -->
      <div id="signup" class="container">
        <div class="d-flex justify-content-center mt-5">
          <img src="/img/logo/G9_Logo_Black.png" />
        </div>
        <!-- 환영문구 -->
        <div id="welcome_text" class="text-center mt-3 mb-4 fs-4">
          지구공방에 오신 것을 환영합니다!
        </div>
        <hr class="m-auto hr" />
        <div id="select_text" class="text-center m-4 fs-6">
          회원가입 방식을 선택해주세요.
        </div>
        <!-- 이메일 회원가입 버튼 -->
        <div class="button m-4">
          <form action="/agreeTerms">
            <button id="email_signup">
              <i class="fa-solid fa-square-envelope fa-lg"></i>
              이메일로 회원가입
            </button>
          </form>
        </div>
        <!-- 네이버 회원가입 버튼 -->
        <div class="button m-4">
          <button id="naver_signup">
            <span>네이버로 회원가입</span>
          </button>
        </div>
        <!-- 카카오 회원가입 버튼 -->
        <div class="button m-4">
          <button id="kakao_signup">카카오로 회원가입</button>
        </div>
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
