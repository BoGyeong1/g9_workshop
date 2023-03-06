<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

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
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
      integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <link rel="stylesheet" href="/css/mypage/orderlist/edit_address.css" />
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
               <%-- 주문 상세내역 --%>
<%
// resultMap에서 orderDetails 정보 추출
List<Map<String, Object>> orderDetails = (List<Map<String, Object>>)request.getAttribute("resultMap");

// 총 결제금액 계산
int totalAmount = 0;
for(Map<String, Object> orderDetail : orderDetails) {
    int price = (Integer)orderDetail.get("PRICE");
    int quantity = (Integer)orderDetail.get("QUANTITY");
    int discountRate = (Integer)orderDetail.get("DISCOUNT_RATE");
    int discountedPrice = price - (price * discountRate / 100); // 할인율 반영된 상품가격
    totalAmount += (discountedPrice * quantity);
}

int shippingFee = 2500;
int totalPrice = totalAmount + shippingFee;
%>
          <div class="title fs-3">주문 / 배송 내역</div>
          <hr class="hr" />
          
          <div>
<table class="table text-center">
  <thead>
    <tr class="border-bottom border-3 border-dark">
      <th>주문날짜/번호</th>
      <th>상품정보</th>
      <th>판매가 (할인율)</th>
      <th>수량</th>
      <th>주문상태</th>
      <th>택배정보</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="item" items="${resultMap}">
      <tr>
        <td>
          <fmt:formatDate value="${item.ORDER_DATE}" pattern="yyyyMMdd" /> / ${item.ORDER_DETAIL_UID}
        </td>
        <td>${item.PRODUCT_NAME}</td>
        <td>
          <c:choose>
            <c:when test="${item.DISCOUNT_RATE > 0}">
              <span class="text-muted">${item.PRICE}</span>
              <br>
              <strong>${item.PRICE - (item.PRICE * item.DISCOUNT_RATE / 100)}</strong>
            </c:when>
            <c:otherwise>
              ${item.PRICE}
            </c:otherwise>
          </c:choose>
        </td>
        <td>${item.QUANTITY}</td>
        <td>${item.CONDITION_NAME}</td>
        <td>
          <c:if test="${item.LOGISTICS_NAME != null}">
            <div>${item.LOGISTICS_NAME}</div>
          </c:if>
          <c:if test="${item.LOGISTICS_NAME == null}">
            <div>-</div>
          </c:if>
          <div>
            <c:if test="${item.WAYBILL_CODE != null}">
              <a href="#">${item.WAYBILL_CODE}</a>
            </c:if>
            <c:if test="${item.WAYBILL_CODE == null}">
              -
            </c:if>
          </div>
        </td>
      </tr>
    </c:forEach>
                 <tr class="sumBorder">
            <td colspan="6" class="text-end bg-secondary bg-opacity-25 text-dark">
                총 결제금액 : <%= totalAmount %>원 + 배송비 <%= shippingFee %>원 =
                <span class="text-danger fw-bold"><%= totalPrice %></span>원
            </td>
        </tr>
              </tbody>
            </table>

            <div class="title fs-3 mt-5">배송지 정보 수정</div>
<hr />

<div>기본 배송지 수정 시 기본이라는 이름은 수정하지 말아주세요. </div>
<div>기본 배송지 누락 시 접속에 문제가 생길 수 있습니다.</div>
<form action="/mypage/editAddressProcess/${resultMap[0].ORDER_UID}" method ="post">
  <div>
  <table class="table mb-5">
      <tr>
        <th>받으시는 분</th>
        <td><input type="text" name="RECIPIENT_NAME" id="RECIPIENT_NAME" 
        class="inputBox" value="${shippingAddress.RECIPIENT_NAME}"
        required
         /></td>
      </tr>
      <tr>
        <th>휴대폰 번호</th>
        <td>
          <input type="text" name="RECIPIENT_TEL" id="RECIPIENT_NAME" class="inputBox" 
          value="${shippingAddress.RECIPIENT_TEL}"
          required
          >
        </td>
      </tr>
            <tr>
        <th>배송지 이름</th>
        <td>
          <input type="text" name="ADDRESS_NAME" id="addressname" class="inputBox" 
          required
          value="${shippingAddress.ADDRESS_NAME}"

                  required
           />
        </td>
      </tr>
      <tr>
        <th>우편번호</th>
        <td>
          <input type="text" name="ZIP_CODE" id="zipcode" class="inputBox" 
          value="${shippingAddress.ZIP_CODE}"
                  onclick="execDaumPostcode()"
                  readonly
                  required
           />
        </td>
      </tr>

      <tr>
        <th>주소</th>
        <td>
          <input type="text" name="ADDRESS" id="address" class="inputBox" 
          required
          value="${shippingAddress.ADDRESS}"

                  required
           />
        </td>
      </tr>
      <tr>
        <th>상세 주소</th>
        <td>
          <input type="text" name="DETAIL" id="address_detail" class="inputBox" 
          value="${shippingAddress.DETAIL}"
                  required />
        </td>
      </tr>
            <tr>
        <th>배송 장소</th>
        <td>
<select name="deliveryLocation">
  <c:forEach items="${deliveryLocations}" var="location">
    <option value="${location.DELIVERY_LOCATION_UID}">${location.DELIVERY_LOCATION}</option>
  </c:forEach>
</select>
        </td>
      </tr>
    </table>
    
  </div>
              <div class="d-flex justify-content-center mb-5">
                
                  <button class="checkBtn">수정</button>
              </div>
            </div>
          </form>
          </div>
        </div>
      </div>
    </main>
        <%-- [GYEONG] 230215 footer --%>
    <%@ include file="/WEB-INF/view/user/common/footer.jsp" %>

    <%-- [GYEONG] 23.02.25 우편번호 검색 --%>
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
