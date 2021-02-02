<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
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

#buttonArea {
	text-align: center;
}
</style>
</head>
<body>
	<c:import url="../common/gnb.jsp"/>
	<div id="mainFrame" style="padding-left: 10%; padding-right: 10%;">
		<h2 align="center" style="padding-top: 15px; font-weight: bold">
			문의사항 수정
		</h2>
		<hr>
		<form action="salQnaUpdate.wr" method="post">
			<div class="form-group row">
				<input type="hidden" name="salqnaNo" value="${ salesqna.salqnaNo }">
				<input type="hidden" name="page" value="${ page }">
				<input type="hidden" name="salqnaStarcode" value="${ salesqna.salqnaStarcode }">
				<input type="hidden" name="salqnaType" value="${ salesqna.salqnaType }">
				<label for="inputTitle" class="col-sm-1 col-form-label"><strong>제목</strong></label>
				<div class="col-sm-10">
					<input type="text" name="salqnaTitle" class="form-control"
						id="inputTitle" value="${ salesqna.salqnaTitle }">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputContent" class="col-sm-1 col-form-label"><strong>내용</strong></label>
				<div class="col-sm-10">
					<textarea type="text" name="salqnaContent" class="form-control"
						id="inputContent" style="height: 600px">${ salesqna.salqnaContent }</textarea>
				</div>
			</div>
			<div id="buttonArea">
				<button type="submit" id="insertBtn" class="btn btn mb-3" style="background-color: #FF6833; color: white">수정</button>
				<button type="button" id="cancelBtn" class="btn btn mb-3" style="background-color: #EFEFEF; color: #5A5A5A" onclick="location.href='salqnaDetail.wr?salqnaNo=${ salesqna.salqnaNo }&page=${ page }&salqnaType=${ salesqna.salqnaType }'">취소</button>
			</div>
		</form>
	</div>
</body>
</html>