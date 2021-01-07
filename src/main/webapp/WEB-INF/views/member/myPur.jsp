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
		overflow: hidden;
		position: relative;
		width: 1000px;
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
		width: 500px;
		margin: 0;
		display: inline-block;
		vertical-align: middle;
	}
	.btnDiv {
		width: 90px;
		display: inline-block;
		vertical-align: middle;
	}
	.button {
		margin: 5px;
		padding: 5px;
		padding-bottom: 2px;
		border: 1px solid #9F9F9F;
		background: white;
		font-size: 15px;
		font-family: "Gmarket Sans TTF";
		cursor: pointer;
		outline: 0;
		vertical-align: middle;
	}
	.button:hover {
		background: #FF6833;
		color: white;
		cursor: pointer;
	}
	.button:disabled {
		background: gray;
		color: white;
		cursor: default;
	}
	.actArea, .proArea {
		min-height: 240px;
	}
	.act, .pro {
		display: inline-block;
		height: 140px;
	}
	.act:hover, .pro:hover {
		opacity: 0.6;
		cursor: pointer;
	}
	.nothing {
		height: 22px;
		margin: 0;
		padding-top: 81.5px;
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
						<button onclick="location.href='myInfoView.me'" class="sideMenuBtn" id="selectedBtn">개인정보 관리</button>
					</li>
					<li>
						<button class="dropdownBtn">구매내역</button>
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
						<button class="dropdownBtn">찜 목록</button>
						<ul class="favDropdown">
							<li>
								<button onclick="location.href='myFavActView.me'" class="sideMenuBtn">찜한 활동</button>
							</li>
							<li>
								<button onclick="location.href='myFavProView.me'" class="sideMenuBtn">찜한 상품</button>
							</li>
							<li>
								<button onclick="location.href='myFavStarView.me'" class="sideMenuBtn">찜한 스타</button>
							</li>
						</ul>
					</li>
					<li>
						<c:if test="${ loginUser.memLevel == 0 }">
		            		<button onclick="#" class="sideMenuBtn">스타 신청</button>
		            	</c:if>
		            	<c:if test="${ loginUser.memLevel == 1 }">
		            		<button onclick="#" class="sideMenuBtn">작업실</button>
		            	</c:if>
					</li>
				</ul>
			</div>
			<%-- <div class="sideMenuList">
				<ul class="sideMenuUl">
					<li class="sideMenuLi">
						<button onclick="location.href='myPurView.me'" class="sideMenuBtn" id="selectedBtn">구매내역</button>
					</li>
					<li class="sideMenuLi">
						<button onclick="location.href='myFavView.me'" class="sideMenuBtn">찜 목록</button>
					</li>
					<li class="sideMenuLi">
						<button onclick="location.href='myInfoView.me'" class="sideMenuBtn">개인정보 관리</button>
					</li>
					<li class="sideMenuLi">
						<c:if test="${ loginUser.memLevel == 0 }">
		            		<button onclick="#" class="sideMenuBtn">스타 신청</button>
		            	</c:if>
		            	<c:if test="${ loginUser.memLevel == 1 }">
		            		<button onclick="#" class="sideMenuBtn">작업실</button>
		            	</c:if>
					</li>
				</ul>
			</div> --%>
		</div>
		<div class="content">
			<div class="actArea">
				<div class="headline">
					<p class="title">신청한 활동</p>
				<!-- 신청한 활동이 있는 경우 표시 -->
					<p class="more" id="moreAct" onclick="location.href='myPurActView.me'">더 보기 ></p>
				</div>
			<!-- 신청한 활동이 없는 경우 -->
				<!-- <p class="nothing">신청한 활동이 없습니다.</p> -->
			<!-- 신청한 활동이 있는 경우 반복문 시작 -->
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
				<div class="btnDiv">
					<button class="button" onclick="#">문의하기</button>
					<button class="button" onclick="#">리뷰작성</button>
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
				<div class="btnDiv">
					<button class="button" onclick="#">문의하기</button>
					<button class="button" onclick="#">리뷰작성</button>
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
				<div class="btnDiv">
					<button class="button" onclick="#">문의하기</button>
					<button class="button" onclick="#" disabled>작성완료</button>
				</div>
				<hr class="line">
			<!-- 반복문 종료 -->
			</div>
			
			<div class="proArea">
				<div class="headline">
					<p class="title">구매한 상품</p>
				<!-- 구매한 상품이 있는 경우 표시 -->
					<p class="more" id="morePro" onclick="location.href='myPurProView.me'">더 보기 ></p>
				</div>
			<!-- 구매한 상품이 없는 경우 -->
					<!-- <p class="nothing">구매한 상품이 없습니다.</p> -->
			<!-- 구매한 상품이 있는 경우 반복문 시작 -->
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
				<div class="btnDiv">
					<button class="button" onclick="#">문의하기</button>
					<button class="button" onclick="#">리뷰작성</button>
					<button class="button" onclick="#">배송조회</button>
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
				<div class="btnDiv">
					<button class="button" onclick="#">문의하기</button>
					<button class="button" onclick="#" disabled>작성완료</button>
					<button class="button" onclick="#" disabled>배송완료</button>
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
				<div class="btnDiv">
					<button class="button" onclick="#">문의하기</button>
					<button class="button" onclick="#" disabled>작성완료</button>
					<button class="button" onclick="#" disabled>배송완료</button>
				</div>
				<hr class="line">
			<!-- 반복문 종료 -->
			</div>
		<!-- 구매한 상품이 없는 경우 -->	
			<!-- <hr class="line"> -->
		</div>
	</div>
	
	<c:import url="../common/footer.jsp"/>
</body>
</html>