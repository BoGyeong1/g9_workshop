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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    <script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>
    <link rel="stylesheet" href="/css/admin/memberlist.css">
    <title>지구공방 - Admin</title>

</head>

<body>
    <%@ include file="/WEB-INF/view/admin/common/adminheader.jsp" %>
    <div class="d-flex">
        <%@ include file="/WEB-INF/view/admin/common/adminnav.jsp" %>
        <div class="w-100 m-5">

            <input type="hidden" name="privateInquiryUid" value="${resultMap.PRIVATE_INQUIRY_UID}">

                <div class="fs-3">문의내용</div>
                
                <div class=" fs-5 mt-3"> 제목 - ${resultMap.TITLE}</div>
                <div  class="fs-5 mt-2"> 내용 </div>
                <div id="editor" style="height : 400px"></div>

                <a href="/admin/inquiry/inquirysAnswer/${resultMap.PRIVATE_INQUIRY_UID}" class="btn btn-dark mt-2">답변등록</a>


                

        </div>
    </div>

 <script>
            $(document).ready(function() {
            // QuillJS 생성
            var quill = new Quill('#editor', {
                theme: 'snow',
                readOnly: true,
                modules: {
                toolbar: false
                }
            });

            // JSON 데이터 파싱
            var contentData = '${content}'.replace(/\n/g, '');
            var content = JSON.parse(contentData);

            // QuillJS에 JSON 데이터를 설정
            quill.setContents(content);
            });

            </script>
           

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>
</body>

</html>