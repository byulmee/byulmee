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
		text-align: center;
		border-top: 2px solid #FF6833;
		border-bottom: 2px solid #FF6833;
	}
	.button {
		padding: 5px;
		padding-bottom: 2px;
		border: 1px solid #9F9F9F;
		background: white;
		font-size: 15px;
		font-family: "Gmarket Sans TTF";
		cursor:pointer;
		outline: 0;
	}
	.button:hover {
		background: #FF6833;
		color: white;
		cursor: pointer;
	}
	#logoNText {
		padding-top: 150px;
	}
	#logo {
		height: 60px;
		width: auto;
	}
	#inputPwdField {
		outline: 0;
		border: 1px solid #9F9F9F;
		height: 23px;
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
						<button onclick="location.href='myFavView.me'" class="sideMenuBtn">찜 목록</button>
					</li>
					<li class="sideMenuLi">
						<button onclick="location.href='myInfoView.me'" class="sideMenuBtn" id="selectedBtn">개인정보 관리</button>
					</li>
					<li class="sideMenuLi">
						<button onclick="#" class="sideMenuBtn">스타 신청</button>
					</li>
				</ul>
			</div>
		</div>
		<form id="myInfoPwdCheck" action="myInfoPwdCheck.me" method="post" autocomplete="off">
			<div class="content">
				<div id="logoNText">
					<img id="logo" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/logo.png">
					<p id="text">
						개인 정보 보호를 위해<br>
						비밀번호를 한번 더 입력해주세요.
					</p>
				</div>
				<br>
				<div id="inputPwdFieldDiv">
					<input type="password" id="inputPwdField" name="memPwd">
					<button type="submit" class="button">확인</button>
				</div>
			</div>
		</form>
	</div>
	
	<c:import url="../common/footer.jsp"/>
</body>
</html>