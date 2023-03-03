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
    <link rel="stylesheet" href="./css/style.css">
    <title>g9 - Cart</title>

<body>
    <%-- header --%>
    <%@ include file="/WEB-INF/view/user/common/header.jsp" %>
    <!-- main  -->
    <div class="container py-5">
        <div class="text-center display-6 fw-bold mb-5"><i class="bi bi-cart "></i> 장바구니</div>
        <table class="table">
            <thead>
                <tr class="text-center align-middle">
                    <th scope="col">상품정보 </th>
                    <th scope="col">수량</th>
                    <th scope="col">총금액</th>
                    <th scope="col">삭제</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${cartList}" var="item" varStatus="status">
                <tr class="text-center align-middle">
                    <td class="w-50 text-start">
                        <img src="/${item.DIRECTORY_NAME}${item.PHYSICAL_FILE_NAME}" class="w-25">
                        ${item.PRODUCT_NAME}
                    </td>
                    <td>${item.QUANTITY}</td>
                    <c:if test="${item.DISCOUNT_RATE > 0}">
                    <td>
                        <div class="text-secondary">
                            <del>
                                <fmt:formatNumber value="${item.PRICE * item.QUANTITY}" pattern="#,###" />원
                            </del>
                        </div>
                        <div>
                            <fmt:formatNumber value="${item.PRICE * (100 - item.DISCOUNT_RATE) / 100 * item.QUANTITY}" pattern="#,###" />원
                        </div>
                    </td>
                    </c:if>
                    <c:if test="${item.DISCOUNT_RATE == 0}">
                    <td>
                        <div>
                            <fmt:formatNumber value="${item.PRICE * item.QUANTITY}" pattern="#,###" />원
                        </div>
                    </td>
                    </c:if>
                    <td>
                        <form action="/cart/delete" method="post">
                        <c:if test="${item.DISCOUNT_RATE > 0}">
                            <input type="hidden" id="price" name="price" value="${item.PRICE * (100 - item.DISCOUNT_RATE) / 100 * item.QUANTITY}">
                        </c:if>
                        <c:if test="${item.DISCOUNT_RATE == 0}">
                            <input type="hidden" id="price" name="price" value="${item.PRICE * item.QUANTITY}">
                        </c:if>
                            <input type="hidden" id="cart-uid" name="cart-uid" value="${item.CART_UID}">
                            <button class="btn btn-danger" type="submit">삭제</button>
                        </form>
                    </td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="text-end">
            <span>상품 금액 : </span><span id="totalPrice"></span>
            <span>+ 배송비 : </span><span id="deliveryCharge"></span>
            <span class="text-success fw-bold">결제 예상 금액 : </span><span id="pay" class="text-success fw-bold"></span>
        </div>
        <div class="text-end my-3">
            <a href="/shop/WHOLE" class="btn btn-outline-success">
                계속 쇼핑하기
            </a>
            <a href="/order" class="btn btn-success">
                이대로 구매하기
            </a>
        </div>
    </div>

    <%-- Footer Include --%>
    <%@ include file="/WEB-INF/view/user/common/footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
    <script src="/js/cart.js"></script>
</body>

</html>