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
		overflow:scroll
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
	.sideMenuUl > li ul.myinfoDropdown {
		list-style: none;
		display: none;
		position: absolute;
		top: 0px;
		left: 200px;
		background: #F4F4F4;
		border: 1px solid #DCDCDC;
	}
	.sideMenuUl > li ul.purDropdown {
		list-style: none;
		display: none;
		position: absolute;
		top: 50px;
		left: 200px;
		background: #F4F4F4;
		border: 1px solid #DCDCDC;
	}
	.sideMenuUl > li ul.favDropdown {
		list-style: none;
		display: none;
		position: absolute;
		top: 100px;
		left: 200px;
		background: #F4F4F4;
		border: 1px solid #DCDCDC;
	}
	.sideMenuUl > li:hover ul.myinfoDropdown,
	.sideMenuUl > li:hover ul.purDropdown,
	.sideMenuUl > li:hover ul.favDropdown {
		display: block;
	}
	.sideMenuUl > li ul.myinfoDropdown > li
	.sideMenuUl > li ul.purDropdown > li,
	.sideMenuUl > li ul.favDropdown > li {
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
		min-height: 500px;
		margin-left: 250px;
		border-top: 2px solid #FF6833;
	}
	ul li {
		list-style-type: none;
	}
	.tab-box {
		width: 750px;
	}
	.tab-box ul {
		height: 40px;
	}
	.tab-box li {
		float: left;
		width: 250px;
		height: 40px;
		line-height: 40px;
		text-align: center;
		font-size: 18px;
		background: #FF6833;
		color: rgba(255, 255, 255, 0.5);
		cursor: pointer;
	}
	.tab-box li:hover {
		background: #FF6833;
		color: rgba(255, 255, 255, 1);
		cursor: pointer;
	}
	.tab-box li.selected {
		color: white;
		background: #FF6833;
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
		text-align: right;
	}
	.xImg {
		padding: 10px;
		width: 15px;
		height: 15px;
		object-fit: cover;
		cursor: pointer;
	}
	.xImg:hover {
		opacity: 0.4;
		cursor: pointer;
	}
	.listArea {
		min-height: 480px;
	}
	.list {
		display: inline-block;
		height: 140px;
	}
	.list:hover {
		opacity: 0.6;
		cursor: pointer;
	}
	#wrap {
		display: table-cell;
		margin: 0;
		padding: 0;
		width: 750px;
		height: 460px;
		vertical-align: middle;
		text-align: center;
		border-bottom: 2px solid #FF6833;
	}
	table {
		margin-left: auto;
		margin-right: auto;
		border-collapse: collapse;
	}
	.nothing {
		width: 100%;
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
						<button onclick="location.href='myPageMainView.me'" class="sideMenuBtn">개인정보 관리</button>
						<ul class="myinfoDropdown">
							<li>
								<button onclick="location.href='myInfoPwdCheckView.me'" class="sideMenuBtn">개인정보 변경</button>
							</li>
							<li>
								<button onclick="location.href='myPwdUpdateView.me'" class="sideMenuBtn">비밀번호 변경</button>
							</li>
							<li>
								<button onclick="location.href=''" class="sideMenuBtn">프로필사진 변경</button>
							</li>
							<li>
								<button onclick="location.href='memberDeleteView.me'" class="sideMenuBtn">회원 탈퇴</button>
							</li>
						</ul>
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
								<button onclick="location.href='myFavActView.me'" class="sideMenuBtn" id="selectedBtn">찜한 활동</button>
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
		            		<button onclick="location.href='wookroomView.wr'" class="sideMenuBtn">작업실</button>
		            	</c:if>
					</li>
				</ul>
			</div>
		</div>
		<div class="content">
			<div class="listArea">
				<div class="tab-box">
					<ul>
						<li onclick="location.href='myFavActView.me'" class="selected">찜한 활동</li>
						<li onclick="location.href='myFavProView.me'">찜한 상품</li>
						<li onclick="location.href='myFavStarView.me'">찜한 스타</li>
					</ul>
				</div>
			<!-- 찜한 활동이 없는 경우 -->
				<!-- <div id="wrap">
					<table>
						<tr>
							<td class="nothing">
								찜한 활동이 없습니다.
							</td>
						</tr>
					</table>
				</div> -->
			<!-- 찜한 활동이 있는 경우 반복문 시작 -->	
				<div class="list" onclick="openModal('modal1')">
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
					<img class="xImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/x.png">
				</div>
				<hr class="line">
				<div class="list">
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
					<img class="xImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/x.png">
				</div>
				<hr class="line">
				<div class="list">
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
					<img class="xImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/x.png">
				</div>
				<hr class="line">
				<div class="list">
					<div class="imgDiv">
						<img class="img" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/leather.jpg">
					</div>
					<div class="textDiv">
						<p class="text">
							감성저격 물성형 입체 가죽공예<br><br>
							2020.09.08<br><br>
							180,000 원
						</p>
					</div>
				</div>
				<div class="btnDiv">
					<img class="xImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/x.png">
				</div>
				<hr class="line">
				<div class="list">
					<div class="imgDiv">
						<img class="img" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/write.jpg">
					</div>
					<div class="textDiv">
						<p class="text">
							또박또박 만년필로 반듯함을 씁니다, 펜글씨 클래스<br><br>
							2020.06.14<br><br>
							169,000 원
						</p>
					</div>
				</div>
				<div class="btnDiv">
					<img class="xImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/x.png">
				</div>
				<hr class="line">
			<!-- 반복문 종료 -->
			</div>
		</div>
	</div>
	
	<c:import url="../common/footer.jsp"/>
</body>
</html>