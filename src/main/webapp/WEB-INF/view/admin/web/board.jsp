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
             <div class="fs-4">게시판 관리     <a href="/admin/board/form" class="btn btn-dark">
              신규 게시글 등록
            </a> </div>
            
        
    
            <div class="my-3">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>게시글 UID </th>
                            <th>카테고리</th>
                            <th>게시글 제목</th>
                            <th>작성일</th>
                            <th>수정일</th>
                            <th>고정여부</th>
                            <th>수정</th>
                            <th>삭제</th>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${resultMap}" var="board" varStatus="status">
                        
                        <tr class="align-middle">
                        <td>${board.POST_UID}</td>
                            <td>   <c:if test="${board.POST_CATEGORY_UID eq 'PC1'}">
                                       공지사항
                                     </c:if>
                                 <c:if test="${board.POST_CATEGORY_UID eq 'PC2'}">
                                       이벤트
                                     </c:if>
                                      <c:if test="${board.POST_CATEGORY_UID eq 'PC3'}">
                                       소식
                                     </c:if></td>

                            <td>${board.TITLE}</td>
                            <td>${board.CREATE_DATE}</td>
                            <td>${board.MODIFIED_DATE}</td>
                            <td>${board.TOP_FIXED}</td>

                            <td>
                                <form method="get" action="/admin/board/edit/${board.POST_UID}">
                                    <button class="btn btn-primary">
                                        수정하기
                                    </button>

                                </form>
                            </td>

                            <td>    
                                <form method="get" action="/admin/board/edit">
                                    <input type="hidden" name="event-uid" value="${board.POST_UID}">
                                    <button type="submit" class="btn btn-danger">
                                        삭제하기
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