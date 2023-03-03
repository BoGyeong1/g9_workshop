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
        .page-link {
            color: #000;
            background-color: #fff;
            border: 1px solid #ccc;
        }

        .page-item.active .page-link {
            z-index: 1;
            color: #555;
            font-weight: bold;
            background-color: #f1f1f1;
            border-color: #ccc;

        }

        .page-link:focus,
        .page-link:hover {
            color: #000;
            background-color: #fafafa;
            border-color: #ccc;
        }

        a {
            text-decoration: none
        }

        a:link {
            color: black;
        }

        a:visited {
            color: black;
        }

        a:hover {
            color: black;
        }

        a:active {
            color: black
        }
    </style>
    <title>EarthWorkshop - Board</title>

<body>
    <%-- header --%>
    <%@ include file="/WEB-INF/view/user/common/header.jsp" %>
    <!-- main  -->
    <main>
        <div style="height: 800px;">
            <div class="m-5">
                <div class="text-center display-6 fw-bold">게시판</div>
                <div class="text-center display-6 fw-bold">Borad</div>
            </div>
            <div class="container d-flex justify-content-center">
                <table class="text-center" width="900px">
                    <thead>
                        <tr class="bg-light">
                            <th class="border border-dark ">글번호</th>
                            <th class="border  border-dark">구분</th>
                            <th class="border  border-dark ">제목</th>
                            <th class="border  border-dark">작성일</th>
                            <th class="border  border-dark ">조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="border border-dark ">공지</td>
                            <td class="border border-dark ">공지사항</td>
                            <td class="border border-dark ">
                                <a href="#">2023년 설날 연휴 배송안내 및 휴무안내</a>
                            </td>
                            <td class="border border-dark">2023-01-01</td>
                            <td class="border border-dark">0</td>
                        </tr>
                        <tr>
                            <td class="border border-dark">공지</td>
                            <td class="border border-dark">공지사항</td>
                            <td class="border border-dark">
                                <a href="#">2023년 1월 네이처가든 세계자연기금(WWF) 정기후원</a>
                            </td>
                            </td>
                            <td class="border border-dark">2023-01-01</td>
                            <td class="border border-dark">0</td>
                        </tr>
                        <tr>
                            <td class="border border-dark">150</td>
                            <td class="border border-dark">공지사항</td>
                            <td class="border border-dark">
                                <a href="#">22022년 12월 네이처가든 세계자연기금(WWF) 정기후원</a>
                            </td>
                            </td>
                            <td class="border border-dark">2022-12-01</td>
                            <td class="border border-dark">0</td>
                        </tr>
                        <tr>
                            <td class="border border-dark">149</td>
                            <td class="border border-dark">이벤트</td>
                            <td class="border border-dark">
                                <a href="#">2지구공방 회원들이 말하는 지구공방이 좋은 이유</a>
                            </td>
                            <td class="border border-dark">2022-11-28</td>
                            <td class="border border-dark">0</td>
                        </tr>
                        <tr>
                            <td class="border border-dark">148</td>
                            <td class="border border-dark">소식</td>
                            <td class="border border-dark">
                                <a href="#"></a>플라스틱 새활용 신제품 입고</a>
                            </td>
                            <td class="border border-dark">2022-11-21</td>
                            <td class="border border-dark">0</td>
                        </tr>
                        <tr>
                            <td class="border border-dark">...</td>
                            <td class="border border-dark">...</td>
                            <td class="border border-dark">...</td>
                            <td class="border border-dark">...</td>
                            <td class="border border-dark">...</td>

                        </tr>
                        <tr>
                            <td class="border border-dark">...</td>
                            <td class="border border-dark">...</td>
                            <td class="border border-dark">...</td>
                            <td class="border border-dark">...</td>
                            <td class="border border-dark">...</td>

                        </tr>
                        <tr>
                            <td class="border border-dark">...</td>
                            <td class="border border-dark">...</td>
                            <td class="border border-dark">...</td>
                            <td class="border border-dark">...</td>
                            <td class="border border-dark">...</td>

                        </tr>
                        <tr>
                            <td class="border border-dark">...</td>
                            <td class="border border-dark">...</td>
                            <td class="border border-dark">...</td>
                            <td class="border border-dark">...</td>
                            <td class="border border-dark">...</td>

                        </tr>
                        <tr>
                            <td class="border border-dark">...</td>
                            <td class="border border-dark">...</td>
                            <td class="border border-dark">...</td>
                            <td class="border border-dark">...</td>
                            <td class="border border-dark">...</td>

                        </tr>
                        <tr>
                            <td class="border border-dark">...</td>
                            <td class="border border-dark">...</td>
                            <td class="border border-dark">...</td>
                            <td class="border border-dark">...</td>
                            <td class="border border-dark">...</td>

                        </tr>
                        <tr>
                            <td class="border border-dark">...</td>
                            <td class="border border-dark">...</td>
                            <td class="border border-dark">...</td>
                            <td class="border border-dark">...</td>
                            <td class="border border-dark">...</td>

                        </tr>
                        <tr>
                            <td class="border border-dark">...</td>
                            <td class="border border-dark">...</td>
                            <td class="border border-dark">...</td>
                            <td class="border border-dark">...</td>
                            <td class="border border-dark">...</td>

                        </tr>

                    </tbody>
                </table>
            </div>


            <div class="d-flex justify-content-center mt-3">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>


            <form action="" class="container d-flex justify-content-center">
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