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
    <title>지구공방 - Admin</title>
</head>

<body>
    <%@ include file="/WEB-INF/view/admin/common/adminheader.jsp" %>
    <div class="d-flex">
        <%@ include file="/WEB-INF/view/admin/common/adminnav.jsp" %>
        <div class="w-100 m-5">
            <form action="/admin/product/insert" method="post" enctype="multipart/form-data">
                <div class="my-3 fs-1">
                    상품 등록
                </div>
                <div class="my-3">
                    <label for="product-name" class="form-label">상품명</label>
                    <input type="text" name="product-name" id="product-name" class="form-control">
                </div>
                <div class="my-3">
                    <label for="product-desc" class="form-label">간략 설명</label>
                    <input type="text" name="product-desc" id="product-desc" class="form-control">
                </div>
                <div class="my-3">
                    <label for="category-uid" class="form-label">카테고리</label>
                    <select name="category-uid" id="category-uid" class="form-select">
                        <c:forEach items="${categoryList}" var="category" varStatus="status">
                            <option value="${category.CATEGORY_UID}">${category.CATEGORY_NAME}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="my-3">
                    <label for="purpose-uid" class="form-label">사용용도</label>
                    <select name="purpose-uid" id="purpose-uid" class="form-select">
                        <c:forEach items="${purposeList}" var="purpose" varStatus="status">
                            <option value="${purpose.PURPOSE_UID}">${purpose.PURPOSE_NAME}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="my-3">
                    <label for="brand-uid" class="form-label">브랜드</label>
                    <select name="brand-uid" id="brand-uid" class="form-select">
                        <c:forEach items="${brandList}" var="brand" varStatus="status">
                            <option value="${brand.BRAND_UID}">${brand.BRAND_NAME}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="my-3">
                    <label for="origin-uid" class="form-label">원산지</label>
                    <select name="origin-uid" id="origin-uid" class="form-select">
                        <c:forEach items="${originList}" var="origin" varStatus="status">
                            <option value="${origin.ORIGIN_UID}">${origin.ORIGIN_NAME}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="my-3">
                    <label for="price" class="form-label">가격(숫자만)</label>
                    <input type="text" name="price" id="price" class="form-control">
                </div>
                <div class="my-3">
                    <label for="discount-rate" class="form-label">할인율(%제외)</label>
                    <input type="text" name="discount-rate" id="discount-rate" class="form-control">
                </div>
                <div class="my-3">
                    <label for="stock" class="form-label">재고</label>
                    <input type="text" name="stock" id="stock" class="form-control">
                </div>
                <div class="my-3">
                    <label for="exposure" class="form-label">노출여부</label>
                    <select name="exposure" id="exposure" class="form-select">
                        <option value="YES">YES</option>
                        <option value="NO">NO</option>
                    </select>
                </div>
                <%-- 객체가 비어있다면 --%>
                <c:if test="${empty productEditInfo}">
                    <div>
                        <label for="thumbnail-1" class="form-label">상품 썸네일 이미지</label>
                        <input type="file" accept="image/*" name="thumbnail-1" id="thumbnail" class="form-control" required>
                        <input type="file" accept="image/*" name="thumbnail-2" id="thumbnail" class="form-control">
                        <input type="file" accept="image/*" name="thumbnail-3" id="thumbnail" class="form-control">
                        <input type="file" accept="image/*" name="thumbnail-4" id="thumbnail" class="form-control">
                        <input type="file" accept="image/*" name="thumbnail-5" id="thumbnail" class="form-control">
                    </div>
                    <div>
                        <label for="detail-1" class="form-label">상세 페이지 이미지</label>
                        <input type="file" accept="image/*" name="detail-1" id="detail" class="form-control" required>
                        <input type="file" accept="image/*" name="detail-2" id="detail" class="form-control">
                        <input type="file" accept="image/*" name="detail-3" id="detail" class="form-control">
                        <input type="file" accept="image/*" name="detail-4" id="detail" class="form-control">
                        <input type="file" accept="image/*" name="detail-5" id="detail" class="form-control">
                        <input type="file" accept="image/*" name="detail-6" id="detail" class="form-control">
                        <input type="file" accept="image/*" name="detail-7" id="detail" class="form-control">
                        <input type="file" accept="image/*" name="detail-8" id="detail" class="form-control">
                    </div>
                </c:if>
                <%-- 객체가 비어있지 않다면 --%>
                <c:if test="${not empty productEditInfo}">
                    <div>
                        이미지 수정기능 개발중
                    </div>
                </c:if>
                <button type="submit" class="btn btn-primary">등록하기</button>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>
</body>

</html>