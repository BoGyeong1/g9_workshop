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
    <link rel="stylesheet" href="./css/style.css">

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

        .accordion-item .accordion-button {
            background-color: rgb(0, 0, 0);
            color: white;
        }
    </style>
    <title>g9 - Cart</title>

        <%-- header --%>
    <%@ include file="/WEB-INF/view/user/common/header.jsp" %>
<body>

    <!-- main  -->
    <main>
        <div class="container w-50">
            <div class="m-5">
                <div class="text-center display-6 fw-bold">고객센터</div>


            </div>

            <ul class="nav nav-pills nav-fill fw-bold ">

                <li class="nav-item">
                    <a class="nav-link " aria-current="page" href="#">FAQ</a>
                </li>


                <li class="nav-item">
                    <a class="nav-link " href="/mypage/inquiryList">1:1 상담</a>
                </li>

            </ul>


            <div class="fs-4 text-success fw-bold text-center m-3">
                자주하는 질문 (FAQ)
            </div>


            <!-- FAQ -->
          <div class="accordion mb-5" id="accordionExample">

            <c:forEach items="${csList}" var="cs" varStatus="status">
                <%-- 제목 --%>
                <div class="accordion-item">
                <h2 class="accordion-header" id="heading${status.index}">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                    data-bs-target="#collapse${status.index}" aria-expanded="false" aria-controls="collapse${status.index}">
                    ${cs.TITLE}
                    </button>
                </h2>

                <%-- 내용 --%>
                <div id="collapse${status.index}" class="accordion-collapse collapse" aria-labelledby="heading${status.index}"
                    data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                    ${cs.CONTENT}
                    </div>
                </div>
                </div>
            </c:forEach>

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