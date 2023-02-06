<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="d-flex flex-column flex-shrink-0 p-3" style="width: 15%;">
    <a href="/shop/whole" class="nav-link link-dark text-decoration-none w-100 mb-2" id="${currentPage == 'whole' ? 'currentPage' :  '' }">
        <div class="fs-4">WHOLE</div>
    </a>
    <a href="/shop/sale" class="nav-link link-dark text-decoration-none w-100" id="${currentPage == 'sale' ? 'currentPage' :  '' }">
        <div class="fs-4">SALE</div>
    </a>
    <hr>
    <div class="fs-4 mb-2">By Category</div>
    <ul class="nav nav-pills flex-column mb-auto">
        <li class="nav-item fs-5">
            <a href="/shop/papper" class="nav-link link-dark text-decoration-none w-100" id="${currentPage == 'papper' ? 'currentPage' :  '' }">
                PAPPER
            </a>
        </li>
        <li class="nav-item fs-5">
            <a href="/shop/fabric" class="nav-link link-dark text-decoration-none w-100" id="${currentPage == 'fabric' ? 'currentPage' :  '' }">
                FABRIC
            </a>
        </li>
        <li class="nav-item fs-5">
            <a href="/shop/plastic" class="nav-link link-dark text-decoration-none w-100" id="${currentPage == 'plastic' ? 'currentPage' :  '' }">
                PLASTIC
            </a>
        </li>
        <li class="nav-item fs-5">
            <a href="/shop/glass" class="nav-link link-dark text-decoration-none w-100" id="${currentPage == 'glass' ? 'currentPage' :  '' }">
                GLASS
            </a>
        </li>
        <li class="nav-item fs-5">
            <a href="/shop/categoryetc" class="nav-link link-dark text-decoration-none w-100" id="${currentPage == 'categoryetc' ? 'currentPage' :  '' }">
                ETC
            </a>
        </li>
    </ul>
    <hr>
    <div class="fs-4 mb-2">By Usage</div>
    <ul class="nav nav-pills flex-column mb-auto">
        <li class="nav-item fs-5">
            <a href="/shop/clothes" class="nav-link link-dark text-decoration-none w-100" id="${currentPage == 'clothes' ? 'currentPage' :  '' }">
                CLOTHES
            </a>
        </li>
        <li class="nav-item fs-5">
            <a href="/shop/living" class="nav-link link-dark text-decoration-none w-100" id="${currentPage == 'living' ? 'currentPage' :  '' }">
                LIVING
            </a>
        </li>
        <li class="nav-item fs-5">
            <a href="/shop/kitchen" class="nav-link link-dark text-decoration-none w-100" id="${currentPage == 'kitchen' ? 'currentPage' :  '' }">
                KITCHEN
            </a>
        </li>
        <li class="nav-item fs-5">
            <a href="/shop/stationery" class="nav-link link-dark text-decoration-none w-100" id="${currentPage == 'stationery' ? 'currentPage' :  '' }">
                STATIONERY
            </a>
        </li>
        <li class="nav-item fs-5">
            <a href="/shop/accessories" class="nav-link link-dark text-decoration-none w-100" id="${currentPage == 'accessories' ? 'currentPage' :  '' }">
                ACCESSORIES
            </a>
        </li>
        <li class="nav-item fs-5">
            <a href="/shop/useageetc" class="nav-link link-dark text-decoration-none w-100" id="${currentPage == 'useageetc' ? 'currentPage' :  '' }">
                ETC
            </a>
        </li>
    </ul>
</div>