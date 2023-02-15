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
        <div class="w-100 m-5">
            <div id="search-form">
                <form action="/admin/member/list" method="post">
                    <div class="d-flex justify-content-center">
                        <select class="form-select w-25 mx-2" name="filter" id="filter">
                            <option value="uid">UID</option>
                            <option value="email">이메일</option>
                            <option value="name">이름</option>
                            <option value="tel">휴대폰</option>
                        </select>
                        <input class="form-control w-25 mx-2" type="text" name="word" id="word">
                        <button type="submit" class="btn btn-outline-dark mx-2">검색</button>
                    </.div>
                </form>
            </div>
            <%-- 1. 검색창 --%>
            <%-- 2. 전체 리스트 + 1줄씩 요약 + 30개 페이징 --%>
            <%-- ??? 더미 회원 최소 100개 필요 --%>
            <%-- 3. 회원 UID 클릭 시 상세 페이지 이동 --%>
        </div>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>
</body>

</html>