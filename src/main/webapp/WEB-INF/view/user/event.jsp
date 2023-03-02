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
    <%@ include file="/WEB-INF/view/user/common/header.jsp" %>
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
            <a href="/event/ongoing" class="${eventStatus eq 'ongoing' ? 'btn btn-success' : 'btn btn-outline-success'}">진행중 이벤트</a>
            <a href="/event/ended" class="${eventStatus eq 'ended' ? 'btn btn-success' : 'btn btn-outline-success'}">종료된 이벤트</a>
        </div>
        <div class="my-3">
            <c:forEach items="${eventList}" var="event" varStatus="status" >
                <a href="" class="w-100 my-3">
                    <img src="/${event.DIRECTORY_NAME}${event.PHYSICAL_FILE_NAME}" class="img-fluid my-3">
                </a>
            </c:forEach>
        </div>
    </div>
    <%-- [SOO] Footer Include --%>
    <%@ include file="/WEB-INF/view/user/common/footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>

</html>