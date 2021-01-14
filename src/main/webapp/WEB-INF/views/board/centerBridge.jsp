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
/* 여기서부터 */
	.outer {
		margin-top: 50px;
		margin-bottom: 50px;
		margin-left: auto;
		margin-right: auto;
		overflow: hidden;
		position: relative;
		width: 1000px;
		font-family: "G마켓 산스 TTF Medium";
		text-align: center;
		
	}
	
	.mainframe {
		width: 600px;
		height: 300px;
		border: 2px solid;
		border-radius: 15px;
		padding-top: 45px;
		padding-left: 43px;
		text-align:center; 
		position:relative; 
		margin:0 auto; 
	}
	.QnABtnArea {
		border: 2px solid;
		width: 250px;
		height: 200px;
		float: left;
	}
	.QnAImg {
		margin-top: 15px;
	}
	
	#qnaBtn {
		margin-top: 25px;
		background-color: #FF6833; 
		color: white;
		font-size: 13px;
	}
	
	.NoticeBtnArea {
		margin-left: 10px;
		border: 2px solid;
		width: 250px;
		height: 200px;
		float: left;
	}
	.NoticeImg {
		margin-top: 15px;
	}
	
	#noticeBtn {
		margin-top: 25px;
		background-color: #FF6833; 
		color: white;
		font-size: 13px;
	}
	
	#qnaBtn:hover, #noticeBtn:hover {
		background-color: #F3F4F8;
		color: #585858;
		cursor: pointer;
	}
	
</style>
</head>
<body>
	<c:import url="../common/gnb.jsp"/>
	<div class="outer">
		<div class="mainframe">
			<div class="QnABtnArea">
				<img class="QnAImg" src="${ pageContext.servletContext.contextPath }/resources/images/board/qnaIcon.PNG">
				<button type="button" id="qnaBtn" class="btn btn mb-3" onclick="location.href='QnAView.bo'">Q&A게시판으로 이동</button>
			</div>
			<div class="NoticeBtnArea">
				<img class="NoticeImg" src="${ pageContext.servletContext.contextPath }/resources/images/board/noticeIcon.png">
				<button type="button" id="noticeBtn" class="btn btn mb-3" onclick="location.href='noticeListView.bo'">공지게시판으로 이동</button>
			</div>
		</div>
	</div>
</body>
</html>