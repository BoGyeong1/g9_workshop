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
    <link rel="stylesheet" href="/css/mypage/cancel_and_refund/refund_exchange_application.css" />
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    <script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
          <div class="title fs-3">반품 / 교환 신청</div>
          <div class="mt-3"></div>

          <hr class="hr"/>
            <form action="/mypage/refundExchangeProcess" method="POST">
              <input type="hidden" name="ORDER_UID" value="${orderId}">
          <table
            class="table border-top border-bottom border-3 border-dark mt-5"
          >
            <tbody>
            <tr>
                <th >주문상세번호 / 상품명</th>
                <td>
             <c:forEach var="data" items="${resultProductNameAndOrderDetailUid}">
                <div>
                 ${data.ORDER_DETAIL_UID}/${data.PRODUCT_NAME}
                </div>
                  </c:forEach>
                  </td>
              </tr>
              <tr>
                <th>반품/교환사유</th>
                <td>
                 <select name="refundExchangeType" id="refundExchangeType" class="select">
                  <option value="REFUND">반품</option>
                  <option value="EXCHANGE">교환</option>
                </select>
                <select name="REASON_UID" id="resultReasons" class="select">
                  <c:forEach var="data" items="${resultReasons}">
                  <option value="${data.REASON_UID}">${data.REASON}</option>
                  </c:forEach>
                </select>
                </td>
              </tr>
              <tr>
                <th>이메일 주소</th>
                <td>${resultOrderUserInfo.EMAIL}</td>
              </tr>
              <tr>
                <th>휴대전화</th>
                <td>
                ${resultOrderUserInfo.TEL}
                </td>
              </tr>
              <tr>
                <th>문의내용</th>
                <td>
                 <div id="editor" style="height : 400px"></div>
                 <input type="hidden" name="REASON_DETAIL" id="description">
                 
                </td>
              </tr>
              
            </tbody>
          </table>

          <div class="d-flex justify-content-center">

              <button id="submit-button" class="returnChangeBtn">신청하기</button>
          </div>
            </form>
        </div>
      </div>
    </main>
    <%-- [GYEONG] 230215 footer --%>
    <%@ include file="/WEB-INF/view/user/common/footer.jsp" %>
<script>
$(document).ready(function() {
  var quill = new Quill('#editor', {
    theme: 'snow',
    modules: {
      toolbar: [
        [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
        ['bold', 'italic', 'underline', 'strike'],
        [{ 'color': [] }, { 'background': [] }],
        ['link', 'image', 'video'],
        [{ 'align': [] }],
        ['clean']
      ]
    }
  });

  let submitButton = document.querySelector('#submit-button');
				submitButton.addEventListener('click', function (event) {
					// get quill content content -> json
					let content = editor.getContents();
					let description = document.querySelector('#description');
					// json 변환해서 실어보내기
					description.value = JSON.stringify(content);
					form.submit();
				});
  
});
</script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
