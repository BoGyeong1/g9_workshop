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
    <link rel="stylesheet" href="/css/mypage/inquiry/inquiry_regi.css" />
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
         <c:set var="text" value="${empty resultMap.PRIVATE_INQUIRY_UID ? '문의' : '수정'}" />
          <div class="title fs-3">1:1상담 ${text}하기</div>
          <hr class="hr">
          <div class="mt-3">
            배송지변경, 주문취소, 반품/교환신청은 [마이페이지>주문/배송
            조회]에서 직접 신청 가능합니다.
          </div>

      <c:set var="formAction" value="${empty resultMap.PRIVATE_INQUIRY_UID ? 'Insert' : 'Update'}" />
      <form action="/mypage/inquiry${formAction}" id="inquiry-form" method="POST">
          
          <table   class="table border-top border-bottom border-3 border-dark mt-5"      >
          <c:if test="${not empty resultMap.PRIVATE_INQUIRY_UID}">
            <input type="hidden" name="PRIVATE_INQUIRY_UID" value="${resultMap.PRIVATE_INQUIRY_UID}">
            </c:if>
            <tbody>
              <tr>
                <th>문의유형</th>
                <td>
      <select name="INQUIRY_CATEGORY_UID" class="select">
      <c:forEach var="category" items="${inquiryCategoryList}">
         <option value="${category.INQUIRY_CATEGORY_UID}">${category.CATEGORY_NAME}</option>
      </c:forEach>
    </select>
                </td>
              </tr>


              <tr>
                <th>제목</th>
                <td><input type="text" name="TITLE" id="" class="title" value="${resultMap.TITLE}" /></td>
              </tr>
              <tr>
                <th>문의내용</th>
                <td>
                <div id="editor" style="height : 400px"></div>
                <input type="hidden" name="CONTENT" id="description">
                </td>
              </tr>
              <tr>
                <th>개인정보 수집동의</th>
                <td>
                  <input type="checkbox" name="private" id="" required />
                  <label for="private">
                    1:1상담 상담을 위한 개인정보 수집에 동의합니다.</label
                  >
                  <a
                    href="#modalTarget01"
                    class="service_modal btn button"
                    data-bs-toggle="modal"
                    >보기 ></a
                  >
                  <div class="modal" id="modalTarget01">
                    <div class="modal-dialog modal-dialog-scrollable">
                      <div class="modal-content">
                        <div
                          class="modal-header text-white bg-secondary fs-4 fw-bold"
                        >
                          개인정보 수집동의
                        </div>
                        <div class="modal-body">
                          <div>
                            -수집목적<br />
                            1:1 상담내용 확인 및 답변<br />
                            <br />
                            -수집항목<br />
                            [필수] 아이디<br />
                            [선택] 휴대전화, 이메일, 첨부이미지 및 문의내용에
                            포함된 정보<br />
                            <br />
                            -보유기간<br />
                            소비자의 불만 또는 분쟁처리관한 기록 : 3년<br />
                            (전자상거래등에서의 소비자보호에 관한 법률)<br />
                            -개인정보 수집·이용에 동의하지 않을 권리가
                            있으나,<br />
                            동의하지 않을 경우 서비스가 제한될 수 있습니다.<br />
                            <br />
                          </div>
                        </div>
                        <div class="modal-footer">
                          <button
                            class="btn btn-secondary"
                            type="button"
                            data-bs-dismiss="modal"
                          >
                            Close
                          </button>
                        </div>
                      </div>
                    </div>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
          <div class="d-flex justify-content-center">
            
              <button class="inquiryBtn" id="submit-button">문의하기</button>
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

let contentData = '${content}'.replace(/\n/g, '');
let content = null;

if (contentData.trim() !== '' && contentData !== 'null') {
  try {
    content = JSON.parse(contentData);
  } catch (e) {
    console.error('Failed to parse JSON data:', e);
  }
}

if (content) {
  quill.setContents(content);
}

let form = document.querySelector('#inquiry-form');
let submitButton = document.querySelector('#submit-button');
submitButton.addEventListener('click', function (event) {
  // get quill content content -> json
  let content = quill.getContents();
  console.log(content);  // content 확인용
  let description = document.querySelector('#description');
  // json 변환해서 실어보내기
  if (content) {
    description.value = JSON.stringify(content);
  } else {
    description.value = 'null';
  }
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
