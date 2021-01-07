<!--
	메인컬러 - #FF6833
	메인폰트 - font-family: "Gmarket Sans TTF";
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
		margin: 0;
	}
	
	.outer {
		margin-top: 50px;
		margin-bottom: 50px;
		margin-left: auto;
		margin-right: auto;
		overflow:hidden;
		position:relative;
		width:1000px;
		font-family: "Gmarket Sans TTF";
	}

/* 사이드 메뉴 */	
	.sideMenu {
		position:absolute;
		top:0px;
		left:0px;
		bottom:0px;
		width:200px;
		background: #F4F4F4;
	}
	.profile {
		padding: 25px;
	}
	.profileImg {
		width: 150px;
		height: 150px;
		border-radius: 50%;
		overflow: hidden;
		object-fit: cover;
	}
	.nickname {
		text-align: center;
		font-size: 14px;
	}
	.sideMenuList{
		text-align: center;
		list-style: none;
	}
	.sideMenuUl {
		list-style:none;
		padding-left: 0px;
	}
	.sideMenuBtn {
		font-family: "Gmarket Sans TTF";
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
		min-height: 480px;
		margin-left: 250px;
	}
	.headline {
		height: 50px;
		background: #FF6833;
	}
	.title {
		display: inline-block;
		color: white;
		margin: 12px;
		font-size: 26px;
		width: 650px;
	}
	.more {
		display: inline-block;
		color: white;
		font-size: 14px;
	}
	.more:hover {
		color: black;
		cursor: pointer;
	}
	.imgDiv {
		display: inline-block;
		width: 140px;
		height: 140px;
		vertical-align: middle;
	}
	.img {
		display: table-cell;
		width: 100px;
		height: 100px;
		padding: 20px;
		object-fit: cover;
		vertical-align: middle;
	}
	.textDiv {
		margin: 0;
		display: inline-block;
		vertical-align: middle;
	}
	.actArea, .proArea {
		min-height: 160px;
	}
	.act, .pro {
		height: 140px;
	}
	.act:hover, .pro:hover {
		opacity: 0.6;
		cursor: pointer;
	}
	.starArea {
		min-height: 160px;
	}
	.star {
		padding-top: 40px;
		vertical-align: middle;
		display: inline-block;
		width: 146px;
		height: 175px;
	}
	.star:hover {
		opacity: 0.6;
		cursor: pointer;
	}
	.starImg {
		margin-left: 23px;
		width: 100px;
		height: 100px;
		border-radius: 90%;
		object-fit: cover;
	}
	.starName {
		text-align: center;
		margin-left: 23px;
		width: 100px;
	}
	.nothing {
		height: 22px;
		margin: 0;
		padding-top: 44px;
		text-align: center;
		font-size: 24px;
	}
	.line {
		border: 1px solid #FF6833;
		margin: 0px;
	}
</style>
</head>
<body>
	<c:import url="../common/gnb.jsp"/>
	
	<div class="outer">
		<!-- 사이드 메뉴 -->
		<div class="sideMenu">
	    	<div class="profile">
				<img class="profileImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/a.jpg">
				<p class="nickname"> <c:out value="${ loginUser.memName }님"/> </p>
			</div>
			<div class="sideMenuList">
				<ul class="sideMenuUl">
					<li class="sideMenuLi">
						<button onclick="location.href='myPurView.me'" class="sideMenuBtn">구매내역</button>
					</li>
					<li class="sideMenuLi">
						<button onclick="location.href='myFavView.me'" class="sideMenuBtn" id="selectedBtn">찜 목록</button>
					</li>
					<li class="sideMenuLi">
						<button onclick="location.href='myInfoView.me'" class="sideMenuBtn">개인정보 관리</button>
					</li>
					<li class="sideMenuLi">
						<button onclick="#" class="sideMenuBtn">스타 신청</button>
					</li>
				</ul>
			</div>
		</div>
		<div class="content">
			<div class="actArea">
				<div class="headline">
					<p class="title">찜한 활동</p>
				<!-- 찜한 활동이 있는 경우 표시 -->
					<p class="more" id="moreAct" onclick="location.href='myFavActView.me'">더 보기 ></p>
				</div>
			<!-- 찜한 활동이 없는 경우 -->
				<!-- <p class="nothing">찜한 활동이 없습니다.</p> -->
			<!-- 찜한 활동이 있는 경우 반복문 시작 -->
				<div class="act">
					<div class="imgDiv">
						<img class="img" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/surfing.jpg">
					</div>
					<div class="textDiv">
						<p class="text">
							강릉 겨울서핑 & 렌탈권<br><br>
							2020.12.14<br><br>
							35,000 원
						</p>
					</div>
				</div>
				<hr class="line">
				<div class="act">
					<div class="imgDiv">
						<img class="img" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/flower.png">
					</div>
					<div class="textDiv">
						<p class="text">
							인테리어소품 드라이리스 만들기<br><br>
							2020.11.21<br><br>
							39,000 원
						</p>
					</div>
				</div>
				<hr class="line">
				<div class="act">
					<div class="imgDiv">
						<img class="img" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/drawing.jpg">
					</div>
					<div class="textDiv">
						<p class="text">
							힐링하며 그리는 유화 원데이 클래스<br><br>
							2020.10.01<br><br>
							25,000 원
						</p>
					</div>
				</div>
				<hr class="line">
			<!-- 반복문 종료 -->
			</div>
			
			<div class="proArea">
				<div class="headline">
					<p class="title">찜한 상품</p>
				<!-- 찜한 상품이 있는 경우 표시 -->	
					<p class="more" id="morePro" onclick="location.href='myFavProView.me'">더 보기 ></p>
				</div>
			<!-- 찜한 상품이 없는 경우 -->
				<!-- <p class="nothing">찜한 상품이 없습니다.</p> -->
			<!-- 찜한 상품이 있는 경우 반복문 시작 -->
				<div class="pro">
					<div class="imgDiv">
						<img class="img" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/cookie.jpg">
					</div>
					<div class="textDiv">
						<p class="text">
							크리스마스 쿠키 디저트<br><br>
							2020.12.15<br><br>
							14,000 원
						</p>
					</div>
				</div>
				<hr class="line">
				<div class="pro">
					<div class="imgDiv">
						<img class="img" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/muffler.jpg">
					</div>
					<div class="textDiv">
						<p class="text">
							부들부들 뜨개질 목도리<br><br>
							2020.12.04<br><br>
							25,000 원
						</p>
					</div>
				</div>
				<hr class="line">
				<div class="pro">
					<div class="imgDiv">
						<img class="img" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/wallet.jpg">
					</div>
					<div class="textDiv">
						<p class="text">
							이니셜 각인 심플반지갑<br><br>
							2020.09.07<br><br>
							39,200 원
						</p>
					</div>
				</div>
				<hr class="line">
			<!-- 반복문 종료 -->
			</div>
			
			<div class="starArea">
				<div class="headline">
					<p class="title">찜한 스타</p>
				<!-- 찜한 스타가 있는 경우 표시 -->	
					<p class="more" id="moreStar" onclick="location.href='myFavStarView.me'">더 보기 ></p>
				</div>
			<!-- 찜한 스타가 없는 경우 -->
				<!-- <p class="nothing">찜한 스타가 없습니다.</p> -->
			<!-- 찜한 스타가 있는 경우 반복문 시작 -->
				<div class="star">
					<img class="starImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/star1.jpg">
					<p class="starName">헤르미온느</p>
				</div>
				<div class="star">
					<img class="starImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/star2.jpg">
					<p class="starName">토니스타크</p>
				</div>
				<div class="star">
					<img class="starImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/star3.jpg">
					<p class="starName">다스베이더</p>
				</div>
				<div class="star">
					<img class="starImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/star4.jpg">
					<p class="starName">올라프</p>
				</div>
				<div class="star">
					<img class="starImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/default.jpg">
					<p class="starName">최대여섯글자</p>
				</div>
				<hr class="line">
			<!-- 반복문 종료 -->
			</div>
		<!-- 찜한 스타가 없는 경우 -->	
			<!-- <hr class="line"> -->
		</div>
	</div>
</body>
</html>