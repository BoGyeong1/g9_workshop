<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>지구공방 - 회원가입</title>
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
   <%@ include file="/WEB-INF/view/user/common/simple_header.jsp" %>

    <main>
      <div class="main">
        <div class="container">
          <div>
          <%-- 회원가입 --%>
            <form action="/welcome" method="POST">
              <div class="d-flex justify-content-center mt-5">
                <img src="/img/logo/G9_Logo_Black.png" class="logo" />
              </div>
              <div class="row mt-5 phone_width">
                <input
                  type="email"
                  name="EMAIL"
                  id="email"
                  class="input"
                  placeholder="이메일 주소"
                  required
                  oninput = "checkEmail()"
                />
                <div class="email_ok col " >사용가능한 이메일입니다.</div>
                <div class="email_no col " >이미 사용하고 있는 이메일입니다.</div>
              </div>
              <div class="row justify-content-center mt-4">
                <input
                  type="password"
                  name="PASSWORD"
                  id="password"
                  class="input"
                  placeholder="비밀번호"
                  required
                />
              </div>
              <div class="row justify-content-center phone_width mt-4">
                <input
                  type="password"
                  name="PASSWORD_CHECK"
                  id="password_check"
                  class="input"
                  placeholder="비밀번호 확인"
                  required
                />
                <div class="password_ok" id="alert-success">비밀번호가 일치합니다.</div>
                <div class="password_no" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
              </div>
              <div class="row justify-content-center  mt-4">
                <input
                  type="text"
                  name="USER_NAME"
                  id="name"
                  class="input"
                  placeholder="이름"
                  required
                />
              </div>
              <div class="row justify-content-center mt-4">
                <input
                  type="text"
                  name="TEL"
                  id="tel"
                  class="input"
                  placeholder="휴대폰 번호"
                  required
                />
  
              </div>

              <div class="row justify-content-center mt-4 zip">
                <i class="fa-solid fa-magnifying-glass fa-2 icon"></i>
                <input
                  type="text"
                  name="ZIP_CODE"
                  id="zipcode"
                  class="input_zip"
                  placeholder="우편번호"
                  onclick="execDaumPostcode()"
                  readonly
                  required
                />
              </div>
              <div class="row justify-content-center mt-4">
                <input
                  type="text"
                  name="ADDRESS"
                  id="address"
                  class="input"
                  placeholder="주소"
                  readonly
                  required
                />
              </div>
              <div class="row justify-content-center mt-4">
                <input
                  type="text"
                  name="DETAIL"
                  id="address_detail"
                  class="input"
                  placeholder="상세주소"
                />
                                <div class="address_text mb-2">
                  입력하신 주소지가 기본 배송지로 설정됩니다.
                </div>


              <%-- 광고성 정보 수신동의 체크박스 --%>
              <div class="d-flex justify-content-center mt-4">
                <div class="me-5 fw-bold">광고성 정보 수신 동의</div>
                <input
                  type="checkbox"
                  name="EMAIL_INFO_AGREE"
                  id="adver_email"
                  class="me-2"
                />
                <label for="adver_email " class="me-2">이메일</label>
                <input
                  type="checkbox"
                  name="TEL_INFO_AGREE"
                  id="adver_phone"
                  class="me-2"
                />
                <label for="adver_phone">문자</label>
              </div>
              <%-- summit 버튼 --%>
              <div class="d-flex justify-content-center m-3">
                <button class="btn01" id="submit">다음</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </main>
    <%-- [GYEONG] 23.02.14 footer --%>
    <%@ include file="/WEB-INF/view/user/common/simple_footer.jsp" %>

<script>

//[GYEONG] 23.02.23 이메일 중복체크
  function checkEmail(){
  var email = $("#email").val();
  $.ajax({
    url : "/emailCheck",
    type : "POST",
    data : {email: email},
    success:function(cnt){
      if(cnt==0){
      $(".email_ok").css("display","inline-block");
      $(".email_no").css("display","none");
      $("#submit").removeAttr("disabled");
      
      } else {
      $(".email_ok").css("display","none");
      $(".email_no").css("display","inline-block");
      $("#email").val('');
      $("#submit").attr("disabled", "disabled");
      }
    },
    error:function(){
      alert("에러입니다.");
    }
  });
};
//[GYEONG] 23.02.23 비밀번호 체크
    $(function(){
        $("#alert-success").hide();
        $("#alert-danger").hide();
        $("#password_check").keyup(function(){
            var pwd1=$("#password").val();
            var pwd2=$("#password_check").val();
            if(pwd1 != "" || pwd2 != ""){
                if(pwd1 == pwd2){
                    $("#alert-success").show();
                    $("#alert-danger").hide();
                    $("#submit").removeAttr("disabled");
                }else{
                    $("#alert-success").hide();
                    $("#alert-danger").show();
                    $("#submit").attr("disabled", "disabled");
                }    
            }
        });
    });

</script>

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
