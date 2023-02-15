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
    <link rel="stylesheet" href="/css/mypage/change_user_info.css" />
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
          <div class="title fs-3">회원정보 변경</div>

          <hr class="hr" />
          <div class="row mt-2">
            <span class="col-2 fw-bold">이메일 주소</span
            ><span class="col-9">user1234@gmail.com</span>
          </div>
          <div class="row mt-2">
            <span class="col-2 fw-bold">이름</span
            ><span class="col-9">진보경</span>
          </div>
          <div class="row mt-2">
           <span class="col-2 fw-bold">전화번호</span>
          <span class="col-9"><select name="" id="" class="phone">
                    <option value="">010</option>
                    <option value="">010</option>
                    <option value="">016</option>
                  </select>
                  -
                  <input type="text" name="" id="" class="phone" />
                  -
                  <input type="text" name="" id="" class="phone" />
                  </span>
          </div>
          <div class="row mt-2">
            <span class="col-2 fw-bold">우편번호</span
            ><span class="col-9"
              ><input type="text" name="" id="" class="inputBox"
            /></span>
          </div>
          <div class="row mt-2">
            <span class="col-2 fw-bold">주소</span
            ><span class="col-9"
              ><input type="text" name="" id="" class="inputBox"
            /></span>
          </div>
          <div class="row mt-2">
            <span class="col-2 fw-bold">상세주소</span
            ><span class="col-9"
              ><input type="text" name="" id="" class="inputBox"
            /></span>
          </div>
          <div class="row mt-2">
            <span class="col-2 fw-bold">비밀번호 확인</span
            ><span class="col-9"
              ><input type="password" name="" id="" class="inputBox"
            /></span>
          </div>
          <div class="d-flex justify-content-center">
            <button class="editBtn mb-5">수정</button>
          </div>


          <%-- 비밀번호 변경 --%>
          <div class="title fs-3">비밀번호 변경</div>

          <hr class="hr" />
          <div class="row mt-5">
            <span class="col-2 fw-bold">기존 비밀번호</span
            ><span class="col-9"
              ><input type="password" name="" id="" class="inputBox"
            /></span>
          </div>
          <div class="row mt-2">
            <span class="col-2 fw-bold">새 비밀번호 </span
            ><span class="col-9"
              ><input type="password" name="" id="" class="inputBox"
            /></span>
          </div>
          <div class="row mt-2">
            <span class="col-2 fw-bold">새 비밀번호 확인</span
            ><span class="col-9"
              ><input type="password" name="" id="" class="inputBox"
            /></span>
          </div>
          <div class="text mt-2 text-secondary">
            <div class="fw-bold">주의하세요!</div>
            <div>
              아이디와 같은 비밀번호나 주민등록번호, 생일, 학번, 전화번호 등
              개인정보와 관련된 숫자나
            </div>
            <div>
              연속된 숫자, 통일 반복된 숫자 등 다른 사람이 쉽게 알아 낼 수 있는
              비밀번호는 사용하지 않도록 주의하여 주시기 바랍니다.
            </div>
          </div>
          <div class="d-flex justify-content-center">
            <button class="editBtn mb-5">수정</button>
          </div>
        </div>
      </div>
    </main>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
