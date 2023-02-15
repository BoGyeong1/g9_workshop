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
          <div class="title fs-3">주문 / 배송 내역</div>
          <hr />

          <div>
            <table class="table text-center">
              <thead>
                <tr class="border-bottom border-3 border-dark">
                  <th>주문날짜/번호</th>
                  <th>상품정보</th>
                  <th>판매가</th>
                  <th>수량</th>
                  <th>주문상태</th>
                  <th>택배정보</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>20230205 / 202302051132A23</td>
                  <td>트레비 백팩</td>
                  <td>55000원</td>
                  <td>1</td>
                  <td>배송준비중</td>
                  <td>
                    <div>대한통운</div>
                    <div><a href="#">1231231245</a></div>
                  </td>
                </tr>
                <tr class="sumBorder">
                  <td
                    colspan="6"
                    class="text-end bg-secondary bg-opacity-25 text-dark"
                  >
                    총 결제금액 : 55000원 + 배송비 2500원 =
                    <span class="text-danger fw-bold">57500</span>원
                  </td>
                </tr>
              </tbody>
            </table>

            <div class="title fs-3 mt-5">배송지 정보 수정</div>
            <hr />
            <form action="/mypage/orderDetail">
            <div>
              <table class="table mb-5">
                <tr>
                  <th>받으시는 분</th>
                  <td><input type="text" name="name" id="" class="inputBox" /></td>
                </tr>
                <tr>
                  <th>휴대폰 번호</th>
                  <td>
                    <select name="" id="" class="phone">
                    <option value="">010</option>
                    <option value="">010</option>
                    <option value="">016</option>
                  </select>
                  -
                  <input type="text" name="" id="" class="phone" />
                  -
                  <input type="text" name="" id="" class="phone" />
                  </td>
                </tr>
                <tr>
                  <th>우편번호</th>
                  <td>
                  <input type="text" name="" id="" class="inputBox"/>
                  </td>
                </tr>
                    <tr>
                  <th>주소</th>
                  <td>
                  <input type="text" name="" id="" class="inputBox"/>
                  </td>
                </tr>
                 <tr>
                  <th>상세 주소</th>
                  <td>
                  <input type="text" name="" id="" class="inputBox"/>
                  </td>
                </tr>
                <tr>
                  <th>배송 유의사항</th>
                  <td>
                   <input type="text" name="" id="" class="inputBox"/>
                  </td>
                </tr>
              </table>
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
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
