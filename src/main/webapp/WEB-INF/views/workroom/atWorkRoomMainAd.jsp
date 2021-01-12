<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!--
	메인컬러 - #FF6833
	메인폰트 - font-family: "G마켓 산스 TTF Medium";
-->
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
	}

/* 사이드 메뉴 */
	.sideMenu {
		position: absolute;
		top: 0px;
		left: 0px;
		bottom: 0px;
		width: 200px;
		background: #F4F4F4;
	}
	.profile {
		padding: 25px;
	}
	.profileImg {
		width: 150px;
		height: 150px;
		border-radius: 90%;
		overflow: hidden;
		object-fit: cover;
	}
	.nickname {
		text-align: center;
		font-size: 14px;
		font-weight: bold;
	}
	.sideMenuList {
		text-align: center;
		list-style: none;
	}
	.sideMenuUl {
		list-style: none;
		padding-left: 0px;
	}
	.sideMenuBtn {
		font-family: "G마켓 산스 TTF Medium";
		font-size: 18px;
		padding-top: 5px;
		width: 200px;
		height: 50px;
		outline: 0;
		border: 0;
		background: none;
		cursor: pointer;
	}
	.sideMenuBtn:hover {
		background: #FF6833;
		color: white;
	}
	#selectedBtn {
		background: #FF6833;
		color: white;
		cursor: pointer;
	}
	
	/* 컨텐츠 */
	.content {
		margin-left: 250px;
		border: 2px solid #ECECEC;
	}
	.MainLogoText {
		margin-left: 250px;
	}
	.insertArea {
		float: right;
		list-style: none;
		padding-right: 5px;
		margin-bottom: 20px;
	}
	
	.insertBtn {
		font-family: "G마켓 산스 TTF Medium";
		font-size: 13px;
		padding-top: 5px;
		width: 150px;
		height: 35px;
		outline: 0;
		border: 0;
		background: none;
		cursor: pointer;
		background: #FF6833;
		color: white;
		border-radius: 25px;
	}
	
	.insertBtn:hover {
		background: #FFA98B;
		color: white;
	}
/* 여기까지 유지해서 페이지 만드시면 콘텐츠 길이만큼 사이드메뉴 회색배경 길이도 늘어납니다 */
	.MainText {
		color: #585858;
		font-size: 20px;
		margin-bottom: 20px;
	}
	table {
		border-collapse: collapse;
		width: 750px;
	}
	
	.imgTd {
		width: 120px;
		text-align: center;
		padding-top: 10px;
	}
	.img {
		width: 200px;
		height: 200px;
		padding: 10px;
		vertical-align: middle;
		object-fit: cover;
	}
	.text {
		font-size: 15px;
		font-family: "G마켓 산스 TTF Medium";
	}
	.text:hover {
		color: #FF6833;
		cursor: pointer;
	}
	.btnTd {
		text-align: right;
		padding-right: 5px;
		border-top: 3px solid #FF6833;
		border-bottom: 3px solid #FF6833;
	}
	
	.btnimg {
		width: 23px;
		hight: 19px;
		vertical-align: middle;
	}
	
	.priceText {
		text-align: left;
		margin-bottom: 0px;
		margin-left: 20px;
	}
	
	.btnimg2 {
		width: 18px;
		hight: 17px;
		vertical-align: middle;
	}
	
	.priceText2 {
		margin-top: 0px;
		text-align: left;
		font-size: 8px;
		color: #9E9E9E;
		margin-left: 20px;
	}
	
	#pagingArea {
		text-align: center; 
		margin-top: 15px;
		margin-bottom: 15px;
	}

	#pagingArea > button {
		font-size: 10px;
	}

</style>
</head>
<body>
	<c:import url="../common/gnb.jsp"/>
	<div class="outer">
		<!-- 사이드 메뉴 -->
		<div class="sideMenu">
	    	<div class="profile">
				<%--  <img src="<%=request.getContextPath()%>/Image/LogoImage.png" onclick="goHome();"> --%>
				<img class="profileImg" src="${ pageContext.servletContext.contextPath }/resources/images/board/a.PNG">
				<p class="nickname"> 앤 해서웨이 </p>
				
			</div>
			<div class="sideMenuList">
				<ul class="sideMenuUl">
					<li class="sideMenuLi">
						<button onclick="" class="sideMenuBtn" id="selectedBtn">활동 목록 관리</button>
					</li>
					<li class="sideMenuLi">
						<button onclick="" class="sideMenuBtn" onclick="location.href='productView.wr'">상품 목록 관리</button>
					</li>
					<li class="sideMenuLi">
						<button onclick="" class="sideMenuBtn">주문 내역 관리</button>
					</li>
					<li class="sideMenuLi">
						<button onclick="" class="sideMenuBtn">고객 문의 관리</button>
					</li>
				</ul>
			</div>
		</div>
		<div class="MainLogoText">
			<p class="MainText">
				스타 활동 전체보기
				<span class="insertArea"><button class="insertBtn" onclick="location.href='activityInsertForm.wr'">활동등록</button></span>
			</p>
		</div>
		<div class="content">
			
			<table class="mainTable">
				<!-- 최근 참여한 활동 -->
				
				<!-- 반복문 사용 -->
				<tr>
					<td class="imgTd">
						<img class="img" src="${ pageContext.servletContext.contextPath }/resources/images/board/tennis1.jpg">
						<p class="text">
							[운동] 같이하는 테니스 일일레슨
						</p>
						<p class="priceText"><img class="btnimg" src="${ pageContext.servletContext.contextPath }/resources/images/board/button1.PNG" align="middle">50,000원</p>
						<p class="priceText2"><img class="btnimg2" src="${ pageContext.servletContext.contextPath }/resources/images/board/star1.PNG" align="middle">4.8 1891개의 평가</p>
					</td>
					<td class="imgTd">
						<img class="img" src="${ pageContext.servletContext.contextPath }/resources/images/board/tennis1.jpg">
						<p class="text">
							[운동] 같이하는 테니스 일일레슨
						</p>
						<p class="priceText"><img class="btnimg" src="${ pageContext.servletContext.contextPath }/resources/images/board/button1.PNG" align="middle">50,000원</p>
						<p class="priceText2"><img class="btnimg2" src="${ pageContext.servletContext.contextPath }/resources/images/board/star1.PNG" align="middle">4.8 1891개의 평가</p>
					</td>
					<td class="imgTd">
						<img class="img" src="${ pageContext.servletContext.contextPath }/resources/images/board/tennis1.jpg">
						<p class="text">
							[운동] 같이하는 테니스 일일레슨
						</p>
						<p class="priceText"><img class="btnimg" src="${ pageContext.servletContext.contextPath }/resources/images/board/button1.PNG" align="middle">50,000원</p>
						<p class="priceText2"><img class="btnimg2" src="${ pageContext.servletContext.contextPath }/resources/images/board/star1.PNG" align="middle">4.8 1891개의 평가</p>
					</td>
				</tr>
				<tr>
					<td class="imgTd">
						<img class="img" src="${ pageContext.servletContext.contextPath }/resources/images/board/tennis1.jpg">
						<p class="text">
							[운동] 같이하는 테니스 일일레슨
						</p>
						<p class="priceText"><img class="btnimg" src="${ pageContext.servletContext.contextPath }/resources/images/board/button1.PNG" align="middle">50,000원</p>
						<p class="priceText2"><img class="btnimg2" src="${ pageContext.servletContext.contextPath }/resources/images/board/star1.PNG" align="middle">4.8 1891개의 평가</p>
					</td>
					<td class="imgTd">
						<img class="img" src="${ pageContext.servletContext.contextPath }/resources/images/board/tennis1.jpg">
						<p class="text">
							[운동] 같이하는 테니스 일일레슨
						</p>
						<p class="priceText"><img class="btnimg" src="${ pageContext.servletContext.contextPath }/resources/images/board/button1.PNG" align="middle">50,000원</p>
						<p class="priceText2"><img class="btnimg2" src="${ pageContext.servletContext.contextPath }/resources/images/board/star1.PNG" align="middle">4.8 1891개의 평가</p>
					</td>
					<td class="imgTd">
						<img class="img" src="${ pageContext.servletContext.contextPath }/resources/images/board/tennis1.jpg">
						<p class="text">
							[운동] 같이하는 테니스 일일레슨
						</p>
						<p class="priceText"><img class="btnimg" src="${ pageContext.servletContext.contextPath }/resources/images/board/button1.PNG" align="middle">50,000원</p>
						<p class="priceText2"><img class="btnimg2" src="${ pageContext.servletContext.contextPath }/resources/images/board/star1.PNG" align="middle">4.8 1891개의 평가</p>
					</td>
				</tr>
			</table>
			<div id="pagingArea">
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
			</div>
		</div>
	</div>
</body>
</html>