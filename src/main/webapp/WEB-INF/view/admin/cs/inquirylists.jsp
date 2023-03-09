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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/css/admin/memberlist.css">
    <title>지구공방 - Admin</title>

</head>

<body>
    <%@ include file="/WEB-INF/view/admin/common/adminheader.jsp" %>
    <div class="d-flex">
        <%@ include file="/WEB-INF/view/admin/common/adminnav.jsp" %>
        <div class="w-100 m-5">
            <div id="search-form">



                <div class="fs-4">문의현황</div>

                <table class="mt-2 mb-5 table table-bordered">
                <thead>
                <tr>
                <th class="text-center table-light">PRIVATE_INQUIRY_UID</th>
                <th class="text-center table-light">USER_UID</th>
                <th class="text-center table-light">문의유형</th>
                <th class="text-center table-light">제목</th>
                <th class="text-center table-light">작성일</th>
                </tr>
                </thead>
                <tbody id="listTable">
                <c:forEach items="${resultMap}" var="resultData" varStatus="loop">
                <tr>
                <td class="text-center col-2">${resultData.PRIVATE_INQUIRY_UID}</td>
                <td class="text-center col-2">${resultData.USER_UID}</td>
                <td class="text-center col-1">${resultData.CATEGORY_NAME}</td>
                <td class="text-center col-1"><a href="/admin/inquiry/inquirys/${resultData.PRIVATE_INQUIRY_UID}">${resultData.TITLE}</a></td>
                <td class="text-center col-2">${resultData.CREATE_DATE}</td>
                </tr>
                </c:forEach>
                </tbody>
                </table>
                <div>
                    <span id="searchResultCount"></span>
                    <span id="searchKeywordDisplay"></span>
                </div>
            </div>

        </div>
    </div>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>
</body>

</html>