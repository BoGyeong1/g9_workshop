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
    <main>
        <div class="container p-5" style="height: 650px;">
            <div class="text-center display-6 fw-bold mb-5"><i class="bi bi-cart "></i>장바구니</div>
            <table class="table">
                <thead>
                    <tr class="text-center">
                        <th scope="col">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="">
                                <label class="form-check-label" for="">
                                </label>
                        </th>
                        <th scope="col" colspan="2">상품정보 </th>
                        <th scope="col">상품금액</th>
                        <th scope="col">배송비</th>
                        <th scope="col"> </th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="m-2">
                        <td>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="">
                                <label class="form-check-label" for="">
                                </label>
                        </td>
                        <td style=" width: 16px; ">
                            <div><img src="/docs/img/item/item5.png" alt="상품5" width="200px">
                            </div>

                            </a>
        </div>
        </td>

        <!--상품정보 -->
        <td class="align-middle">
            <div>
                <div class="m-2">
                    <!-- 상품명  -->
                    <div>
                        <a href="#" style="color: black; text-decoration: none;">친환경 물통</a>
                    </div>

                    <!-- 상품옵션  -->
                    <div class="text-secondary">
                        우드 / M / 친환경
                        <!-- 옵션변경 버튼 -->
                        <div class="btn-group">
                            <button type="button" class="btn btn-outline-dark btn-sm dropdown-toggle"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                옵션변경
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">흰색 / M / 친환경</a></li>
                                <li><a class="dropdown-item" href="#">검정색 / M / 친환경</a></li>
                                <li><a class="dropdown-item" href="#">노랑색 / M / 친환경</a></li>
                                <li><a class="dropdown-item" href="#">우드 / M / 친환경</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- 수량  -->
                <div class="m-1">
                    <label for="cartNum" class="form-label"></label>
                    <select class="form-select-sm" name="cartNum" id="cartNum" style="width: 96px;">
                        <option selected>1</option>
                        <option value="">2</option>
                        <option value="">3</option>
                        <option value="">4</option>
                        <option value="">5</option>
                        <option value="">6</option>
                        <option value="">7</option>
                    </select>

                    <!-- 도착예정 -->
                    <div style="font-size: 0.5rem;" class="m-1">
                        지금 결제 시 <strong>2/11(목)</strong> 도착예정
                    </div>
                </div>
        </td>

        <!-- 상품금액 & 배송비  -->
        <td class="align-middle">20,000원</td>
        <td class="align-middle">3,000원</td>

        <!-- 구매 & 삭제 버튼 -->
        <td class="align-middle">
            <button class="btn btn-dark ">구매</button>
            <button class="btn btn-outline-dark">삭제</button>
        </td>
        </tr>
        </tbody>
        </table>
        <!--장바구니 안내 텍스트  -->
        <div class="mb-2">
            <div style="font-size: 0.5rem; " class="m-1">쇼핑백에 담긴 상품은 30일 간 보관됩니다. 장기간 보관하시려면 위시리스트를 이용해주세요.</div>
            <div style="font-size: 0.5rem;" class="m-1">추가 할인 혜택은 주문서에서 사용 가능합니다.</div>
        </div>
        <!-- 주문 & 쇼핑 버튼  -->
        <div class="d-flex justify-content-center ">
            <form action="">
                <button class="btn btn-outline-dark me-2">계속 쇼핑하기</button>
            </form>
            <form action="">
                <button class="btn btn-dark ">주문하기</button>
            </form>
        </div>

        </div>

    </main>


  <%-- Footer Include --%>
    <%@ include file="/WEB-INF/view/user/common/footer.jsp" %>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>

</html>