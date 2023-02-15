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
          <div class="title fs-3">1:1상담 문의하기</div>
          <hr class="hr">
          <div class="mt-3">
            배송지변경, 주문취소, 반품/교환신청은 [마이페이지>주문/배송
            조회]에서 직접 신청 가능합니다.
          </div>

          <form action="/mypage/inquiryList">
          <table
            class="table border-top border-bottom border-3 border-dark mt-5"
          >
            <tbody>
              <tr>
                <th>문의유형</th>
                <td>
                  <select name="" id="" class="select">
                    <option value="">배송문의</option>
                  </select>
                  <select name="" id="" class="select">
                    <option value="">구성품 누락</option>
                    <option value="">묶음배송요청</option>
                    <option value="">배송비</option>
                    <option value="">배송완료 미수령</option>
                    <option value="">배송일정</option>
                    <option value="">배송지 변경</option>
                  </select>
                </td>
              </tr>
              <tr>
                <th>이메일 주소</th>
                <td>user1234@gmail.com</td>
              </tr>
              <tr>
                <th>휴대전화</th>
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
                <th>제목</th>
                <td><input type="text" name="" id="" class="title" /></td>
              </tr>
              <tr>
                <th>문의내용</th>
                <td>
                  <textarea name="" id="" cols="80" rows="10"></textarea>
                </td>
              </tr>
              <tr>
                <th>첨부파일</th>
                <td>
                  <input type="file" name="file" id="file" />
                  <label for="file">
                    <div class="file">파일 업로드하기</div>
                  </label>
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
            
              <button class="inquiryBtn">문의하기</button>
          </div>
            </form>
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
