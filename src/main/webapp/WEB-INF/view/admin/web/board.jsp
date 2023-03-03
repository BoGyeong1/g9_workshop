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
            <a href="/admin/board/insert" class="btn btn-primary">
                게시판 등록
            </a>
                        <a href="/admin/board/update" class="btn btn-primary">
                게시판 수정
            </a>
            <div class="my-3">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>이벤트명</th>
                            <th>시작</th>
                            <th>종료</th>
                            <th>URL</th>
                            <th>노출여부</th>
                            <th>순서</th>
                            <th>수정</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${eventInfos}" var="event" varStatus="status">
                        <tr class="align-middle">
                            <td>${event.EVENT_NAME}</td>
                            <td>${event.START_DATE}</td>
                            <td>${event.END_DATE}</td>
                            <td>${event.URL}</td>
                            <td>${event.EXPOSURE}</td>
                            <td>${event.EXPOSURE_ORDER}</td>
                            <td>
                                <form method="post" action="/admin/event/edit">
                                    <input type="hidden" name="event-uid" value="${event.EVENT_UID}">
                                    <button type="submit" class="btn btn-primary">
                                        수정하기
                                    </button>
                                </form>
                            </td>
                        </tr>
                        </c:forEach>
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