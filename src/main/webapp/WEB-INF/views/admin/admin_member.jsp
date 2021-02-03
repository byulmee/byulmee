<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@300&display=swap"
	rel="stylesheet">

</head>
<style>
BODY {
	font-family: 'GmarketSansTTFMedium';
}

.navbar_name {
	color: white;
	font-size: 20px;
	padding: 20px 30px;
}

.navbar {
	display: flex;
	justify-content: inherit;
	background-color: #3B3A5A;
	align-items: center;
	height: 80px;
	width: 1770px;
}

.navbar_logo {
	margin-left: 30px;
	color: white;
}

.wrapper {
	display: flex;
	/*   	position: relative;     */
	position: fixed;
	width: 200px;
	height: 440px;
	background-color: #f5f5f5;
	padding: 30px 0;
}
/* .wrapper .sidebar{
	position: fixed;
 	width: 200px; 
	height: 100%;
	background-color: #f5f5f5;
	padding: 30px 0;
	
} */
.wrapper ul li {
	padding: 30px;
	border-bottom: 2px solid rgba(0, 0, 0, 0.05);
	border-top: 2px solid rgba(225, 225, 225, 0.05);
	list-style: none;
	padding-left: 15px;
}

.wrapper 	ul li a {
	color: black;
	dispalay: block;
	text-decoration: none;
	font-size: 18px;
}

.wrapper li a:active {
	color: #3B3A5A;
	font-weight: bold
}

.outer {
	position: relative;
	left: 435px;
	margin-right: 435px;
	width: 900px;
	height: 1000px;
	margin-top: 50px;
	margin-bottom: 50px;

	/*      background-color:red;  */
}

.outer .search {
	/* background-color:pink */;
	margin-left: center;
}

.outer .search .searchArea {
	/* background-color: #f5f5f5; */
	
}

.outer .search .searchArea .nickname {
	padding-left: 15px;
}

.find {
	margin-top: 20px;
	margin-left: 815px;
	find2-background-color: #3B3A5A;
	font-size: 15px;
	color: white;
}

.find .find2 {
	background-color: #3B3A5A;
	font-size: 15px;
	color: white;
}

.idlist {
	margin-top: 100px;
	margin-bottom: 50px;
}

#idTable {
	text-align: center;
	margin: auto;
	width: 900px;
	border-collapse: collapse;
}

#idTable th {
	background-color: #f5f5f5;
}

#idTable td {
	border-bottom: 1px solid lightgray;
}

td, th {
	padding: 10px;
}

.searchbtn {
	margin-left: 10px;
	background: #3B3A5A;
	color: white;
}
</style>

<script>
	$(function() {
		$("button[name=memLevel]").on("click", function() {
			let level = $(this).data("level") == "1" ? 0 : 1 ;
			let memberId = $(this).data("id");
			let button = $(this);

			$.post("/api/admin/level/update", "memberId=" + memberId + "&level=" + level, function(res) {
				button.text(level).data("level", level);
			});
		});
		
		$("button[name=memStatus]").on("click", function() {
			let status = $(this).data("status") == "Y" ? "N" : "Y";
			let memberId = $(this).data("id");
			let button = $(this);

			$.post("/api/admin/status/update", "memberId=" + memberId + "&status=" + status, function(res) {
				button.text(status).data("status", status);
			});
		});
});

</script>
<body>
	<header class="navbar">
		<span class="navbar_logo"> <a onclick="location.href='home.do'"><img
				src="resources/images/admin/byulmee.PNG" alt="별미 로고" width="200"></a>
		</span> <span class="navbar_name">관리자 페이지 </span>
	</header>

	<div class="wrapper">
		<ul>
			<li><a onclick="location.href='adminMain.ad'" class="b1">매출관리</a>
			<li><a onclick="location.href='adminMember.ad'" class="b2">회원관리</a>
			<li><a onclick="location.href='adminNotice.ad'" class="b3">게시글관리</a>
			<li><a onclick="location.href='adminBanner.ad'" class="b4">배너관리</a>
		</ul>
	</div>
	<div class="outer">
		<h2 align="center">회원검색</h2><br>
		<div class="search">
			<div class="searchArea" align="center">
				<label>아이디</label> 
				<span>
				<input type="text" id="searchId"name="serch">
				<button type="button" id="find1" class="btn searchbtn"onclick="searchId();">검색하기</button>
				</span> 				
			</div>
		</div>
		<div class="idlist">
			<h2 align="center">회원 전체 목록</h2>
			<table id="idTable">
				<tr>
					<th align="center">회원 번호</th>
					<th align="left">아이디</th>
					<th align="left">이름</th>
					<th align="left">닉네임</th>
					<th align="center">구분</th>
					<th align="left">연락처</th>
					<th align="left">기념일</th>
					<th align="center">관리</th>
				</tr>

				<c:forEach items="${ list }" var="m">
					<c:if test="list == null">
					</c:if>
					<tr>
						<td align="center">${m.memNo }</td>
						<td align="left">${m.memId }</td>
						<td align="left">${m.memName }</td>
						<td align="left">${m.memNickname }</td>
						<td align="center">
							<button type="button" name="memLevel" data-level="${m.memLevel}" data-id="${m.memId}">${m.memLevel }</button>
						</td>
						<td align="left">${m.memPhone }</td>
						<td align="left">${m.memDate }</td>
						<td align="center">
							<button type="button" name="memStatus" data-status="${m.memStatus}" data-id="${m.memId}">${m.memStatus }</button>
						</td>
					</tr>
				</c:forEach>

			</table>
			<br>
			<div id="pagingArea" align="center">
				<c:if test="${ searchId eq null }">
					<c:set var="loc" value="adminMember.ad"/>
				</c:if>
				<c:if test="${ searchId ne null }">
					<c:set var="loc" value="searchId.ad"/>
				</c:if>
				
				<!-- 이전 페이지로 -->
				<c:if test="${ pi.currentPage <= 1 }">
					<button class="btn btn-light" onclick="#" id="beforeBtn"
						disabled="disabled">&lt;</button>
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="${ loc }">
						<c:if test="${ searchId ne null }">
							<c:param name="searchId" value="${ searchId }"/>
						</c:if>
						<c:param name="page" value="${ pi.currentPage - 1 }" />
					</c:url>
					<button class="btn btn-light" onclick="location.href='${ before }'"
						id="beforeBtn">&lt;</button>
				</c:if>

				<!-- 숫자 목록 버튼 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<button class="btn btn-light" id="numBtn" class="text-reset"
							onclick="#" disabled="disabled">${ p }</button>
					</c:if>

					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="${ loc }">
							<c:if test="${ searchId ne null }">
								<c:param name="searchId" value="${ searchId }"/>
							</c:if>
							<c:param name="page" value="${ p }" />
						</c:url>
						<button class="btn btn-light" id="numBtn" class="text-reset"
							onclick="location.href='${ pagination }'">${ p }</button>
					</c:if>
				</c:forEach>

				<!-- 다음 페이지로 -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					<button class="btn btn-light" onclick="#" id="afterBtn"
						disabled="disabled">&gt;</button>
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="${ loc }">
						<c:if test="${ searchId ne null }">
							<c:param name="searchId" value="${ searchId }"/>
						</c:if>
						<c:param name="page" value="${ pi.currentPage + 1 }" />
					</c:url>
					<button class="btn btn-light" onclick="location.href='${ after }'"
						id="afterBtn">&gt;</button>
				</c:if>
			</div>
		</div>
	</div>
	<script>
		function searchId() {
			var searchId = $("#searchId").val();
			console.log(searchId);
			
			location.href="searchId.ad?searchId="+searchId;
		}
	
	</script>

</body>
</html>