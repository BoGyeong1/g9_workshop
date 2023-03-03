<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="flex-shrink-0 p-3" style="width: 10%; height: 100%;">
    <ul class="list-unstyled ps-0">
        <hr>
            <li class="mb-1">
                <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse"
                    data-bs-target="#user-collapse" aria-expanded="false">
                    <i class="bi bi-person"></i> 회원관리
                </button>
                <div class="collapse" id="user-collapse" style="">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1">
                        <li><a href="/admin/member/listPagination/1" class="btn link-dark rounded text-decoration-none">회원현황</a></li>
                        <li><a href="/admin/member/adminList" class="btn link-dark rounded text-decoration-none">Admin 관리</a></li>
                    </ul>
                </div>
            </li>
        <hr>
            <li class="mb-1">
                <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse"
                    data-bs-target="#product-collapse" aria-expanded="false">
                    <i class="bi bi-bag"></i> 상품관리
                </button>
                <div class="collapse" id="product-collapse" style="">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1">
                        <li><a href="/admin/product/list" class="btn link-dark rounded text-decoration-none">상품현황</a></li>
                        <li><a href="#" class="btn link-dark rounded text-decoration-none">품절현황</a></li>
                        <li><a href="#" class="btn link-dark rounded text-decoration-none">리뷰현황</a></li>
                        <li><a href="#" class="btn link-dark rounded text-decoration-none">카테고리관리</a></li>
                    </ul>
                </div>
            </li>
        <hr>
            <li class="mb-1">
                <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse"
                    data-bs-target="#order-collapse" aria-expanded="false">
                    <i class="bi bi-list-check"></i> 주문관리
                </button>
                <div class="collapse" id="order-collapse" style="">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1">
                        <li><a href="/admin/order/orderList/1" class="btn link-dark rounded text-decoration-none">주문현황</a></li>
                        <li><a href="#" class="btn link-dark rounded text-decoration-none">배송현황</a></li>
                        <li><a href="#" class="btn link-dark rounded text-decoration-none">취소관리</a></li>
                        <li><a href="#" class="btn link-dark rounded text-decoration-none">교환관리</a></li>
                    </ul>
                </div>
            </li>
        <hr>
            <li class="mb-1">
                <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse"
                    data-bs-target="#cs-collapse" aria-expanded="false">
                    <i class="bi bi-headset"></i> 고객센터
                </button>
                <div class="collapse" id="cs-collapse" style="">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1">
                        <li><a href="#" class="btn link-dark rounded text-decoration-none">문의현황</a></li>
                        <li><a href="#" class="btn link-dark rounded text-decoration-none">응답 필요 문의</a></li>
                        <li><a href="#" class="btn link-dark rounded text-decoration-none">FAQ</a></li>
                    </ul>
                </div>
            </li>
        <hr>
            <li class="mb-1">
                <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse"
                    data-bs-target="#web-collapse" aria-expanded="false">
                    <i class="bi bi-globe"></i> 사이트관리
                </button>
                <div class="collapse" id="web-collapse" style="">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1">
                        <li><a href="/admin/board" class="btn link-dark rounded text-decoration-none">게시판 관리</a></li>
                        <li><a href="/admin/event" class="btn link-dark rounded text-decoration-none">이벤트 관리</a></li>
                    </ul>
                </div>
            </li>
        <hr>
            <li class="mb-1">
                <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse"
                    data-bs-target="#sales-collapse" aria-expanded="false">
                    <i class="bi bi-coin"></i> 매출관리
                </button>
                <div class="collapse" id="sales-collapse" style="">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1">
                        <li><a href="#" class="btn link-dark rounded text-decoration-none">매출현황</a></li>
                    </ul>
                </div>
            </li>
        <hr>
    </ul>
</div>