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
    <link rel="stylesheet" href="/css/shop.css">
    <title>EarthWorkshop - Shop</title>
</head>

<body>
    <%-- [SOO] Header Include --%>
    <%@ include file="/WEB-INF/view/user/common/header.jsp" %>
    <div class="d-flex">
        <%-- [SOO] Shop Nav Include --%>
        <%@ include file="./shopnav.jsp" %>
        <%-- [SOO] Main Area --%>
        <div class="container w-100 mt-3">

            <div class="row mb-5">
                <c:forEach var="product" items="${productList}" varStatus="status">
                    <div class="col-md-3 col-12 mb-5">
                        <form action="/shop/product/detail" method="post">
                            <input type="hidden" name="product_uid" value="${product.PRODUCT_UID}">
                            <button type="submit" style="border: none; background: none;">
                                <div>
                                    <img src="/${product.DIRECTORY_NAME}thumbnail-1.jpg" class="card-img-top w-100 img-fluid" alt="..." style="height:400px; object-fit:cover;">
                                    <div class="text-start">${product.PRODUCT_NAME}</div>
                                    <div class="text-start">
                                    <c:if test="${product.DISCOUNT_RATE > 0}">
                                        <span class="text-danger">${product.DISCOUNT_RATE}% </span>
                                        <del class="text-secondary"><fmt:formatNumber value="${product.PRICE}" pattern="#,###" />원</del>
                                        <span> <fmt:formatNumber value="${product.PRICE * (100 - product.DISCOUNT_RATE) / 100}" pattern="#,###" />원</span></div>
                                    </c:if>
                                    <c:if test="${product.DISCOUNT_RATE == 0}">
                                        <span><fmt:formatNumber value="${product.PRICE}" pattern="#,###" />원</span></div>
                                    </c:if>
                                </div>
                            </button>
                        </form>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <%-- [SOO] Footer Include --%>
    <%@ include file="/WEB-INF/view/user/common/footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>

</html>