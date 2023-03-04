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
    <link rel="stylesheet" href="/css/mypage/withdraw.css" />
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
        <c:if test="${not empty message}">
          <script>
            alert("${message}");
          </script>
        </c:if>
          <div class="title fs-3">회원탈퇴</div>
          <hr class="hr"/>  
          <div class="title"><span class="fs-5">회원확인</span><span class="ms-5" >${email}</span></div>

       
      <form action="/mypage/withdrawProcess" method="POST">
          <div class="title mt-5 fs-5">비밀번호 확인</div>
          <hr class="hr"/>
          <div>탈퇴하시려면 비밀번호를 입력해주십시오.</div>
          <table class="table mt-5 mb-5 border-top border-bottom border-dark">
            <tr>
              <th>비밀번호</th>
              <td><input type="password" name="PASSWORD"/></td>
            </tr>
          </table>

          <div>
            취소/반품/교환 신청 등 서비스가 진행 중인 고객님은 모든 처리가
            완료된 후에 탈퇴가 가능합니다.
          </div>
          <div>
            배송 등 거래가 진행 중인 고객님은 모든 거래가 완료된 후에 탈퇴가
            가능합니다.
          </div>

          <div class="d-flex justify-content-center m-3">
            <input type="checkbox" name="withdrawCheck" id="withdrawCheck" required />
            <label for="withdrawCheck"
              >위 유의사항을 모두 확인하였으며, 지구공방 회원탈퇴에
              동의합니다.</label
            >
          </div>
          <div class="d-flex justify-content-center m-3">
            <button class="withdrawBtn">회원탈퇴</button>
          </div>
          </form >
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
