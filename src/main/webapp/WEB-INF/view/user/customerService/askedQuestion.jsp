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

    <style>
        a:link {
            color: black;
            background-color: transparent;
            text-decoration: none;
        }

        a:visited {
            color: black;
            background-color: transparent;
            text-decoration: none;
        }

        a:hover {
            color: black;
            background-color: transparent;
            text-decoration: underline;
        }

        a:active {
            color: black;
            background-color: transparent;
            text-decoration: underline;
        }

        .accordion-item .accordion-button {
            background-color: rgb(0, 0, 0);
            color: white;
        }
    </style>
    <title>g9 - Cart</title>

        <%-- header --%>
    <%@ include file="/WEB-INF/view/user/common/header.jsp" %>
<body>

    <!-- main  -->
    <main>
        <div class="container w-50">
            <div class="m-5">
                <div class="text-center display-6 fw-bold">고객센터</div>


            </div>

            <ul class="nav nav-pills nav-fill fw-bold ">

                <li class="nav-item">
                    <a class="nav-link " aria-current="page" href="#">FAQ</a>
                </li>


                <li class="nav-item">
                    <a class="nav-link " href="/docs/customerService/consultation.html">1:1 상담</a>
                </li>

            </ul>


            <div class="fs-4 text-success fw-bold text-center m-3">
                자주하는 질문 (FAQ)
            </div>
            <!-- FAQ검색창 -->
            <form class="d-flex justify-content-center mb-3">
                <input class="form-control me-2 w-25" type="search" placeholder="FAQ 검색" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">FAQ 검색</button>
            </form>

            <hr>

            <!-- FAQ -->
            <div class="accordion mb-5" id="accordionExample">

                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingOne">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                            배송기간은 어떻게 되나요?
                        </button>
                    </h2>
                    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne"
                        data-bs-parent="#accordionExample">
                        <div class="accordion-body">

                            결제 완료일(무통장은 입금확인일)로부터 2~3일 배송
                            기간이 소요됩니다. (단, 주말/공휴일 제외)

                            - 오프라인 매장과 동시 판매되고 있어 결제 완료 후
                            상품 발송이 늦어지거나 품절될 수 있습니다.
                            - 사이즈 구해드림 상품은 온라인에서 일시 품절된
                            상품의 재고를 구해드리는 서비스로 평균 배송이
                            3~7일 소요됩니다.
                            <br>
                            ※ 주문 상품 배송조회 방법
                            - 모바일: 마이페이지 > 주문목록 조회 >
                            주문/배송조회 > '배송조회'
                            - PC: 마이페이지 > 주문내역 전체보기 >
                            주문내역 진행상태 '배송조회'

                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingTwo">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            배송조회는 어떻게 해야 하나요?
                        </button>
                    </h2>
                    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
                        data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            마이페이지에서 배송조회를 하실 수 있습니다.
                            <br>
                            ※ 주문 상품 배송조회 방법
                            - 모바일: 마이페이지 > 주문목록 조회 >
                            주문/배송조회 > '배송조회'
                            - PC: 마이페이지 > 주문내역 전체보기 >
                            주문내역 진행상태 '배송조회'

                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingThree">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            주문한 상품을 아직 못 받았는데 '배송완료'로 조회됩니다. 어떻게 해야 하나요?
                        </button>
                    </h2>
                    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
                        data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            시스템 배송 상황과 실제 배송 상황이 간혹 일치하지
                            않는 경우가 발생하여 배송완료로 표시되는 경우가
                            있습니다. 위탁 장소에 보관되어 있는지 먼저 확인해
                            주시고 저녁까지도 상품을 받지 못하셨다면

                            고객센터(☎1544-1111) 또는 [고객센터 > 1:1 상담] 으로 문의해 주시기 바랍니다.
                        </div>
                    </div>
                </div>

                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingFour">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                            배송중에 배송지를 변경할 수 있나요?
                        </button>
                    </h2>
                    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour"
                        data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            주문 후에 배송지를 변경할 수 있는 단계는 아래와 같습니다.

                            배송준비중까지 '배송지' 변경 가능

                            고객센터(☎1544-1111) 또는 [고객센터 > 1:1 상담] 으로 문의해 주시기 바랍니다.
                        </div>
                    </div>
                </div>

                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingFive">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                            상품 여러 개를 한 번에 구매했는데 일부만 배송되었어요
                        </button>
                    </h2>
                    <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive"
                        data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            한 주문번호에 여러 상품을 함께 구매해도 발송지에
                            따라 각각 포장/발송되어 배송일이 다를 수 있습니다.
                            <br>
                            약속드린 배송일자에 모든 상품을 받지 못하셨다면
                            고객센터(☎1544-1111) 또는 [고객센터 > 1:1 상담/
                            실시간채팅]로 문의해 주시기 바랍니다.
                        </div>
                    </div>
                </div>

                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingsix">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#collapsesix" aria-expanded="false" aria-controls="collapsesix">
                            받는 사람이 여러명인데 배송지를 각각 입력할 수 있나요?
                        </button>
                    </h2>
                    <div id="collapsesix" class="accordion-collapse collapse" aria-labelledby="headingsix"
                        data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            한 주문(결제)건은 한 곳의 배송지로만 선택하여
                            주문하실 수 있습니다. 여러 곳의 배송지로 배송받길
                            원하시는 경우, 배송지별로 각각 주문/결제를 해주셔야 합니다.
                        </div>
                    </div>
                </div>


                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingSeven">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
                            주문한 상품과 다른 상품이 배송 되었어요
                        </button>
                    </h2>
                    <div id="collapseSeven" class="accordion-collapse collapse" aria-labelledby="headingSeven"
                        data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            받아보신 상품이 주문한 상품과 다른 경우,
                            고객센터(☎1544-1111) 또는 [고객센터 > 1:1 상담/
                            실시간채팅]로 문의해 주시기 바랍니다.
                        </div>
                    </div>
                </div>



                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingEight">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
                            배송 날짜와 시간을 지정할 수 있나요?
                        </button>
                    </h2>
                    <div id="collapseEight" class="accordion-collapse collapse" aria-labelledby="headingEight"
                        data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            상품의 배송은 재고 및 배송 준비 기간, 배송 경로와
                            택배사의 배송 물량에 따라 방문 시간대가 달라지
                            므로 배송날짜 및 방문 시간을 미리 지정하기 어렵습니다.
                        </div>
                    </div>
                </div>

                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingNine">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#collapseNine" aria-expanded="false" aria-controls="collapseNine">
                            주문을 취소했는데도 신용카드 취소가 안돼요
                        </button>
                    </h2>
                    <div id="collapseNine" class="accordion-collapse collapse" aria-labelledby="headingNine"
                        data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            주문취소 시 신용카드 승인 취소하여 카드사로 전달
                            하나, 카드사 기준에 따라 반영되기까지 3~5일
                            (주말/공휴일 제외) 소요될 수 있습니다.

                            또한, 신용카드 청구 작업이 끝난 이후 취소 처리가
                            완료된 경우는 납부 이후 카드사에서 자동 상계 처리가
                            되며 상세 내역은 카드사에서 확인 가능합니다.
                        </div>
                    </div>
                </div>

                <div class="accordion-item ">
                    <h2 class="accordion-header" id="headingTen">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#collapseTen" aria-expanded="false" aria-controls="collapseTen">
                            교환/반품 접수를 하지 않고 상품을 먼저 보냈는데 교환 / 반품이 되나요?
                        </button>
                    </h2>
                    <div id="collapseTen" class="accordion-collapse collapse" aria-labelledby="headingTen"
                        data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            교환/반품 신청 없이 택배를 먼저 발송한 경우 교환/
                            반품(환불) 처리가 지연될 수 있습니다.
                            신청 없이 택배를 먼저 발송하셨다면, 운송장번호를
                            확인하여 고객센터(☎1544-1111) 또는 [고객센터 > 1:1 상담/
                            실시간채팅]로 문의해 주시기 바랍니다.
                            <br>
                            추후 원활한 교환/반품 진행을 위해 택배 발송 전
                            모바일/PC '마이페이지>교환/반품 신청' 또는
                            고객센터로 교환/반품을 신청해 주시기 바랍니다.
                        </div>
                    </div>
                </div>


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