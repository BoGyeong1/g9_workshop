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
    <title>EarthWorkshop - Event</title>
</head>

<body>
    <%-- [SOO] Header Include --%>
    <%@ include file="./header.jsp" %>

    <%-- [SOO] Main Area --%>
    <div class="container fw-bold text-center">
        <div class="m-5">
            <div class="fs-3">
                이벤트
            </div>
            <div class="fs-3">
                EVENT
            </div>
        </div>
        <div class="m-5" id="event-btn">
            <%-- TO-DO 패스베리어블에 따라 버튼 다르게 --%>
            <a href="/event/ongoing" class="btn btn-success">진행중 이벤트</a>
            <a href="/event/ended" class="btn btn-outline-success">종료된 이벤트</a>
        </div>
        <%-- TO-DO 이벤트 불러오기 c:Foreach --%>
    </div>

    <%-- [SOO] Footer Include --%>
    <%@ include file="./footer.jsp" %>
</body>

</html>