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
    <link rel="stylesheet" href="/css/mypage/change_user_info.css" />
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
        <form action="/mypage/updateUserInfo" method="post" id="updateUserForm">
        <div class="content">
          <div class="title fs-3">회원정보 변경</div>
          <hr class="hr" />
          <div class="text">주소지는 기본 주소지로 변경됩니다. </div>
          <div class="text">전화번호는 특수문자나 공백없이 입력해주세요. </div>
          <div class="row mt-5">
            <span class="col-2 fw-bold">이메일 주소</span
            ><span class="col-9">${resultMap.EMAIL}</span>
          </div>
          <div class="row mt-2">
            <span class="col-2 fw-bold">이름</span
            ><span class="col-9">${resultMap.USER_NAME}</span>
          </div>
          <div class="row mt-2">
           <span class="col-2 fw-bold">전화번호</span>
          <span class="col-9">
                  <input type="text" name="TEL" id="" value="${resultMap.TEL}" class="inputBox" />
                  </span>
          </div>
          <div class="row mt-2">
            <span class="col-2 fw-bold">우편번호</span
            ><span class="col-9"
              ><input type="text" name="ZIP_CODE" id="zipcode"value="${resultMap.ZIP_CODE}" class="inputBox"
              onclick="execDaumPostcode()" readonly
            /></span>
          </div>
          <div class="row mt-2">
            <span class="col-2 fw-bold">주소</span
            ><span class="col-9"
              ><input type="text" name="ADDRESS" id="address"value="${resultMap.ADDRESS}" class="inputBox"
              readonly
            /></span>
          </div>
          <div class="row mt-2">
            <span class="col-2 fw-bold">상세주소</span
            ><span class="col-9"
              ><input type="text" name="DETAIL" id="address_detail" value="${resultMap.DETAIL}"class="inputBox"
            /></span>
          </div>
          <div class="row mt-2">
            <span class="col-2 fw-bold">비밀번호 확인</span
            ><span class="col-9"
              ><input type="password" name="PASSWORD" id="password"  class="inputBox"
            /></span>          
            <c:if test="${not empty errorMessage}">
                <span class="text-danger" style="margin-left : 180px">${errorMessage}</span>
            </c:if>
          </div>

          <div class="d-flex justify-content-center">
            <button class="editBtn mb-5">수정</button>
          </div>
        </form>

      </div>
    </main>
    <%-- [GYEONG] 23.02.23 우편번호 검색 --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                
                } 

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("address_detail").focus();
            }
        }).open();
    }

</script>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
