<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
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
	font-size: 13px;
	font-weight: bold;
}

#serch {
	height: 35px;
	width: 120px;
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
	font-size: 10px;
}

th {
	font-size: 10px;
}

td {
	font-size: 10px;
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
		<h2 id="mainName" style="font-weight: bold">고객센터</h2>
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
						<th scope="col" class="text-center" width="10%">분류</th>
						<th scope="col" class="text-center" width="10%">조회수</th>
						<th scope="col" class="text-center" width="30%">제목</th>
						<th scope="col" class="text-center" width="10%">작성자</th>
						<th scope="col" class="text-center" width="10%">등록일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="checkbox" name="noticeNum1"
							value="noticeNum1"></td>
						<td>1</td>
						<td>일반</td>
						<td>23</td>
						<td>별미 어떻게 사용합니까?</td>
						<td>정찬오</td>
						<td>2020-11-28</td>
					<tr>
					<tr>
						<td><input type="checkbox" name="noticeNum1"
							value="noticeNum1"></td>
						<td>2</td>
						<td>마이페이지</td>
						<td>42</td>
						<td>별미에서 비밀번호 수정방법</td>
						<td>백상용</td>
						<td>2020-12-12</td>
					<tr>
					<tr>
						<td><input type="checkbox" name="noticeNum1"
							value="noticeNum1"></td>
						<td>3</td>
						<td>배송</td>
						<td>25</td>
						<td>상품 배송 지연 문의</td>
						<td>김다혜</td>
						<td>2020-12-19</td>
					<tr>
					<tr>
						<td><input type="checkbox" name="noticeNum1"
							value="noticeNum1"></td>
						<td>4</td>
						<td>일반</td>
						<td>56</td>
						<td>활동문의</td>
						<td>손제근</td>
						<td>2020-12-25</td>
					<tr>
					<tr>
						<td><input type="checkbox" name="noticeNum1"
							value="noticeNum1"></td>
						<td>5</td>
						<td>상품</td>
						<td>32</td>
						<td>상품정보</td>
						<td>이형경</td>
						<td>2020-12-28</td>
					<tr>
					<tr>
						<td><input type="checkbox" name="noticeNum1"
							value="noticeNum1"></td>
						<td>6</td>
						<td>배송</td>
						<td>28</td>
						<td>배송문의</td>
						<td>한봄희</td>
						<td>2020-12-30</td>
					<tr>
				</tbody>
			</table>
			
		</div>
		<div id="buttonArea">
			<button type="button" class="btn btn-secondary" style="float: left"disabled>삭제</button>		
			<button type="button" class="btn" style="float: right; background-color: #FF6833; color: white" onclick="location.href='QnAInsertView.bo'">질문 작성하기</button>	
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