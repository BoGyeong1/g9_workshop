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
    <link rel="stylesheet"
     href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
      integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <link rel="stylesheet" href="/css/signup/signup.css" />
  </head>
  <body>
  <%-- [GYEONG] 23.02.14 header --%>
   <%@ include file="/WEB-INF/view/user/common/simple_header.jsp" %>

    <main>
      <div class="main">
        <div class="container">
          <div>
          <%-- 회원가입 --%>
            <form action="./welcome.html">
              <div class="d-flex justify-content-center mt-5">
                <img src="/img/logo/G9_Logo_Black.png" class="logo" />
              </div>

              <div class="row mt-5 phone_width">
                <input
                  type="email"
                  name="email"
                  id="email"
                  class="email col-9"
                  placeholder="이메일 주소"
                />
                <button class="phone_button col-3">중복확인</button>
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
              <div class="row justify-content-center mt-3">
                <input
                  type="password"
                  name="password_check"
                  id="password_check"
                  class="input"
                  placeholder="비밀번호 확인"
                />
              </div>
              <div class="row justify-content-center mt-3">
                <input
                  type="text"
                  name="name"
                  id="name"
                  class="input"
                  placeholder="이름"
                />
              </div>
              <div class="row mt-3 phone_width">
                <input
                  type="text"
                  name="tel"
                  id="tel"
                  class="phone col-10"
                  placeholder="휴대폰 번호"
                />
                <button class="phone_button col-2">인증</button>
              </div>

              <div class="row justify-content-center mt-3 zip">
                <i class="fa-solid fa-magnifying-glass fa-2 icon"></i>
                <input
                  type="text"
                  name="zipcode"
                  id="zipcode"
                  class="input_zip"
                  placeholder="우편번호"
                />
              </div>
              <div class="row justify-content-center mt-3">
                <input
                  type="text"
                  name="address"
                  id="address"
                  class="input"
                  placeholder="주소"
                />
              </div>
              <div class="row justify-content-center mt-3">
                <input
                  type="text"
                  name="address_detail"
                  id="address_detail"
                  class="input"
                  placeholder="상세주소"
                />
                <div class="address_text mb-2">
                  입력하신 주소지가 기본 배송지로 설정됩니다.
                </div>
              </div>
              <%-- 광고성 정보 수신동의 체크박스 --%>
              <div class="d-flex justify-content-center mt-3">
                <div class="me-5 fw-bold">광고성 정보 수신 동의</div>
                <input
                  type="checkbox"
                  name="adver_email"
                  id="adver_email"
                  class="me-2"
                />
                <label for="adver_email " class="me-2">이메일</label>
                <input
                  type="checkbox"
                  name="adver_phone"
                  id="adver_phone"
                  class="me-2"
                />
                <label for="adver_phone">문자</label>
              </div>
              <%-- summit 버튼 --%>
              <div class="d-flex justify-content-center m-3">
                <button class="btn01">다음</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </main>
    <%-- [GYEONG] 23.02.14 footer --%>
    <%@ include file="/WEB-INF/view/user/footer.jsp" %>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
