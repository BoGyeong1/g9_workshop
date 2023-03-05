<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>지구공방 - 회원가입</title>
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
    <link rel="stylesheet" href="/css/signup/welcome.css" />
  </head>
  <body>
  <%-- [GYEONG] 23.02.14 header --%>
   <%@ include file="/WEB-INF/view/user/common/simple_header.jsp" %>
    
    <main>
      <div class="container width">
        <div class="d-flex justify-content-center">
          <img src="/img/logo/G9_Logo_Black.png" class="logo" />
        </div>
        <div class="d-flex justify-content-center fs-3 mt-4">
          지구공방에 가입해주셔서 감사합니다!
        </div>
        <div class="d-flex justify-content-center fs-6 mt-2">
          지구와 더불어 살아가는 당신의 내일을 응원합니다.
        </div>
        <div class="d-flex justify-content-center m-5">
          <form action="/home">
            <button class="main_btn">메인으로 돌아가기</button>
          </form>
          <form action="/user/login">
            <button class="login_btn">로그인 하기</button>
          </form>
        </div>
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
