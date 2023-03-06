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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="/js/order.js"></script>
        <title>g9 - Cart</title>
    </head>

    <body>
        <%-- header --%>
        <%@ include file="/WEB-INF/view/user/common/header.jsp" %>

        <div class="container py-5 w-50">

            <%-- 타이틀 --%>
            <div class="text-center display-6 fw-bold mb-5"><i class="bi bi-receipt"></i> 주문하기</div>

            <%-- 상품 정보들 --%>
            <table class="table">
                <thead>
                    <tr class="text-center align-middle">
                        <th scope="col">상품정보 </th>
                        <th scope="col">수량</th>
                        <th scope="col">총금액</th>
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
                                <div id="priceTarget" style="display:none;">${item.PRICE * (100 - item.DISCOUNT_RATE) / 100 * item.QUANTITY}</div>
                            </div>
                        </td>
                        </c:if>
                        <c:if test="${item.DISCOUNT_RATE == 0}">
                        <td>
                            <div>
                                <fmt:formatNumber value="${item.PRICE * item.QUANTITY}" pattern="#,###" />원
                                <div id="priceTarget" style="display:none;">${item.PRICE * item.QUANTITY}</div>
                            </div>
                        </td>
                        </c:if>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            <hr>
            <form method="post" action="/order">
                <%-- 배송지정보 --%>
                <div>
                    <div class="fs-4 my-3"><i class="bi bi-truck"></i> 배송지정보</div>
                    <%-- 배송지선택 --%>
                    <div class="my-3">
                        <div class="fw-bold">배송지 선택</div>
                        <div class="d-flex justify-content-start">
                            <c:forEach items="${addressList}" var="address" varStatus="status">
                            <span class="form-check m-2">
                                <input class="form-check-input" type="radio" name="address-uid" id="address${status.index}" value="${address.ADDRESS_UID}" ${status.index == 0 ? 'checked' : ''} onclick="getAddressDetail()">
                                <label class="form-check-label" for="address${status.index}">
                                    ${address.ADDRESS_NAME}
                                </label>
                            </span>
                            </c:forEach>
                            <span class="form-check m-2">
                                <input class="form-check-input" type="radio" name="address-uid" id="address" value="self" onclick="getAddressDetail()">
                                <label class="form-check-label" for="address">
                                    직접입력
                                </label>
                            </span>
                            <span>
                                <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                                    주소 추가
                                </button>
                            </span>
                        </div>
                        <div class="my-3 row">
                            <div class="col-md-3">
                                <label class="form-label" for="input-zipcode">우편번호</label>
                                <input type="text" class="form-control" id="input-zipcode" name="zipcode" readonly onclick="execDaumPostcode()">
                            </div>
                            <div class="col-md-5">
                                <label class="form-label" for="input-address">주소</label>
                                <input type="text" class="form-control" id="input-address" name="address" readonly onclick="execDaumPostcode()">
                            </div>
                            <div class="col-md-4">
                                <label class="form-label" for="input-detail">상세주소</label>
                                <input type="text" class="form-control" id="input-detail" name="detail" readonly>
                            </div>
                        </div>
                    </div>
                    <%-- 배송장소선택 --%>
                    <div class="my-3">
                        <div class="fw-bold">배송장소 선택</div>
                        <div class="d-flex justify-content-start">
                            <c:forEach items="${deliveryLocations}" var="location" varStatus="status">
                            <span class="form-check m-2">
                                <input class="form-check-input" type="radio" name="delivery-location-uid" id="delivery-location${status.index}" value="${location.DELIVERY_LOCATION_UID}" ${status.index == 0 ? 'checked' : ''} onclick="deliveryLocationSelfCheck()">
                                <label class="form-check-label" for="delivery-location${status.index}">
                                    ${location.DELIVERY_LOCATION}
                                </label>
                            </span>
                            </c:forEach>
                            <span class="form-check m-2">
                                <input class="form-check-input" type="radio" name="delivery-location-uid" id="delivery-location" value="self" onclick="deliveryLocationSelfCheck()">
                                <label class="form-check-label" for="delivery-location">
                                    직접입력
                                </label>
                            </span>
                        </div>
                        <input type="text" name="delivery-location-self" id="delivery-location-self" style="display: none;" class="form-control">
                    </div>
                    <%-- 수령인 정보 --%>
                    <div class="my-3">
                        <div class="fw-bold">수령인 정보</div>
                        <div class="my-3 row">
                            <div class="col-md-3">
                                <label class="form-label" for="recipient_name">성함</label>
                                <input type="text" class="form-control" id="recipient_name" name="recipient_name" required>
                            </div>
                            <div class="col-md-5">
                                <label class="form-label" for="recipient_tel">연락처</label>
                                <input type="text" class="form-control" id="recipient_tel" name="recipient_tel" required>
                            </div>
                        </div>
                    </div>
                </div>
                <%-- 결제 --%>
                <div>
                    <div class="fs-4 my-3"><i class="bi bi-wallet"></i> 결제정보</div>
                    <div class="my-3">
                        <div class="fw-bold">결제수단 선택</div>
                        <div class="d-flex justify-content-start">
                            <c:forEach items="${paymentMethodList}" var="paymentMethod" varStatus="status">
                            <span class="form-check m-2">
                                <input class="form-check-input" type="radio" name="paymentMethod-uid" id="paymentMethod${status.index}" value="${paymentMethod.PAYMENT_METHOD_UID}" ${status.index == 0 ? 'checked' : ''}>
                                <label class="form-check-label" for="paymentMethod${status.index}">
                                    ${paymentMethod.PAYMENT_METHOD}
                                </label>
                            </span>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="my-3">
                        <div class="fw-bold my-3">결제 금액 확인</div>
                        <div>
                            <span>상품 금액 : </span><span id="printProductPrice"></span>
                        </div>
                        <div>
                            <span>배달비 : </span><span id="printDeliveryPrice"></span>
                        </div>
                        <div>
                            <span>포인트 : </span><span id="printPointPrice">0</span>
                        </div>
                        <div>
                            <span>총 금액 : </span><span id="printTotalPrice"></span>
                            <input type="hidden" id="payPrice" name="payPrice" value="">
                        </div>
                        <div class="row my-3">
                            <div class="col-md-3">
                                <label class="form-label" for="point-use">사용할 포인트</label>
                                <input type="text" class="form-control" id="point-use" name="point-use" value="0">
                                <small>사용가능 포인트 : </small><small id="pointBalance">${userPoint.POINT}</small>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" required>
                    <label class="form-check-label" for="flexCheckDefault">
                        주문 내용을 확인하였으며, 정보 제공 등에 동의합니다.
                    </label>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-success my-3 w-25">결제하기</button>
                </div>
            </form>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">주소등록</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form method="post" action="/order/add/address">
                        <div class="modal-body">
                            <div class="col">
                                <label class="form-label" for="address-name">주소별명</label>
                                <input type="text" class="form-control" id="address-name" name="address-name" required>
                            </div>
                            <div class="my-3 row">
                                <div class="col-md-3">
                                    <label class="form-label" for="input-zipcode">우편번호</label>
                                    <input type="text" class="form-control" id="input-zipcode-modal" name="zipcode" readonly onclick="execDaumPostcodeModal()">
                                </div>
                                <div class="col-md-9">
                                    <label class="form-label" for="input-address">주소</label>
                                    <input type="text" class="form-control" id="input-address-modal" name="address" readonly onclick="execDaumPostcodeModal()">
                                </div>
                            </div>
                            <div class="col">
                                <label class="form-label" for="input-detail">상세주소</label>
                                <input type="text" class="form-control" id="input-detail-modal" name="detail">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-success" data-bs-dismiss="modal">닫기</button>
                            <button type="submit" class="btn btn-success">추가하기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <%-- Footer Include --%>
        <%@ include file="/WEB-INF/view/user/common/footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script src="/js/order.js"></script>
    </body>

</html>