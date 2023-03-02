<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>지구공방 - Admin 회원 정보 수정 </title>
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
    <script
      src="https://code.jquery.com/jquery-3.6.3.min.js"
      integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
  <%-- [GYEONG] 23.02.14 header --%>
    <%@ include file="/WEB-INF/view/admin/common/adminheader.jsp" %>
    <div class="d-flex">
        <%@ include file="/WEB-INF/view/admin/common/adminnav.jsp" %>
    <main>
      <div class="main">
        <div class="container">
          <div>
          <%-- 회원가입 --%>
            <form action="/admin/member/editProcessUserInfo" method="POST">
              <div class="mt-5 text-center fs-3 fw-bold">
              지구공방 Admin 회원 정보 수정
              </div>
              <input type="hidden" name="USER_UID" value="${resultMap.USER_UID}" />
              <div class="row mt-5 phone_width">
               <label for="email" class="text-center">이메일</label>
                <input
                  type="email"
                  name="EMAIL"
                  id="email"
                  class="input"
                  placeholder="이메일 주소"
                  required
                  readonly
                  value="${resultMap.EMAIL}"
                />
              </div>
              <div class="row justify-content-center mt-4">
              <label for="name" class="text-center">이름</label>
                <input
                  type="text"
                  name="USER_NAME"
                  id="name"
                  class="input"
                  placeholder="이름"
                   value="${resultMap.USER_NAME}"
                  required
                />
              </div>
              <div class="row justify-content-center mt-4">
              <label for="tel" class="text-center">휴대폰 번호</label>
                <input
                  type="text"
                  name="TEL"
                  id="tel"
                  class="input"
                  placeholder="휴대폰 번호"
                    value="${resultMap.TEL}"
                  required
                />
              </div>
                <div class="row justify-content-center mt-4">
                <label for="point" class="text-center">잔여 포인트</label>
                <input
                  type="text"
                  name="POINT"
                  id="point"
                  class="input"
                  placeholder="잔여포인트"
                  value="${resultMap.POINT}"
                  required
                />
  
              </div>

              <div class="row justify-content-center mt-4 zip">
              <label for="zipcode" class="text-center">우편번호</label>
                <input
                  type="text"
                  name="ZIP_CODE"
                  id="zipcode"
                  class="input"
                  placeholder="우편번호"
                  onclick="execDaumPostcode()"
                  value="${resultMap.ZIP_CODE}"
                  readonly
                  required
                />
              </div>
              <div class="row justify-content-center mt-4">
              <label for="address" class="text-center">주소</label>
                <input
                  type="text"
                  name="ADDRESS"
                  id="address"
                  class="input"
                  placeholder="주소"
                  value="${resultMap.ADDRESS}"
                  readonly
                  required
                />
              </div>
              <div class="row justify-content-center mt-4">
              <label for="address_detail" class="text-center">상세주소</label>
                <input
                  type="text"
                  name="DETAIL"
                  id="address_detail"
                  class="input"
                  placeholder="상세주소"
                  value="${resultMap.DETAIL}"
                />
                <div class="row justify-content-center mt-4">
                기본 배송지로 수정됩니다.
                </div>

                <c:set var="selectedConditionUid" value="${resultMap.USER_CONDITION_UID}" />
               <div class="d-flex justify-content-center mt-4">
              <label for="userConditions" class="text-center me-2">회원상태</label>
               <select class="form-select w-25 mx-2" name="USER_CONDITION_UID" id="userConditions">
                <c:forEach items="${userConditions}" var="resultData" varStatus="loop">
                   <option value="${resultData.USER_CONDITION_UID}" ${resultData.USER_CONDITION_UID == selectedConditionUid ? 'selected' : ''}>${resultData.CONDITION_NAME}</option>
                </c:forEach>
                </select>
               </div>
              <%-- summit 버튼 --%>
              <div class="d-flex justify-content-center m-3">
                <button class="btn01" id="submit">수정</button>
              </div>
            </form>
          </div>
        </div>
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
