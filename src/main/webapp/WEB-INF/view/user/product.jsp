<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
        crossorigin="anonymous">
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/css/shop.css">
    <title>EarthWorkshop - Shop</title>
</head>

<body>
    <%-- [SOO] Header Include --%>
    <%@ include file="/WEB-INF/view/user/common/header.jsp" %>
    <div class="container mb-5">
        <div class="d-flex justify-content-between">
            <div class="w-100 m-5" id="product-img-box">
                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 5"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active" data-bs-interval="2000">
                            <img src="/img/shop/prod_sample_img1.jpg" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item" data-bs-interval="2000">
                            <img src="/img/shop/prod_sample_img2.jpg" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item" data-bs-interval="2000">
                            <img src="/img/shop/prod_sample_img3.jpg" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item" data-bs-interval="2000">
                            <img src="/img/shop/prod_sample_img4.jpg" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item" data-bs-interval="2000">
                            <img src="/img/shop/prod_sample_img5.jpg" class="d-block w-100" alt="...">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button"
                        data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button"
                        data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
            <div class="w-100 m-5 d-flex align-content-between flex-wrap" id="product-info-box">
                <div id="product-top-info">
                    <div class="fw-bold">밀키파우치 업사이클링 DIY 키트</div>
                    <div class="fw-bold text-success">14,300원</div>
                    <hr>
                    <div class="text-secondary">실제 우유팩을 인쇄하는 과정에서 발생하는 파지를 새활용한 소재로 카드, 명함, 현금 등을 담을 수 있는 미니 월렛을 만들어요!</div>
                    <br>
                    <div class="text-secondary"><b>원산지</b>&nbsp;대한민국</div>
                    <div class="text-secondary"><b>브랜드</b>&nbsp;지구공방</div>
                    <div class="text-secondary"><b>구매혜택</b>&nbsp;1% 적립(143원)</div>
                    <div class="text-secondary"><b>배송방법</b>&nbsp;택배</div>
                    <div class="text-secondary"><b>배송비</b>&nbsp;3,000원 (50,000원 이상 무료배송)</div>
                </div>
                <div id="product-bottom-info">
                    <div class="my-3 bg-light">
                        <div class="pt-2 ps-2">수량</div>
                        <hr class="mx-2">
                        <div class="d-flex justify-content-between pb-2">
                            <div class="ps-2 d-flex justify-content-start">
                                <button onclick="count('plus')" class="btn btn-success">
                                    <i class="bi bi-plus"></i>
                                </button>
                                <input type="text" value="1" id="cnt" class="form-control w-25 mx-1">
                                <button onclick="count('minus')" class="btn btn-success">
                                    <i class="bi bi-dash-lg"></i>
                                </button>
                            </div>
                            <div class="pe-2 text-success fw-bold">
                                <span class="align-middle">총 상품 금액 14,300원</span>
                            </div>
                        </div>
                    </div>
                    <form class="d-flex justify-content-between">
                        <input class="btn btn-success col-5" type="submit" value="장바구니" formaction="/cart">
                        <input class="btn btn-outline-success col-5" type="submit" value="구매하기" formaction="/buy">
                        <input class="btn btn-outline-success col-1" type="submit" value="♡" formaction="/like">
                    </form>
                </div>
            </div>
        </div>
        <hr>
        <div id="produt-detail-box" class="w-75 m-auto">
            <img src="/img/shop/prod_sample_detail_1.jpg" class="d-block w-100" alt="...">
            <img src="/img/shop/prod_sample_detail_2.jpg" class="d-block w-100" alt="...">
            <img src="/img/shop/prod_sample_detail_3.jpg" class="d-block w-100" alt="...">
            <img src="/img/shop/prod_sample_detail_4.jpg" class="d-block w-100" alt="...">
            <img src="/img/shop/prod_sample_detail_5.jpg" class="d-block w-100" alt="...">
        </div>
        <div id="produt-delivery-box" class="w-75 m-auto">
            <hr>
            <div class="fw-bold">배송정보</div>
            <ul class="mt-2">
                <li>모든 제품의 배송은 Plastic Free 원칙으로 종이재질로 발송됩니다.</li>
                <li>수령하신 택배박스는 운송장을 제거한 후 종이로 분리배출 해주세요.</li>
                <li>결제완료 후 제품을 수령하시기까지 약 2~5일 소요됩니다.</li>
                <li>배송이 늦어지거나 일부 제품이 품절인 경우 개별적으로 연락을 드리겠습니다.</li>
                <li>50,000원 이상 주문 건의 경우 무료배송됩니다.</li>
            </ul>
        </div>
        <div id="produt-order-box" class="w-75 m-auto">
            <hr>
            <div class="fw-bold">교환/환불/AS안내</div>
            <ul class="mt-2">
                <li>구매자의 단순 변심에 의한 반푸 및 교환 요청은 제품 수령 후 7일 이내에 가능합니다.</li>
                <li>교환 또는 반품을 원하시는 경우 고객센터로 문의 부탁드립니다.</li>
                <li>제품을 개봉하였거나 사용하셨을 경우 교환 및 반품이 불가합니다.</li>
                <li>제품 하자에 의한 교환 및 환불은 가능합니다.</li>
            </ul>
        </div>
        <div id="produt-review-box" class="w-75 m-auto">
            <hr>
            <div class="fw-bold">구매평</div>
            <hr>
            <div id="review-box" class="d-flex justify-content-between">
                <div id="review-box-left">
                    <div class="m-2" id="star-rating-box">
                        <i class="bi bi-star-fill text-danger"></i>
                        <i class="bi bi-star-fill text-danger"></i>
                        <i class="bi bi-star-fill text-danger"></i>
                        <i class="bi bi-star-fill text-danger"></i>
                        <i class="bi bi-star-fill text-danger"></i>
                    </div>
                    <div class="m-2" id="review-text-box">
                        귀여워요
                    </div>
                </div>
                <div id="review-box-right">
                    <div class="m-2 text-end" id="date">
                        2023-02-28 07:51
                    </div>
                    <div class="m-2 text-end" id="writer">
                        잗우
                    </div>
                </div>
            </div>
            <hr>
            <div id="review-box" class="d-flex justify-content-between">
                <div id="review-box-left">
                    <div class="m-2" id="star-rating-box">
                        <i class="bi bi-star-fill text-danger"></i>
                        <i class="bi bi-star-fill text-danger"></i>
                        <i class="bi bi-star-fill text-danger"></i>
                        <i class="bi bi-star-fill text-danger"></i>
                        <i class="bi bi-star-fill text-danger"></i>
                    </div>
                    <div class="m-2" id="review-text-box">
                        귀여워요
                    </div>
                </div>
                <div id="review-box-right">
                    <div class="m-2 text-end" id="date">
                        2023-02-28 07:51
                    </div>
                    <div class="m-2 text-end" id="writer">
                        잗우
                    </div>
                </div>
            </div>
            <hr>
            <div id="review-box" class="d-flex justify-content-between">
                <div id="review-box-left">
                    <div class="m-2" id="star-rating-box">
                        <i class="bi bi-star-fill text-danger"></i>
                        <i class="bi bi-star-fill text-danger"></i>
                        <i class="bi bi-star-fill text-danger"></i>
                        <i class="bi bi-star-fill text-danger"></i>
                        <i class="bi bi-star-fill text-danger"></i>
                    </div>
                    <div class="m-2" id="review-text-box">
                        귀여워요
                    </div>
                </div>
                <div id="revidivew-box-right">
                    <div class="m-2 text-end" id="date">
                        2023-02-28 07:51
                    </div>
                    <div class="m-2 text-end" id="writer">
                        잗우
                    </div>
                </div>
            </div>
        </div>
        <div id="produt-inquery-box" class="w-75 m-auto">
            <hr>
            <div class="fw-bold">상품문의</div>
            <hr>
            <div id="inquery-box" class="d-flex justify-content-between">
                <div id="inquery-box-left" class="w-75">
                    <div class="m-2" id="inquery-text-box">
                        문의내용
                    </div>
                    <div class="m-2 bg-light" id="inquery-text-box">
                        답변내용
                    </div>
                </div>
                <div id="inquery-box-right">
                    <div class="m-2 text-end" id="date">
                        2023-02-28 07:51
                    </div>
                    <div class="m-2 text-end" id="writer">
                        잗우
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- [SOO] Footer Include --%>
    <%@ include file="/WEB-INF/view/user/common/footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="/js/product.js"></script>
</body>

</html>