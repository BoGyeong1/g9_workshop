<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="./css/style.css">
    
    <style>
        .page-link {
            color: #000;
            background-color: #fff;
            border: 1px solid #ccc;
        }

        .page-item.active .page-link {
            z-index: 1;
            color: #555;
            font-weight: bold;
            background-color: #f1f1f1;
            border-color: #ccc;

        }

        .page-link:focus,
        .page-link:hover {
            color: #000;
            background-color: #fafafa;
            border-color: #ccc;
        }

        a {
            text-decoration: none
        }

        a:link {
            color: black;
        }

        a:visited {
            color: black;
        }

        a:hover {
            color: black;
        }

        a:active {
            color: black
        }
    </style>
    <title>EarthWorkshop - Board</title>

<body>
    <%-- header --%>
    <%@ include file="/WEB-INF/view/user/common/header.jsp" %>
    <!-- main  -->
    <main>
        <div style="height: 800px;">
            <div class="m-5">
                <div class="text-center display-6 fw-bold">게시판</div>
                <div class="text-center display-6 fw-bold">Borad</div>
            </div>
            <div class="container d-flex justify-content-center">
                <table class="text-center" width="900px">
                    <thead>
                        <tr class="bg-light">
                            <th class="border border-dark">구분</th>
                            <th class="border border-dark ">제목</th>
                            <th class="border border-dark">작성일</th>
                            <th class="border border-dark">수정일</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${boardList}" var="board" varStatus="status">
                        <tr>
                            <td class="border border-dark">${board.CATEGORY_NAME}</td>
                            <td class="border border-dark">
                                <a href="/your-link-here">${board.TITLE}</a>
                            </td>
                            <td class="border border-dark">${board.CREATE_DATE}</td>
                            <td class="border border-dark">${board.MODIFIED_DATE}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

                        <%-- <div class="pagination">
                            <ul class="pagination justify-content-center">
                                <li class="page-item <c:if test="${pageNo == 1}">disabled</c:if>">
                                    <a class="page-link" href="?pageNo=${pageNo - 1}&itemsPerPage=${itemsPerPage}">Previous</a>
                                </li>
                                <c:forEach var="page" begin="1" end="${pagenav.totalPages}">
                                    <li class="page-item <c:if test="${pageNo == page}">active</c:if>">
                                        <a class="page-link" href="?pageNo=${page}&itemsPerPage=${itemsPerPage}">${page}</a>
                                    </li>
                                </c:forEach>
                                <li class="page-item <c:if test="${pageNo == resultMap.totalPages}">disabled</c:if>">
                                    <a class="page-link" href="?pageNo=${pageNo + 1}&itemsPerPage=${itemsPerPage}">Next</a>
                                </li>
                            </ul>
            </div> --%>

            <%-- <form action="" class="container d-flex justify-content-center" method="GET">
                <select class="form-select-sm me-1" name="searchtitle" id="">
                    <option selected value="st1">제목</option>
                    <option value="st2">내용</option>
                    <option value="st3">작성자</option>
                </select>
                <input type="search" id="searchBoard" name="searchBoard" class="border border-1 border-dark" />
                </button><br>
                <button type="button" class="btn btn-outline-dark ms-1">검색</button></td>
                </tr>
            </form> --%>
        </div>

    </main>




  <%-- Footer Include --%>
    <%@ include file="/WEB-INF/view/user/common/footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>

</html>