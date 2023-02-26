<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>




 <div class="topArea row d-flex justify-content-center align-content-center">
    <div class="mypagelogo col-1 "><a href="/mypage/orderlist" class="fs-3"style="color:white;">마이페이지</a></div>
        <div class="col-10 titleBorder">
            <div class="row">
                <div class="name col-9 mt-4">
                ${userName}
                    <div>
                        <div class="fs-6 ms-1 mt-1"> 잔여 포인트 : ${point} </div>
                    </div>
                </div>
              <div class="review col-3 mt-4">
                <a href="/mypage/reviewlist">
                    <p class="text-center fs-5 fw-bold" style="color: black">상품리뷰</p>
                    <div class="text-center">1 개</div>
                </a>
              </div>
            </div>

    </div>
</div>