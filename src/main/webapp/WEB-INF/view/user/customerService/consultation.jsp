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

        .ql-editor {
            min-height: 300px !important;
            max-height: 800px;
            overflow: hidden;
            overflow-y: scroll;
            overflow-x: scroll;
        }
    </style>
    <title>g9 - consultation</title>

            <%-- header --%>
    <%@ include file="/WEB-INF/view/user/common/header.jsp" %>

<body>

    <!-- main  -->
    <main>
        <form action="" method="post">
            <div class="container w-50">
                <div class="m-5">
                    <div class="text-center display-6 fw-bold">고객센터</div>


                </div>

                <ul class="nav nav-pills nav-fill fw-bold ">

                    <li class="nav-item">
                        <a class="nav-link " aria-current="page" href="/docs/customerService/askedQuestion.html">FAQ</a>
                    </li>


                    <li class="nav-item">
                        <a class="nav-link" href="#">1:1 상담</a>
                    </li>

                </ul>


                <div class="fs-4 text-success fw-bold text-center m-3">
                    1 : 1 상담
                </div>

                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">1:1 상담 신청</th>
                        </tr>
                    </thead>
                    <tbody class="table-group-divider">
                        <tr>
                            <th scope="row">문의유형</th>
                            <td colspan="3">
                                <div class="dropdown">
                                    <button class="btn btn-dark dropdown-toggle" type="button" id="dropdownMenuButton1"
                                        data-bs-toggle="dropdown" aria-expanded="false" required>
                                        문의유형 선택
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                        <li><a class="dropdown-item" href="#">배송문의</a></li>
                                        <li><a class="dropdown-item" href="#">주문문의</a></li>
                                        <li><a class="dropdown-item" href="#">교환/환불 문의</a></li>
                                        <li><a class="dropdown-item" href="#">상품문의</a></li>
                                        <li><a class="dropdown-item" href="#">기타문의</a></li>
                                    </ul>
                                </div>


                            </td>

                        </tr>
                        <tr>
                            <th scope="row">주문상품</th>
                            <td colspan="3">

                                <div class="dropdown">
                                    <button class="btn btn-dark dropdown-toggle" type="button" id="dropdownMenuButton2"
                                        data-bs-toggle="dropdown" aria-expanded="false" required>
                                        주문상품 선택 <span id="selected-item"></span>
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton2">
                                        <li><a class="dropdown-item" href="#"
                                                onclick="setSelectedItem('나그랑티셔츠')">나그랑티셔츠</a></li>
                                    </ul>
                                </div>



                            </td>
                        </tr>
                        <tr>
                            <th scope="row">아이디</th>
                            <td colspan="3"><input type="text" name="userId" id="userId" class="form-control w-25"
                                    placeholder="아이디" required>
                            </td>

                        </tr>
                        <tr>
                            <th scope="row">연락처</th>
                            <td colspan="3">
                                <form name="frm" method="post" action="?">
                                    <input type="text" name="phone" class="phone form-control w-25" maxlength="13"
                                        placeholder="핸드폰번호" style="display:inline-block" required>
                        </tr>
                        <tr>
                            <th scope="row">이메일</th>
                            <td colspan="3">
                                <input type="email" class="form-control w-25" id="exampleInputEmail1"
                                    placeholder="아이디@naver.com" required>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">제목</th>
                            <td colspan="3"><input type="text" name="" id="" class="form-control w-25" placeholder="제목"
                                    required>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">문의내용</th>
                            <td colspan="3">
                                <div id="editor"></div>
                            </td>
                        </tr>

                    </tbody>
                </table>

                <div class="d-flex justify-content-center align-items-centers m-3">

                    <button type="submit" class="  btn btn-success">등록하기</button>
                </div>
        </form>
        </div>
    </main>



      <%-- Footer Include --%>
    <%@ include file="/WEB-INF/view/user/common/footer.jsp" %>

    <%-- ITEM 명  --%>
    <script>
        function setSelectedItem(item) {
            document.getElementById("selected-item").innerHTML = ": " + item;
        }
    </script>
    <script>
        var dropdownButton = document.getElementById("dropdownMenuButton1");
        var dropdownMenu = dropdownButton.nextElementSibling;
        var dropdownItems = dropdownMenu.querySelectorAll(".dropdown-item");

        for (var i = 0; i < dropdownItems.length; i++) {
            dropdownItems[i].addEventListener("click", function () {
                dropdownButton.innerHTML = this.innerHTML;
            });
        }
    </script>

    <!-- 휴대폰번호 하이푼 자동생성  -->
    <script>
        $('.phone').keydown(function (event) {
            var key = event.charCode || event.keyCode || 0;
            $text = $(this);
            if (key !== 8 && key !== 9) {
                if ($text.val().length === 3) {
                    $text.val($text.val() + '-');
                }
                if ($text.val().length === 8) {
                    $text.val($text.val() + '-');
                }
            }

            return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
        });
    </script>

    <!-- Include stylesheet -->
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">


    <!-- Include the Quill library -->
    <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>

    <!-- Initialize Quill editor -->
    <script>
        var quill = new Quill('#editor', {
            theme: 'snow'
        });
    </script>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>

</html>