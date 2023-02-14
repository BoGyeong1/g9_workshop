<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<nav class="nav-justified">
    <div class="container">
        <div id="top-nav">
            <div class="text-end my-1">
                <a class="text-decoration-none text-secondary" href="/login">로그인</a>
                <span class="text-secondary">|</span>
                <a class="text-decoration-none text-secondary" href="/selectSignup">회원가입</a>
                <span class="text-secondary">|</span>
                <a class="text-decoration-none text-secondary" href="/cs">고객센터</a>
            </div>
        </div>
    </div>
    <hr>
    <div class="container">
        <div id="mid-nav">
            <div class="d-flex justify-content-between align-items-center">
                <div id="img-container" class="d-flex align-items-end">
                    <a href="/home" class="navbar-brand">
                        <img src="/img/logo/G9_Logo_Black.png" alt="g9_logo"
                            style="width: 15vw; margin-right: 1vw;">
                    </a>
                    <form action="/search">
                        <input type="search" id="search" name="search"
                            class="border-top-0 border-start-0 border-end-0 border-dark" required>
                        <button type="submit" class="border-0 bg-white">
                            <i class="bi bi-search fs-4"></i>
                        </button>
                    </form>
                </div>
                <div id="menu-container">
                    <a href="/mypage" class="text-decoration-none text-dark">
                        <i class="bi bi-person fs-5"></i>
                        <span>마이페이지</span>
                    </a>
                    <span>|</span>
                    <a href="/cart" class="text-decoration-none text-dark">
                        <i class="bi bi-cart fs-5"></i>
                        <span class="align-items-center">장바구니</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <hr>
    <div class="container d-flex justify-content-center">
        <a href="/aboutus" class="mx-3 text-decoration-none text-dark fw-bold">ABOUT US</a>
        <%-- [SOO] Spec Out --%>
        <%-- <a href="/project" class="mx-3 text-decoration-none text-dark fw-bold">PROJECT</a> --%>
        <a href="/shop/whole" class="mx-3 text-decoration-none text-dark fw-bold">SHOP</a>
        <a href="/event/ongoing" class="mx-3 text-decoration-none text-dark fw-bold">EVENT</a>
        <a href="/board" class="mx-3 text-decoration-none text-dark fw-bold">BOARD</a>
    </div>
    <hr>
</nav>