<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
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
						<th scope="col" class="text-center" width="2%"><input
							type="checkbox" name="noticeNum1" value="noticeNum1"></th>
						<th scope="col" class="text-center" width="5%">No</th>
						<th scope="col" class="text-center" width="10%">조회수</th>
						<th scope="col" class="text-center" width="30%">제목</th>
						<th scope="col" class="text-center" width="10%">작성자</th>
						<th scope="col" class="text-center" width="10%">등록일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th><input type="checkbox" name="noticeNum1"
							value="noticeNum1"></th>
						<th>1</th>
						<th>23</th>
						<th>별미 이용 안내</th>
						<th>관리자</th>
						<th>2020-11-28</th>
					<tr>
					<tr>
						<th><input type="checkbox" name="noticeNum1"
							value="noticeNum1"></th>
						<th>2</th>
						<th>42</th>
						<th>2020년 12월 14일 업데이트 안내</th>
						<th>관리자</th>
						<th>2020-12-12</th>
					<tr>
					<tr>
						<th><input type="checkbox" name="noticeNum1"
							value="noticeNum1"></th>
						<th>3</th>
						<th>25</th>
						<th>2020년 12월 21일 업데이트 안내</th>
						<th>관리자</th>
						<th>2020-12-19</th>
					<tr>
					<tr>
						<th><input type="checkbox" name="noticeNum1"
							value="noticeNum1"></th>
						<th>4</th>
						<th>56</th>
						<th>2020년 12월 28일 업데이트 안내</th>
						<th>관리자</th>
						<th>2020-12-25</th>
					<tr>
					<tr>
						<th><input type="checkbox" name="noticeNum1"
							value="noticeNum1"></th>
						<th>5</th>
						<th>32</th>
						<th>2020년 12월 31일 연말 공지사항</th>
						<th>관리자</th>
						<th>2020-12-28</th>
					<tr>
					<tr>
						<th><input type="checkbox" name="noticeNum1"
							value="noticeNum1"></th>
						<th>6</th>
						<th>28</th>
						<th>2021년 01월 01일 새해 공지사항</th>
						<th>관리자</th>
						<th>2020-12-30</th>
					<tr>
				</tbody>
			</table>
			
		</div>
		<div id="buttonArea">
			<button type="button" class="btn btn-secondary" style="float: left"disabled>삭제</button>		
			<button type="button" class="btn" style="float: right; background-color: #FF6833; color: white" onclick="location.href='noticeInsertView.bo'">공지사항 작성하기</button>	
		</div>
		<div id="pagingArea">
			<!-- 맨 처음으로 -->
			<button class="btn btn-light" onclick="#">&lt;&lt;</button>
			<!-- 이전 페이지로 -->
			<button class="btn btn-light" onclick="#" id="beforeBtn">&lt;</button>
			
			<!-- 숫자 목록 버튼 -->
			<button class="btn btn-light" id="numBtn" class="text-reset" onclick="#">1</button>
			<button class="btn btn-light" id="numBtn" class="text-reset" onclick="#">2</button>
			<button class="btn btn-light" id="numBtn" class="text-reset" onclick="#">3</button>
			<button class="btn btn-light" id="numBtn" class="text-reset" onclick="#">...</button>
			<button class="btn btn-light" id="numBtn" class="text-reset" onclick="#">20</button>
			
			<!-- 다음 페이지로 -->
			<button class="btn btn-light" onclick="#" id="afterBtn">&gt;</button>
			<!-- 맨 끝으로 -->
			<button class="btn btn-light" onclick="#">&gt;&gt;</button>
		</div>
	</div>
</body>
</html>