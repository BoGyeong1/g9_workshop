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
    

    <title>EarthWorkshop - BoardView</title>

<body>

  <%-- header --%>
    <%@ include file="/WEB-INF/view/user/common/header.jsp" %>

    <!-- main  -->
    <main>
        <div style="height: 900px;">
            <div class="m-5">
                <div class="text-center display-6 fw-bold mb-3">게시글</div>

            </div>
            <div class="container d-flex justify-content-center">
                <div>
                    <table>
                        <tr>
                            <th>
                                <!-- 게시글 카테고리 -->
                                  <c:forEach items="${boardList}" var="board" varStatus="status">
                                <div class="fs-5 border-bottom border-success border-4 text-success">${boardList.CATEGORY_NAME}
                                    <!-- 게시글 제목 -->
                                    <div class="fs-3">${boardList.TITLE}</div>
                                </div>
                            </th>
                        </tr>
                        <!-- 작성일 -->
                        <div style="font-size: 0.8rem;" class="text-end">작성일 <span> <fmt:formatDate value="${boardList.CREATE_DATE}" pattern="yyyy-MM-dd" /></span></div>
                        <!-- 수정일 -->
                        <div style="font-size: 0.8rem;" class="text-end">수정일 <span> <fmt:formatDate value="${boardListS.MODIFIED_DATE}" pattern="yyyy-MM-dd" /></span></div>

                    </table>

                    <!-- 게시글 본문  -->
                    <div class="mt-5 mb-5">
                    ${boardList.CONTENT}
                    </div>
                    </c:forEach>


            </div>
            <!-- 목록 버튼 -->
            <div class=" d-flex justify-content-center mt-2">
                <a name="" id="" class="btn btn-success" href="/board" role="button">목록</a>
            </div>

            <%-- <!-- 검색창 -->
            <form action="" class="container d-flex justify-content-center mt-2">
                <select class="form-select-sm me-1" name="searchtitle" id="">
                    <option selected value="st1">제목</option>
                    <option value="st2">내용</option>
                    <option value="st3">작성자</option>
                </select>
                <input type="search" id="searchBoard" name="searchBoard" class="border border-1 border-dark" />
                </button><br>
                <button type="button" class="btn btn-outline-dark ms-1">검색</button></td>
                </tr>
            </form>
        </div>
    </main> --%>



  <%-- Footer Include --%>
    <%@ include file="/WEB-INF/view/user/common/footer.jsp" %>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>

</html>