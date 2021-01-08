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
	}
	.sideMenuList {
		text-align: center;
	}
	.sideMenuUl {
		list-style: none;
		margin: 0px;
		padding: 0px;
		position: relative;
	}
	.sideMenuUl > li ul.purDropdown {
		display: none;
		position: absolute;
		top: 50px;
		left: 200px;
		background: #F4F4F4;
		border: 1px solid #DCDCDC;
	}
	.sideMenuUl > li ul.favDropdown {
		display: none;
		position: absolute;
		top: 100px;
		left: 200px;
		background: #F4F4F4;
		border: 1px solid #DCDCDC;
	}
	.sideMenuUl > li:hover ul.purDropdown, .sideMenuUl > li:hover ul.favDropdown {
		display: block;
	}
	.sideMenuUl > li ul.purDropdown > li, .sideMenuUl > li ul.favDropdown > li {
		display: inline-block;
		text-align: center;
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
	.dropdownBtn {
		font-family: "Gmarket Sans TTF";
		font-size: 18px;
		padding-top: 5px;
		width: 200px;
		height: 50px;
		outline: 0;
		border: 0;
		background: none;
	}
	.sideMenuBtn:hover, .dropdownBtn:hover {
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
		min-height: 500px;
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
	.starArea {
		min-height: 160px;
	}
	.star {
		padding-top: 40px;
		vertical-align: middle;
		display: inline-block;
		width: 146px;
		height: 185px;
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
					<li>
						<button onclick="location.href='myInfoView.me'" class="sideMenuBtn">개인정보 관리</button>
					</li>
					<li>
						<button class="sideMenuBtn" style="cursor: default;">구매내역</button>
						<ul class="purDropdown">
							<li>
								<button onclick="location.href='myPurActView.me'" class="sideMenuBtn">신청한 활동</button>
							</li>
							<li>
								<button onclick="location.href='myPurProView.me'" class="sideMenuBtn">구매한 상품</button>
							</li>
						</ul>
					</li>
					<li>
						<button class="sideMenuBtn" style="cursor: default;" id="selectedBtn">찜 목록</button>
						<ul class="favDropdown">
							<li>
								<button onclick="location.href='myFavActView.me'" class="sideMenuBtn">찜한 활동</button>
							</li>
							<li>
								<button onclick="location.href='myFavProView.me'" class="sideMenuBtn">찜한 상품</button>
							</li>
							<li>
								<button onclick="location.href='myFavStarView.me'" class="sideMenuBtn" id="selectedBtn">찜한 스타</button>
							</li>
						</ul>
					</li>
					<li>
						<c:if test="${ loginUser.memLevel == 0 }">
		            		<button onclick="#" class="sideMenuBtn">스타 신청</button>
		            	</c:if>
		            	<c:if test="${ loginUser.memLevel == 1 }">
		            		<button onclick="location.href='wookroomView.wr'" class="sideMenuBtn">작업실</button>
		            	</c:if>
					</li>
				</ul>
			</div>
		</div>
		<div class="content">
			<div class="starArea">
				<div class="headline">
					<p class="title">찜한 스타</p>
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
				<div class="star">
					<img class="starImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/default.jpg">
					<p class="starName">스타1</p>
				</div>
				<div class="star">
					<img class="starImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/default.jpg">
					<p class="starName">스타2</p>
				</div>
				<div class="star">
					<img class="starImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/default.jpg">
					<p class="starName">스타3</p>
				</div>
			<!-- 반복문 종료 -->
			</div>
			<hr class="line">
		</div>
	</div>
</body>
</html>