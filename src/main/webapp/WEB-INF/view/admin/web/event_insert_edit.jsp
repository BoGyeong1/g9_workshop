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
            <%-- 객체가 비어있다면 --%>
            <c:if test="${empty eventInfo}">
            <form action="/admin/event/insert" method="post" enctype="multipart/form-data">
                <div class="my-3 fs-1">
                    이벤트 등록
                </div>
            </c:if>
            <%-- 객체가 비어있지 않다면 --%>
            <c:if test="${not empty eventInfo}">
            <form action="/admin/event/edit/submit" method="post" enctype="multipart/form-data">
                <div class="my-3 fs-1">
                    이벤트 수정
                </div>
                </c:if>
                <div class="my-3">
                    <label for="event-name" class="form-label">이벤트명</label>
                    <input type="text" name="event-name" id="event-name" class="form-control" value="${eventInfo.EVENT_NAME}" required>
                </div>
                <div class="my-3">
                    <label for="start-date" class="form-label">시작일자</label>
                    <input type="date" name="start-date" id="start-date" class="form-control" value="${eventInfo.START_DATE}" required>
                </div>
                <div class="my-3">
                    <label for="end-date" class="form-label">종료일자</label>
                    <input type="date" name="end-date" id="end-date" class="form-control" value="${eventInfo.END_DATE}" required>
                </div>
                <div class="my-3">
                    <label for="url" class="form-label">URL</label>
                    <input type="text" name="url" id="url" class="form-control" value="${eventInfo.URL}" required>
                </div>
                <div class="my-3">
                    <label for="exposure" class="form-label">노출여부</label>
                    <select name="exposure" id="exposure" class="form-select" value="${eventInfo.EXPOSURE}" required>
                        <option value="YES">YES</option>
                        <option value="NO">NO</option>
                    </select>
                <%-- 객체가 비어있다면 --%>
                </div>
                <c:if test="${empty eventInfo}">
                <div class="my-3">
                    <label for="event-banner" class="form-label">이벤트 배너</label>
                    <input type="file" accept="image/*" name="event-banner" id="event-banner" class="form-control" required>
                </div>
                <div class="my-3">
                    <button type="submit" class="btn btn-primary">
                        등록하기
                    </button>
                </div>
                </c:if>
                <%-- 객체가 비어있지 않다면 --%>
                <c:if test="${not empty eventInfo}">
                <div class="my-3">
                    이미지 수정기능 개발중
                    <input type="hidden" id="product-uid" name="product-uid" value="${eventInfo.EVENT_UID}">
                </div>
                <div class="my-3">
                    <button type="submit" class="btn btn-primary">
                        수정하기
                    </button>
                </div>
                </c:if>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>
</body>

</html>