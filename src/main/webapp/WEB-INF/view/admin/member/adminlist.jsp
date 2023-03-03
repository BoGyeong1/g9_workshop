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

                <div class="fs-4">Admin 정보 <a href="/admin/register" class="btn btn-dark ms-3">추가</a></div>

                <table class="mt-2 mb-5 table table-bordered">
                <thead>
                <tr>
                <th class="text-center table-light">Admin_UID</th>
                <th class="text-center table-light">ID</th>
                <th class="text-center table-light">이름</th>
                <th class="text-center table-light">닉네임</th>
                <th class="text-center table-light"> 삭제</th>
                </tr>
                </thead>
                <tbody id="memberListTable">
                <c:forEach items="${resultMap}" var="resultData" varStatus="loop">
                <tr>
                <td class="text-center">${resultData.ADMIN_UID}</td>
                <td class="text-center">${resultData.ID}</td>
                <td class="text-center">${resultData.ADMIN_NAME}</td>
                <td class="text-center">${resultData.NICKNAME}</td>
                <td class="text-center "> 
                <a href="/admin/member/deleteAdminInfo/${resultData.ADMIN_UID}" class="btn btn-danger">삭제</a>
                </td>
                </tr>
                </c:forEach>
                </tbody>
                </table>
                <div>
    
                </div>
            </div>
   

        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>
</body>

</html>