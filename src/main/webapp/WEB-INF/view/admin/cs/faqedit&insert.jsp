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
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    <script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>지구공방 - Admin</title>
        <style>
        a:link {
            color: black;
            background-color: transparent;
            text-decoration: none;
        }

        a:visited {
            color: black;
            background-color: transparent;
            text-decoration: none;
        }

        a:hover {
            color: black;
            background-color: transparent;
            text-decoration: underline;
        }

        a:active {
            color: black;
            background-color: transparent;
            text-decoration: underline;
        }

        .ql-editor {
            min-height: 300px !important;
            max-height: 800px;
            overflow: hidden;
            overflow-y: scroll;
            overflow-x: scroll;
        }
    </style>
</head>

<body>
    <%@ include file="/WEB-INF/view/admin/common/adminheader.jsp" %>
    <div class="d-flex">
        <%@ include file="/WEB-INF/view/admin/common/adminnav.jsp" %>
        <c:set var="form_action" value="update" />
        <c:if test="${empty result}">
        <c:set var="form_action" value="insert" />
        </c:if>
        <div class="container w-50 mt-5">
            <form action="/admin/csCenter/${form_action}" method="post">
                <div class="fs-4">FAQ 관리</div>
                <hr>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">FAQ 작성</th>
                        </tr>
                    </thead>
                    <tbody class="table-group-divider">
                        <tr>
                            <th scope="row">카테고리</th>
                            <td colspan="3">
                                <select class="form-select btn btn-dark btn-sm w-25" value="${result.INQUIRY_CATEGORY_UID}" name="INQUIRY_CATEGORY_UID">
                                    <c:forEach items="${category}" var="item" varStatus="status">
                                        <option value="${item.INQUIRY_CATEGORY_UID}" name="category">${item.CATEGORY_NAME}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">FAQ 제목</th>
                            <td colspan="3">
                                <input type="text" name="TITLE" id="TITLE" class="form-control w-100" required value="${result.TITLE}"> 
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">FAQ 내용</th>
                            <td colspan="3">
                                <div id="editor">${result.CONTENT}</div>
                                <input type="hidden" id="CONTENT" name="CONTENT" value="${result.CONTENT}">
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="d-flex justify-content-center align-items-centers m-3">
                    <input type="hidden" name="FAQ_UID" value="${result.FAQ_UID}">
                    <button type="submit" class="btn btn-success">${form_action}</button>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>
    <script src="/js/board.js"></script>
</body>

</html>