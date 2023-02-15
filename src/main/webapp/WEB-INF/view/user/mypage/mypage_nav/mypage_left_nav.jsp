<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>



    <div class="leftMenu">
          <ul>
            <li>
              <span class="menuTitle">쇼핑내역</span>
              <ul >
                <li ><a class="subTitle" href="/mypage/orderlist">주문/배송내역</a></li>
                <li><a class="subTitle" href="/mypage/cancelApplicationList">취소/반품/교환 신청</a></li>
                <li><a class="subTitle" href="/mypage/canRefExcList">취소/반품/교환 내역</a></li>
              </ul>
            </li>
            <li>
              <span class="menuTitle">나의활동</span>
              <ul>
                <li><a class="subTitle" href="/mypage/reviewlist">상품리뷰</a></li>
                <li><a class="subTitle" href="/mypage/inquiryList">1:1문의</a></li>
                <li><a class="subTitle" href="/mypage/favorite">위시리스트</a></li>
              </ul>
            </li>
            <li>
              <span class="menuTitle">회원정보</span>
              <ul>
                <li><a class="subTitle" href="#">회원등급</a></li>
                <li><a class="subTitle" href="/mypage/changeUserInfo">회원정보 변경</a></li>
                <li><a class="subTitle" href="/mypage/withdraw">회원탈퇴</a></li>
              </ul>
            </li>
        </ul>
    </div>