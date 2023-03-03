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
    <title>지구공방 - Admin 가입</title>
</head>

<body>
    <div class="container">
        <div class="" id="admin-login-box" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -70%);">
            <div class="text-center">
                <img src="/img/logo/G9_Logo_Black.png" alt="G9_Logo_Black" class="w-25">
            </div>
            <h1 class="text-center">
                Admin System 등록
            </h1>
            <form action="/admin/regiSucess" method="POST" >
            <div class="d-flex justify-content-center mt-5">
                <label for='id' class="me-3">어드민 ID</label>
                <input type="text" name="ID" id="id">
                  
             </div>
             <br>
             <div class="d-flex justify-content-center mt-3">
            <label class="me-3">패스워드</label>
            <input type="password" name="PASSWORD">
            </div>
                <br>
            <div class="d-flex justify-content-center mt-3">
                <label class="me-3">어드민명</label>
                <input type="text" name="ADMIN_NAME">
            </div>      
                <br>
            <div class="d-flex justify-content-center mt-3">    
            <label class="me-3">별명</label>
            <input type="text" name="NICKNAME">
             </div> 
            <br>
             <div class="d-flex justify-content-center mt-3"> 
            <button type="submit" class="btn btn-dark"> 가입</button>
             </div> 
            </form>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>

</html>
