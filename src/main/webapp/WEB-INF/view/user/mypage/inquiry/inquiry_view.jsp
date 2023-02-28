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
    <link rel="stylesheet" href="/css/mypage/inquiry/inquiry_view.css" />
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
          <div class="title fs-3">1:1 문의 내역</div>
          <hr class="hr"/> 
          <div class="d-flex justify-content-end mt-5">
          <form action= "/mypage/inquiryUpdate/${resultMap.PRIVATE_INQUIRY_UID}">
            <input type="hidden" name="PRIVATE_INQUIRY_UID" value="${resultMap.PRIVATE_INQUIRY_UID}">
            <button class="editBtn me-2" >수정</button>
          </form>
                    <form action= "/mypage/inquiryDelete/${resultMap.PRIVATE_INQUIRY_UID}">
            <input type="hidden" name="PRIVATE_INQUIRY_UID" value="${resultMap.PRIVATE_INQUIRY_UID}">
                       <button  class="deleteBtn">삭제</button>
          </form>

       
          </div>
          <table class="table mt-2">
            <tr class="border-top border-3">
              <th>문의유형</th>
              <td>${resultMap.CATEGORY_NAME}</td>
              <th>작성일</th>
              <td>${resultMap.CREATE_DATE}</td>
            </tr>
            <tr>
              <th>제목</th>
              <td colspan="5">${resultMap.TITLE}</td>
            </tr>
            <tr class="border-bottom border-3">
              <th>내용</th>
              <td colspan="5">
               <div id="editor" style="height : 400px"></div>
              
              </td>
            </tr>
          </table>

          <div class="d-flex justify-content-center">
            <form action="/mypage/inquiryList">
              <button class="checkBtn">확인</button>
            </form>
          </div>
        </div>
      </div>
    </main>
    <%-- [GYEONG] 230215 footer --%>
    
    <%@ include file="/WEB-INF/view/user/common/footer.jsp" %>

<script>
$(document).ready(function() {
  // QuillJS 생성
  var quill = new Quill('#editor', {
    theme: 'snow',
    readOnly: true,
    modules: {
     toolbar: false
    }
  });

  // JSON 데이터 파싱
  var contentData = '${content}'.replace(/\n/g, '');
  var content = JSON.parse(contentData);

  // QuillJS에 JSON 데이터를 설정
  quill.setContents(content);
});

</script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
