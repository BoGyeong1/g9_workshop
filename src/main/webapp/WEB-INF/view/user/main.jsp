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
    <link rel="stylesheet" href="/css/main.css">
    <title>EarthWorkshop - Home</title>
</head>

<body>
    <%-- [SOO] Header Include --%>
    <%@ include file="/WEB-INF/view/user/common/header.jsp" %>

    <%-- [SOO] Main Banner --%>
    <div id="main-img-box">
        <img src="/img/bg/main_bg.png" alt="banner" class="w-100" id="main-img">
        <div id="main-text">
            <div class="m-3">
                <div class="fw-bold fs-3">지구공방은 지구와 더불어 살기 위한</div>
                <div class="fw-bold fs-3">생활속 새활용 제품을 통해 친환경 라이프 스타일을 제안합니다.</div>
            </div>
            <div id="main-img-box" class="m-3">
                <img id="main-img" src="/img/logo/G9_Logo_White.png" alt="logo" class="w-50">
            </div>
        </div>
    </div>

    <%-- [SOO] Main Area --%>
    <div class="container">
        <%-- [SOO] Product List --%>
        <%-- [SOO] Product List Header --%>
        <div id="section-head" class="mt-5 mb-3 d-flex justify-content-between">
            <div id="section-title-box" class="d-flex align-items-center">
                <span id="section-title" style="margin-right: 5px;" class="fs-4">Made in</span>
                <img id="section-img" src="/img/logo/G9_Logo.png" alt="" style="height: 30px;">
            </div>
            <a href="/shop" class="text-decoration-none text-secondary">더보기 &gt;</a>
        </div>
        <%-- [SOO] Product List Items 1 - BOX x 4 --%>
        <div id="section-body">
            <div class="row">
                <div class="col col-12 col-md-3">
                    <a href="">
                        <img src="./img/item/item1.png" alt="" class="w-100">
                    </a>
                </div>
                <div class="col col-12 col-md-3">
                    <a href="">
                        <img src="./img/item/item2.png" alt="" class="w-100">
                    </a>
                </div>
                <div class="col col-12 col-md-3">
                    <a href="">
                        <img src="./img/item/item3.png" alt="" class="w-100">
                    </a>
                </div>
                <div class="col col-12 col-md-3">
                    <a href="">
                        <img src="./img/item/item4.png" alt="" class="w-100">
                    </a>
                </div>
            </div>
        </div>
        <%-- [SOO] TODO // DB COMM - Item List Importing --%>
        <%-- [SOO] News List --%>
        <%-- [SOO] News Header --%>
        <div id="section-head" class="mt-5 mb-3 d-flex justify-content-between">
            <div id="section-title-box" class="d-flex align-items-center">
                <img id="section-img" src="/img/logo/G9_Logo.png" alt="" style="height: 30px;">
                <span id="section-title" class="fs-4">&nbsp;News</span>
            </div>
            <a href="/board" class="text-decoration-none text-secondary">더보기 &gt;</a>
        </div>
        <%-- [SOO] News Items --%>
        <div id="section-body">
            <div class="row">
                <div class="col col-12 col-md-4">
                    <div class="card" style="width: 18rem;">
                        <img src="..." class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the
                                bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
                <div class="col col-12 col-md-4">
                    <div class="card" style="width: 18rem;">
                        <img src="..." class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the
                                bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
                <div class="col col-12 col-md-4">
                    <div class="card" style="width: 18rem;">
                        <img src="..." class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the
                                bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%-- [SOO] TODO // DB COMM - News List Importing --%>
    </div>
    <%-- [SOO] IMG Banner - About Us Page --%>
    <div id="main-img-box">
        <img src="/img/bg/banner1.png" alt="banner" class="w-100 my-5" id="main-img">
        <div id="main-text">
            <div class="fw-bold fs-5">About Earth Workshop</div>
            <div class="mt-1">
                <img src="/img/logo/G9_Logo_White.png" alt="" class="w-25">
            </div>
            <span class="py-4">
                <a href="/aboutus" class="text-white border border-2 p-2 bg-black bg-opacity-75">더 알아보기</a>
            </span>
        </div>
    </div>
    <%-- [SOO] Footer Include --%>
    <%@ include file="/WEB-INF/view/user/common/footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>

</html>