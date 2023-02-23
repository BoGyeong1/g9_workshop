<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="d-flex flex-column flex-shrink-0 p-3" style="width: 15%;">
    <a href="/shop/WHOLE" class="nav-link link-dark text-decoration-none w-100 mb-2" id="${currentPage == 'WHOLE' ? 'currentPage' :  '' }">
        <div class="fs-4">WHOLE</div>
    </a>
    <a href="/shop/SALE" class="nav-link link-dark text-decoration-none w-100" id="${currentPage == 'SALE' ? 'currentPage' :  '' }">
        <div class="fs-4">SALE</div>
    </a>
    <hr>
    <div class="fs-4 mb-2">By Category</div>
    <ul class="nav nav-pills flex-column">
        <c:forEach var="category" items="${categories}" varStatus="status">
            <li class="nav-item fs-5">
                <a href="/shop/${category.CATEGORY_NAME}" class="nav-link link-dark text-decoration-none w-100" id="${currentPage == category.CATEGORY_NAME ? 'currentPage' :  '' }">
                    ${category.CATEGORY_NAME}
                </a>
            </li>
        </c:forEach>
    </ul>
    <hr>
    <div class="fs-4 mb-2">By Usage</div>
    <ul class="nav nav-pills flex-column">
        <c:forEach var="purpose" items="${purposes}" varStatus="status">
            <li class="nav-item fs-5">
                <a href="/shop/${purpose.PURPOSE_NAME}" class="nav-link link-dark text-decoration-none w-100" id="${currentPage == purpose.PURPOSE_NAME ? 'currentPage' :  '' }">
                    ${purpose.PURPOSE_NAME}
                </a>
            </li>
        </c:forEach>
    </ul>
</div>