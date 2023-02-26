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
            <div id="search-form">
                <form action="/admin/product/" method="post">
                    <div class="d-flex justify-content-center">
                        <select class="form-select w-25 mx-2" name="filter" id="filter">
                            <option value="name">상품명</option>
                            <option value="category">소재</option>
                            <option value="purpose">용도</option>
                        </select>
                        <input class="form-control w-25 mx-2" type="text" name="word" id="word">
                        <button type="submit" class="btn btn-outline-dark mx-2">검색</button>
                        <a href="/admin/product/insert" class="btn btn-primary">
                            신규 상품 등록
                        </a>
                    </div>
                </form>
            </div>
            <div class="my-3">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>상품명</th>
                            <th>카테고리</th>
                            <th>용도</th>
                            <th>가격</th>
                            <th>할인율</th>
                            <th>재고</th>
                            <th>노출여부</th>
                            <th>수정</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${productInfos}" var="info" varStatus="status">
                            <tr class="align-middle">
                                <td>${info.PRODUCT_NAME}</td>
                                <td>${info.CATEGORY_NAME}</td>
                                <td>${info.PURPOSE_NAME}</td>
                                <td>${info.PRICE}</td>
                                <td>${info.DISCOUNT_RATE}</td>
                                <td>${info.STOCK}</td>
                                <td>${info.EXPOSURE}</td>
                                <td>
                                    <form action="/admin/product/edit" method="post">
                                        <input type="hidden" value="${info.PRODUCT_UID}">
                                        <button type="submit" class="btn btn-primary">수정하기</button>
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