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
    <link rel="stylesheet" href="/css/admin/memberlist.css">
    <title>지구공방 - Admin</title>

</head>

<body>
    <%@ include file="/WEB-INF/view/admin/common/adminheader.jsp" %>
    <div class="d-flex">
        <%@ include file="/WEB-INF/view/admin/common/adminnav.jsp" %>
        <div class="w-100 m-5">
           
                <div class="fs-4">취소내역</div>

                <table class="mt-2 mb-5 table table-bordered">
                <thead>
                <tr>
                <th class="text-center table-light">취소내역번호</th>
                <th class="text-center table-light">주문번호</th>
                <th class="text-center table-light">취소사유</th>
                <th class="text-center table-light">신청날짜</th>
                </tr>
                </thead>
                <tbody id="memberListTable">
                <c:forEach items="${resultMap.resultList}" var="resultData" varStatus="loop">
                <tr>
                <td class="text-center">${resultData.CANCELLED_ORDER_UID}</td>
                <td class="text-center">${resultData.ORDER_UID}</td>
                <td class="text-center">${resultData.REASON}</td>
                <td class="text-center">${resultData.DATE}</td>
                </tr>
                </c:forEach>
                </tbody>
                </table>

     <div id="page">
        <nav aria-label="Page navigation example" >
        <c:set var="_pagination" value="${resultMap.paginations}"/>
            <span id="totalCount">총 취소 내역수 : ${_pagination.totalCount}</span>
            <ul class="pagination  justify-content-center" id="pagination">
            <c:if test="${_pagination.currentPage > 1 }">
                <li class="page-item ${_pagination.currentPage > 1 ? '' : 'disabled'}"><a class="page-link"
								href="/admin/order/cancelOrder/1" >맨 처음</a>
				</li>
            </c:if>
                <li class="page-item ${_pagination.currentBlock > 1 ? '' : 'disabled'}"><a class="page-link"
							href="/admin/order/cancelOrder/${_pagination.previousPage}" value="${_pagination.previousPage}" >&laquo;</a>
				</li>
                
        <c:forEach var="i" begin="${_pagination.blockStart}" end="${_pagination.blockEnd}">
                <li class="page-item"><a class="page-link" href="/admin/order/orderList/${i}">${i}</a></li>
        </c:forEach>
        <li class="page-item ${_pagination.currentBlock <= _pagination.totalBlock ? '' : 'disabled'}"><a
							class="page-link"
							href="/admin/order/cancelOrder/${_pagination.nextPage}" value=${_pagination.nextPage}>&raquo;</a>
	    </li>
		<c:if test="${_pagination.currentPage < _pagination.totalPage}">
			<li class="page-item ${_pagination.currentPage < _pagination.totalPage ? '' : 'disabled'}"><a
					class="page-link"
					href="/admin/order/cancelOrder/${_pagination.totalPage}"  value=${_pagination.totalPage}>맨
					끝</a>
            </li>
		</c:if>
        </ul>
        </nav>
    </div>
           
           
            <div class="fs-4">취소사유 통계</div>

                <table class="mt-2 mb-5 table table-bordered">
                <thead>
                <tr>
                <th class="text-center table-light">취소사유</th>
                <th class="text-center table-light">COUNT</th>
                </tr>
                </thead>
                <tbody id="memberListTable">
                <c:forEach items="${statistics}" var="resultData" varStatus="loop">
                <tr>
                <td class="text-center">${resultData.REASON}</td>
                <td class="text-center">${resultData.COUNT}</td>
                </tr>
                </c:forEach>
                </tbody>
                </table>
            
          
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>
</body>

</html>