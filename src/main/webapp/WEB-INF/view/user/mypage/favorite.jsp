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
    <link rel="stylesheet" href="/css/mypage/favorite.css" />
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
          <div class="title fs-3">위시리스트</div>

          <hr class="hr"/>


       
            <form id="form" method="post" action="/mypage/deleteFavorites">
            <div>
            <button class="selectDeleteBtn mt-5">선택삭제</button>
          </div>
      <table class="table text-center mt-4">
      <thead> 
      <tr class=" border-dark border-bottom-5">
        <th><input type="checkbox" id="checkAll" /></th>
        <th>상품명</th>
        <th>가격</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="item" items="${resultMap}">
        <tr>
          <td><input type="checkbox" name="PRODUCT_UID" value="${item.PRODUCT_UID}" /></td>
          <td><a href="#">${item.PRODUCT_NAME}</a></td>
          <td>${item.PRICE}</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</form>
        </div>
      </div>
    </main>

<script>
    document.getElementById("checkAll").addEventListener("click", function(){
        var checkboxes = document.getElementsByName("PRODUCT_UID");
        for(var i=0; i<checkboxes.length; i++){
            checkboxes[i].checked = document.getElementById("checkAll").checked;
        }
    });
</script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
