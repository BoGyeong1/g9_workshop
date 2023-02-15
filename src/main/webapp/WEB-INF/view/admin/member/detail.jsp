<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <title>지구공방 - Admin</title>
</head>

<body>
    <%@ include file="/WEB-INF/view/admin/common/adminheader.jsp" %>
    <div class="d-flex">
        <%@ include file="/WEB-INF/view/admin/common/adminnav.jsp" %>
        <%-- 회원정보 전체 출력 / 주문 리스트 / 리뷰 리스트 / 문의 리스트 / 주소 리스트 / 찜목록 --%>
        <div class="w-100 m-5">
            <div id="user-info-box">
                <div class="fs-4">회원정보</div>
                <table class="mt-2 mb-5 table table-bordered">
                    <tr>
                        <th class="text-center table-light">UID</td>
                        <td>UID 출력</td>
                        <th class="text-center table-light">회원명</td>
                        <td>회원명 출력</td>
                        <th class="text-center table-light">E-Mail</td>
                        <td>이메일 주소 출력</td>
                        <th class="text-center table-light">회원 상태</td>
                        <td>활성 / 비활성 / 탈퇴</td>
                    </tr>
                    <tr>
                        <th class="text-center table-light">가입일자</td>
                        <td>가입일자 출력</td>
                        <th class="text-center table-light">연락처</td>
                        <td>연락처 출력</td>
                        <th class="text-center table-light">보유 포인트</td>
                        <td>포인트 잔액 출력</td>
                        <th class="text-center table-light">광고성 정보 수신 동의</td>
                        <td>수신거부 / 휴대폰 / 이메일</td>
                    </tr>
                </table>
            </div>
            <div id="user-order-box">
                <%-- 주문번호 클릭 시 주문 상세 페이지로 이동 --%>
                <div class="fs-4">주문내역</div>
                <table class="mt-2 mb-5 table table-bordered">
                    <thead>
                        <tr>
                            <th class="text-center">주문번호</th>
                            <th class="text-center">주문일자</th>
                            <th class="text-center">주문상품</th>
                            <th class="text-center">주문금액</th>
                            <th class="text-center">주문상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>order.uid</td>
                            <td>order.date</td>
                            <%-- Order UID 에 담긴 Product 중 1개만 작성 후 cnt -1 --%>
                            <td>말랑카우 망고맛 외 4개</td>
                            <td>order.totalPrice</td>
                            <td>취소됨</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div id="user-review-box">
                <%-- 주문번호 클릭 시 주문 상세 페이지로 이동 --%>
                <div class="fs-4">리뷰내역</div>
                <table class="mt-2 mb-5 table table-bordered">
                    <thead>
                        <tr>
                            <th class="text-center">리뷰번호</th>
                            <th class="text-center">상품명</th>
                            <th class="text-center">리뷰내용</th>
                            <th class="text-center">작성일자</th>
                            <th class="text-center">상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1234</td>
                            <td>말랑카우 망고맛</td>
                            <td>맛있어여</td>
                            <td>date</td>
                            <%-- 게시중일 시 관리자 삭제 버튼 노출 / 클릭시 Review delete --%>
                            <td>유저 삭제</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div id="user-cs-box">
                <%-- 문의번호 클릭 시 응답 페이지로 이동 --%>
                <div class="fs-4">문의내역</div>
                <table class="mt-2 mb-5 table table-bordered">
                    <thead>
                        <tr>
                            <th class="text-center">문의번호</th>
                            <th class="text-center">문의제목</th>
                            <th class="text-center">작성일자</th>
                            <th class="text-center">상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1234</td>
                            <td>취소 부탁드려요</td>
                            <td>date</td>
                            <td>답변 완료</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>
</body>

</html>