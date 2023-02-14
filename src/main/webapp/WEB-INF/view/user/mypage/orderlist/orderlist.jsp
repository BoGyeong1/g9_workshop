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
    <link rel="stylesheet" href="/css/mypage/orderlist/orderlist.css" />
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
        <%-- 주문 / 배송 리스트 출력 --%>
          <div class="title fs-3">주문 / 배송 내역</div>
          <hr class="hr" />
          <div><button class="selectDeleteBtn">선택 삭제</button></div>
          <table class="table text-center mt-3">
            <thead>
              <tr class="border-top border-bottom border-dark border-3">
                <th><input type="checkbox" name="" id="" /></th>
                <th>주문일자/주문번호</th>
                <th>주문상품정보</th>
                <th>결제금액</th>
                <th>진행상태</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th><input type="checkbox" name="" id="" /></th>
                <td><a href="/orderDetail">20230205/202302051132A23</a></td>
                <td><a href="#">트레비 백팩</a></td>
                <td>55000원</td>
                <td>배송준비중</td>
              </tr>
              <tr>
                <th><input type="checkbox" name="" id="" /></th>
                <td><a href="#">20230202/202302023179A23</a></td>
                <td><a href="#">키링</a></td>
                <td>8000원</td>
                <td>배송완료</td>
              </tr>
            </tbody>
          </table>
          <div class="orderStep">
            <div class="title fs-3">STEP</div>
            <hr class="hr" />
            <div class="orderStepList">
              <ul class="d-flex justify-content-between">
                <li class="li">
                  <i class="fa-solid fa-pen-to-square icon fa-5x"></i>
                  주문접수
                  <i class="fa-solid fa-arrow-right icon2 fa-2x"></i>
                </li>
                <li class="li">
                  <i class="fa-regular fa-credit-card icon3 fa-5x"></i>
                  결제완료
                  <i class="fa-solid fa-arrow-right icon2 fa-2x"></i>
                </li>
                <li class="li">
                  <i class="fa-solid fa-box icon4 fa-5x"></i>

                  상품/배송준비중
                  <i class="fa-solid fa-arrow-right icon5 fa-2x"></i>
                </li>
                <li class="li">
                  <i class="fa-solid fa-truck-arrow-right icon3 fa-5x"></i>
                  배송중
                  <i class="fa-solid fa-arrow-right icon2 fa-2x"></i>
                </li>
                <li class="li">
                  <i class="fa-solid fa-boxes-stacked icon3 fa-5x"></i>
                  배송완료
                </li>
              </ul>
            </div>
            <div>
              <div>주문취소는 배송준비중 단계까지 가능합니다.</div>
              <div>
                배송완료부터 취소/반품/교환 신청과 리뷰작성이 가능합니다.
              </div>
            </div>
          </div>
          </div>
      </div>
      </div>
    </main>
<%-- [GYEONG] 230215 footer --%>
    <%@ include file="/WEB-INF/view/user/common/footer.jsp" %>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
