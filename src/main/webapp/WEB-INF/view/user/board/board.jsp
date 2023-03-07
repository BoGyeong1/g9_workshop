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
                    <c:forEach items="${resultList.postList}" var="board" varStatus="status">
                        <tr>
                            <td class="border border-dark col-1">${board.CATEGORY_NAME}</td>
                            <td class="border border-dark">
                                <form action="/board/view" method="get">
                                    <input type="hidden" name="POST_UID" value="${board.POST_UID}">
                                    <button style="border: none; background: none;" type="submit">
                                        ${board.TITLE}
                                    </button>
                                </form>
                            </td>
                            <td class="border border-dark col-2">
                                <fmt:formatDate value="${board.CREATE_DATE}" pattern="yyyy-MM-dd" />
                            </td>
                            <td class="border border-dark col-2">
                                <fmt:formatDate value="${board.MODIFIED_DATE}" pattern="yyyy-MM-dd" />
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="my-5">
                <div id="page">
                    <nav aria-label="Page navigation example" >
                    <c:set var="_pagination" value="${resultMap.paginations}"/>
                        <ul class="pagination justify-content-center" id="pagination">
                        <c:if test="${_pagination.currentPage > 1 }">
                            <li class="page-item ${_pagination.currentPage > 1 ? '' : 'disabled'}"> <a class="page-link"
                                            href="/board/1" >맨 처음</a>
                            </li>
                        </c:if>
                            <li class="page-item ${_pagination.currentBlock > 1 ? '' : 'disabled'}"><a class="page-link"
                                        href="/board/${_pagination.previousPage}" value="${_pagination.previousPage}" >&laquo;</a>
                            </li>
                            
                    <c:forEach var="i" begin="${_pagination.blockStart}" end="${_pagination.blockEnd}">
                            <li class="page-item"><a class="page-link" href="/board/${i}">${i}</a></li>
                    </c:forEach>
                    <li class="page-item ${_pagination.currentBlock <= _pagination.totalBlock ? '' : 'disabled'}"><a
                                        class="page-link"
                                        href="/board/${_pagination.nextPage}" value="${_pagination.nextPage}">&raquo;</a>
                    </li>
                    <c:if test="${_pagination.currentPage < _pagination.totalPage}">
                        <li class="page-item ${_pagination.currentPage < _pagination.totalPage ? '' : 'disabled'}"><a
                                class="page-link"
                                href="/board/${_pagination.totalPage}"  value="${_pagination.totalPage}">맨
                                끝</a>
                        </li>
                    </c:if>
                    </ul>
                    </nav>
                </div>
            </div>
        </div>
    </main>




  <%-- Footer Include --%>
    <%@ include file="/WEB-INF/view/user/common/footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>

</html>