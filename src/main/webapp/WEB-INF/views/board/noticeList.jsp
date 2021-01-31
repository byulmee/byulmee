<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro&display=swap"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<style>
#mainFrame {
	margin-top: 50px;
	margin-bottom: 50px;
	margin-left: auto;
	margin-right: auto;
	overflow: hidden;
	position: relative;
	width: 1000px;
	font-family: "G마켓 산스 TTF Medium";
	
}

#serchFrame {
	float: right;
	font-size: 17px;
	font-weight: bold;
}

#serch {
	height: 35px;
	width: 160px;
}

#listArea {
	width: 100%;
}

/* #noticeTable {
	height: 45px;
	width: 100%;
	text-align: center;
	
} */
thead {
	background-color: #F4F4F4;
}
tbody {
	min-height: 250px;
}

tr {
	text-align: center;
}

#pagingArea {
	text-align: center; 
}

#pagingArea > button {
	font-size: 10px;
}

#buttonArea > button {
	font-size: 12px;
}

th {
	font-size: 12px;
}

/*
td {
	background-color: white;
} */
/* background-color: #F4F4F4; */
</style>
</head>
<body>
	<c:import url="../common/gnb.jsp"/>
	<div id="mainFrame">
		<h2 id="mainName" style="font-weight: bold">공지사항</h2>
		<div id="serchFrame">
			<span> 검색 <input type="text" id="serch" name="serch"
				placeholder="별미별미">
			</span>
		</div>
		<br> <br> <br>
		<div id="noticeFrame">
			<table class="table table-hover" id="listArea">
				<thead>
					<tr>
						<th scope="col" class="text-center" width="5%">No</th>
						<th scope="col" class="text-center" width="10%">조회수</th>
						<th scope="col" class="text-center" width="30%">제목</th>
						<th scope="col" class="text-center" width="10%">작성자</th>
						<th scope="col" class="text-center" width="10%">등록일</th>
					</tr>
				</thead>
				<tbody>
					
						<tr class="notice">
							<td>${ n.notNo }
							<%-- <input type="hidden" name="notNo" value="${ n.notNo }"> --%></td>
							<td>${ n.notCount }</td>
							<td>${ n.notTitle }</td>
							<td>${ n.nickName }</td>
							<td>${ n.notDate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</div>
		<c:if test="${ loginUser.memId eq 'admin' }">
			<div id="buttonArea">
				<!-- <button type="button" class="btn btn-secondary" style="float: left"disabled>삭제</button>	 -->	
				<button type="button" class="btn" style="float: right; background-color: #FF6833; color: white" onclick="location.href='noticeInsertView.bo'">공지사항 작성하기</button>	
			</div>
		</c:if>
			<div id="pagingArea">
				<!-- 이전 페이지로 -->
				<c:if test="${ pi.currentPage <= 1 }">
					<button class="btn btn-light" onclick="#" id="beforeBtn" disabled="disabled">&lt;</button>
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="noticeListView.bo">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<button class="btn btn-light" onclick="${ before }" id="beforeBtn">&lt;</button>
				</c:if>
				
				<!-- 숫자 목록 버튼 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<button class="btn btn-light" id="numBtn" class="text-reset" onclick="#"  disabled="disabled">${ p }</button>
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="noticeListView.bo">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<button class="btn btn-light" id="numBtn" class="text-reset" onclick="${ pagination }">${ p }</button>
					</c:if>
				</c:forEach>
				
				<!-- 다음 페이지로 -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					<button class="btn btn-light" onclick="#" id="afterBtn" disabled="disabled">&gt;</button>
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="noticeListView.bo">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url>
					<button class="btn btn-light" onclick="${ after }" id="afterBtn">&gt;</button>
				</c:if>
			</div>
	</div>
		<script>
		$(function() {
			$('.notice').mouseenter(function(){
				$(this).css({'color': '#FF6833',  'font-weight':'bold', 'cursor': 'pointer'});
			}).mouseout(function(){
				$(this).css({'color': '#585858', 'font-weight':'normal'});
			}).click(function(){
				var notNo=$(this).children('td').eq(0).text();
				console.log(notNo);
				location.href='notDetail.bo?notNo=' + notNo + '&page=' + ${pi.currentPage};
			});
		});
	</script>
</body>
</html>