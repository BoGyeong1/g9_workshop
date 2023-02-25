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
    <link rel="stylesheet" href="/css/mypage/cancel_and_refund/cancel_application.css" />
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
          <div class="title fs-3">취소 신청</div>
          <div class="mt-3"></div>

          <hr />
<form action="/mypage/cancelApplicationList">
          <table
            class="table border-top border-bottom border-3 border-dark mt-5"
          >
            <tbody>
              <tr>
                <th>주문번호</th>
                <td>202302051132A23</td>
              </tr>
              <tr>
                <th>상품명</th>
                <td>트레비 백팩</td>
              </tr>
              <tr>
                <th>취소사유</th>
                <td>
                  <select name="" id="" class="select">
                    <option value="">재결재</option>
                    <option value="">배송지 변경</option>
                    <option value="">단순변심</option>
                  </select>
                </td>
              </tr>
              <tr>
                <th>이메일 주소</th>
                <td>user1234@gmail.com</td>
              </tr>
              <tr>
                <th>휴대전화</th>
                <td>
                01023451234
                </td>
              </tr>
            </tbody>
          </table>

          <div class="d-flex justify-content-center">
            
              <button class="cancel_btn">취소하기</button>
          </div>
            </form>
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
