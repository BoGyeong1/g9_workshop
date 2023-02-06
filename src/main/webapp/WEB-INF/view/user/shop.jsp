<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/resources/css/shop.css">
    <title>EarthWorkshop - Shop</title>
</head>

<body>
    <%-- [SOO] Header Include --%>
    <%@ include file="./header.jsp" %>

    <div class="d-flex">
        <%-- [SOO] Shop Nav Include --%>
        <%@ include file="./shopnav.jsp" %>

        <%-- [SOO] Main Area --%>
        <div class="container w-100 m-3 text-center">  
            영역 테스트
        </div>
    </div>

    <%-- [SOO] Footer Include --%>
    <%@ include file="./footer.jsp" %>
</body>

</html>