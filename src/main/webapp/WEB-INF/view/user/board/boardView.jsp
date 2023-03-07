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
<div class="container d-flex justify-content-center">
  <div>
    <table style="text-align: left;">
      <tr>
        <th>
          <!-- 게시글 카테고리 -->
          <div class="fs-5 border-bottom border-success border-4 text-success mb-3">${boardList.CATEGORY_NAME}
            <!-- 게시글 제목 -->
            <div class="fs-3">${boardList.TITLE}</div>
          </div>
        </th>
      </tr>

      <!-- 작성일 -->
      <div style="font-size: 0.8rem;" class="text-end">작성일
        <span> <fmt:formatDate value="${boardList.CREATE_DATE}" pattern="yyyy-MM-dd" />
        </span>
      </div>

      <!-- 수정일 -->
      <div style="font-size: 0.8rem;" class="text-end">수정일 
        <span> <fmt:formatDate value="${boardList.MODIFIED_DATE}" pattern="yyyy-MM-dd" />
        </span>
      </div>
      
    </table>

    <!-- 게시글 본문  -->
<div style="width: 900px; height: 900px; border: 1px solid transparent; display: flex; justify-content: center; align-items: flex-start;">
  <div style="max-width: 100%; max-height: 100%; overflow-y: auto; text-align: left;">
    ${boardList.CONTENT}
  </div>
</div>

    </div>
  </div>
</div>
                    </div>
                    
            </div>

            
            <!-- 목록 버튼 -->
            <div class=" d-flex justify-content-center mt-3 mb-3">
                <a  class="btn btn-success" href="/board/1" role="button">목록</a>
            </div>
    </main> 

  <%-- Footer Include --%>
    <%@ include file="/WEB-INF/view/user/common/footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>

</html>