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
    <link rel="stylesheet" href="/resources/css/main.css">
    <title>EarthWorkshop - About us</title>
</head>

<body>
    <%-- [SOO] Header Include --%>
    <%@ include file="./header.jsp" %>
    <%-- [SOO] Main Area --%>
    <div class="container fw-bold text-center">
        <div class="m-5">
            <div class="fs-3">
                지구공방
            </div>
            <div class="fs-3">
                Earth Workshop
            </div>
        </div>
        <div class="fs-5">
            지구공방은 지구와 더불어 살아가기 위한 <span class="text-success">업사이클링 라이프스타일 편집샵</span> 입니다.
        </div>
        <div class="m-5 d-flex justify-content-center">
            <img src="/resources/img/content/project.png" alt="project" class="">
        </div>
        <div class="m-5 fs-3">
            BRAND IDENTITY
        </div>
        <div class="m-5">
            <div class="fs-5">
                <span class="text-success">버려지는 자원의 새로운 변신</span>을 통해 아픈 지구를 구하고 상생하자는 새활용스토어가 '지구공방'의 브랜드 정체성입니다.
            </div>
            <div class="fs-5">
                '환경을 생각한 자원의 재조합'과 다양한 새활용 제품이 모여 지구공방이라는 플랫폼을 이루어 냅니다.
            </div>
            <div class="fs-5">
                이러한 의미와 지속 성장의 의미를 가진 ‘나이테’와 지구의 환경을 나타내는 '등고선'에서 형태적 모티브를 얻어 시각화했습니다.
            </div>
            <div class=m-3>
                <div class=m-2>
                    <img src="/resources/img/logo/G9_Logo_Black.png" alt="banner" class="w-50">
                </div>
                <div class=m-2>
                    <img src="/resources/img/logo/G9_Logo_Brown.png" alt="banner" class="w-50">
                </div>
                <div class=m-2>
                    <img src="/resources/img/logo/G9_Logo_Green.png" alt="banner" class="w-50">
                </div>
            </div>
        </div>
        <div class="m-5 fs-3">
            새활용이란?
        </div>
        <div class="m-5">
            <div class="fs-5">
                (업사이클링 Upcycling = 새활용)
            </div>
            <div class="fs-5">
                버려지는 자원에 디자인을 더하거나 활용방법을 바꿔 새로운 가치를 만들어내는 <span class="text-success">업사이클링(Upcycling)</span>의 우리말입니다.
            </div>
            <div class="fs-5">
                물건을 처음 만들 때부터 환경과 자연을 생각하며 쓸모가 없어진 후까지 고려하는 것부터
            </div>
            <div class="fs-5">
                물건을 가치 있게 오래도록 사용하게 의미를 담아서 만드는 것 까지
            </div>
            <div class="fs-5">
                새활용은 환경을 지키고 자원순환을 실천할 수 있는 새로운 방법입니다.
            </div>
        </div>
    </div>
    <%-- [SOO] IMG Banner - Project Page --%>
    <div id="main-img-box">
        <img src="/resources/img/bg/banner2.png" alt="banner" class="w-100 my-5" id="main-img">
        <div id="main-text">
            <div class="mt-3">
                <div class="fw-bold fs-5">새활용이 만들어낸 새로운 가치</div>
            </div>
            <span class="py-4">
                <a href="/shop/whole" class="text-white border border-2 p-2 bg-black bg-opacity-75">Shop 바로가기</a>
            </span>
        </div>
    </div>
    <%-- [SOO] Footer Include --%>
    <%@ include file="./footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>

</html>