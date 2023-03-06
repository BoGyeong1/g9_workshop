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

    <title>EarthWorkshop - BoardView</title>

<body>

  <%-- header --%>
    <%@ include file="/WEB-INF/view/user/common/header.jsp" %>

    <!-- main  -->
    <main>
        <div style="height: 900px;">
            <div class="m-5">
                <div class="text-center display-6 fw-bold mb-3">게시글</div>

            </div>
            <div class="container d-flex justify-content-center">
                <div>
                    <table>
                        <tr>
                            <th>
                                <!-- 게시글 카테고리 -->
                                  <c:forEach items="${boardList}" var="board" varStatus="status">
                                <div class="fs-5 border-bottom border-success border-4 text-success">${boardList.}
                                    <!-- 게시글 제목 -->
                                    <div class="fs-3">2023년 설날 연휴 배송안내 및 휴무안내</div>
                                </div>
                            </th>
                        </tr>
                        <!-- 작성일 -->
                        <div style="font-size: 0.8rem;" class="text-end">작성일 <span>2023-1-1 </span></div>

                    </table>

                    <!-- 게시글 본문  -->
                    <div class="mt-5 mb-5">
                        안녕하세요. 낭비 없는 소비, 지구공방입니다.<br>
                        '낭비 없는 소비'를 주제로 2018년부터 국내 최초의 제로웨이스트 전문 브랜드로 제로웨이스트 활동과 가치를 소개하였습니다.<br>
                        더 많은 분들을 만나고, 제로웨이스트 삶의 방식이 자연스러운 일상이 되길 바라며 온라인몰 운영, 지구샵 연남점 개소 등<br>
                        지난 4년 간 쉬지 않고 고민하고, 노력해왔는데요.<br>


                        지구샵 상도점을 다시 잘 활용하여 운영해보는 방법을 계속 고민해보았는데요.<br>
                        현재 지구샵 연남점과 지구샵 그로서리 매장이 추가로 개설됨에 따라<br>
                        매장을 직접 운영하거나 인력을 배치하여 운영 관리하기 어렵다는 현실적인 판단이 되었습니다.<br>

                        아쉽지만 지구샵 상도점은 2023년 2월 18일까지 영업 후 종료하게됨을 말씀드립니다.<br>
                        지구샵의 첫 시작인만큼 오래 함께하고 싶었으나 소비자분들을 위한 양질의 서비스가 어려운 점을 인지하였고,<br>
                        지구샵 연남점과 지구샵 그로서리에서 보다 다양하고 좋은 제품과 서비스를 드리고자 합니다.<br>

                        지구샵 상도점 공간은 2월 중순~말 재정비를 통해 커뮤니티 바, 공집합을 정비됩니다.<br>
                        3월부터는 공집합으로 운영되며, 카페 영업을 함께 하신다 하시니 많은 관심 부탁드립니다. :)<br>

                        지구샵은 올 해부터 연남동을 중심으로 매장운영 및 지구학교 활동을 전개할 예정입니다.<br>
                        많은 관심과 참여 부탁드립니다. <br>

                        지구샵 상도점 : 2월 18일 까지 영업<br>
                        공집합 : 2월 말부터 재정비 후 오픈<br>



                        지구샵 상도점에 방문해주시고 진심과 애정 어린 마음을 보내주셔서 진심으로 감사드립니다.<br>
                        지구샵의 방향과 활동이 정체 되지 않도록 올 한해도 좋은 제품, 좋은 서비스로 소비자 여러분들과 소통하겠습니다. <br>



                        지구공방 대표, 개발팀 드림.
                    </div>
                    </c:forEach>


            </div>
            <!-- 목록 버튼 -->
            <div class=" d-flex justify-content-center mt-2">
                <a name="" id="" class="btn btn-success" href="./board.html" role="button">목록</a>
            </div>

            <!-- 검색창 -->
            <form action="" class="container d-flex justify-content-center mt-2">
                <select class="form-select-sm me-1" name="searchtitle" id="">
                    <option selected value="st1">제목</option>
                    <option value="st2">내용</option>
                    <option value="st3">작성자</option>
                </select>
                <input type="search" id="searchBoard" name="searchBoard" class="border border-1 border-dark" />
                </button><br>
                <button type="button" class="btn btn-outline-dark ms-1">검색</button></td>
                </tr>
            </form>
        </div>
    </main>



  <%-- Footer Include --%>
    <%@ include file="/WEB-INF/view/user/common/footer.jsp" %>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>

</html>