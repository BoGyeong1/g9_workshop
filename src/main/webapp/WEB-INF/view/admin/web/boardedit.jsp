<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    <script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>지구공방 - Admin</title>
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
</head>

<body>
        <%@ include file="/WEB-INF/view/admin/common/adminheader.jsp" %>
            <div class="d-flex">
        <%@ include file="/WEB-INF/view/admin/common/adminnav.jsp" %>
     
        
         <c:set var="form_action" value="update" />
 	     <c:if test="${empty resultMap}">
         <c:set var="form_action" value="insert" />
        </c:if>


            <div class="container w-50 mt-5">
        <form action="/admin/board/${form_action}" method="post">


            <div class="fs-4">게시판 관리  </div>
            <hr>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">게시판 작성</th>
                        </tr>
                    </thead>
                    <tbody class="table-group-divider">
                        <tr>
                            <th scope="row">카테고리</th>
                            <td colspan="3">
                           <select class="form-select btn btn-dark btn-sm w-25" value="${resultMap.POST_CATEGORY_UID}" name = "POST_CATEGORY_UID">
                            <c:forEach items="${category}" var="category" varStatus="status">
                                <option value="${category.POST_CATEGORY_UID}" name="category">${category.CATEGORY_NAME}</option>
                            </c:forEach>
                            </select>
                            </td>

                        </tr>
                        <tr>
                            <th scope="row">상단고정</th>
                                <td colspan="3"> <div class="form-check">
                                  <input class="form-check-input" type="checkbox" value="TOP_FIXED" id="TOP_FIXED" name="TOP_FIXED">
                                  <label class="form-check-label" for="TOP_FIXED" name="TOP_FIXED">
                                    게시글 상단 고정하기 
                                  </label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">제목</th>
                                <td colspan="3"><input type="text" name="TITLE" id="TITLE" class="form-control w-25"
                                    placeholder="제목" required value="${resultMap.TITLE}"> 
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">작성내용 </th>
                            <td colspan="3">
                                <div id="editor">${resultMap.CONTENT}</div>
                                <input type="hidden" id="CONTENT" name="CONTENT" >
                            </td>
                        </tr>
                        

                    </tbody>
                </table>

                <div class="d-flex justify-content-center align-items-centers m-3">
                    <button type="submit" class="btn btn-success">${form_action}</button>
                </div>
        </div>
        </div>
        </form>

<script>
$(document).ready(function() {
  var quill = new Quill('#editor', {
    theme: 'snow',
    modules: {
      toolbar: [
        [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
        ['bold', 'italic', 'underline', 'strike'],
        [{ 'color': [] }, { 'background': [] }],
        ['link', 'image', 'video'],
        [{ 'align': [] }],
        ['clean']
      ]
    }
  });

let contentData = '${content}'.replace(/\n/g, '');
let content = null;

if (contentData.trim() !== '' && contentData !== 'null') {
  try {
    content = JSON.parse(contentData);
  } catch (e) {
    console.error('Failed to parse JSON data:', e);
  }
}

if (content) {
  quill.setContents(content);
}

let form = document.querySelector('#inquiry-form');
let submitButton = document.querySelector('#submit-button');
submitButton.addEventListener('click', function (event) {
  // get quill content content -> json
  let content = quill.getContents();
  console.log(content);  // content 확인용
  let description = document.querySelector('#CONTENT');
  // json 변환해서 실어보내기
  if (content) {
    CONTENT.value = JSON.stringify(content);
  } else {
    CONTENT.value = 'null';
  }
  form.submit();
});
});
</script>
   

    <%-- <!-- Include stylesheet -->
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">


    <!-- Include the Quill library -->
    <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>

    <!-- Initialize Quill editor -->
    <script>
        var quill = new Quill('#editor', {
            theme: 'snow'
        });
    </script> --%>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>
</body>

</html>