<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

      
      
      
      <header>
      <nav class="nav-justified">
        <div class="container">
          <div id="img-container" class="row">
          <span class="d-flex align-items-end col-lg-9 col-md-12 " >
            <a href="/home" class="navbar-brand">
              <img
                src="/img/logo/G9_Logo_Black.png"
                alt="g9_logo"
                style="width: 15vw; margin-top:2vw; margin-right:2vw"
              />
            </a>
            <form action="">
              <input
                type="search"
                id="search"
                name="search"
                class="border-top-0 border-start-0 border-end-0 border-dark"
              />
              <button type="submit" class="border-0 bg-white">
                <i class="bi bi-search fs-4"></i>
              </button>
            </form>
            </span>
       
          <span id="top-nav" class="d-flex justify-content-end  col-lg-3 col-md-12"
           style="margin-top:3.4vw;">
            <span class="text-end my-1">
              <a
                class="text-decoration-none text-secondary"
                href="/login"
                >로그인</a
              >
              <span class="text-secondary">|</span>
              <a
                class="text-decoration-none text-secondary"
                href="/selectSignup"
                >회원가입</a
              >
              <span class="text-secondary">|</span>
              <a class="text-decoration-none text-secondary" href=""
                >고객센터</a
              >
            </span>
          </span>
        </div>
      </nav>
      <hr />
      </header>