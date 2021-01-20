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
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
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
		display: none;
		position: absolute;
		top: 0px;
		left: 200px;
		background: #F4F4F4;
		border: 1px solid #DCDCDC;
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
		text-align: center;
		border-top: 2px solid #FF6833;
		border-bottom: 2px solid #FF6833;
	}
	.button {
		width: 80px;
		padding: 5px;
		padding-bottom: 2px;
		border: 1px solid #C4C4C4;
		background: white;
		font-family: "Gmarket Sans TTF";
		cursor: pointer;
		outline: 0;
	}
	.button:hover {
		background: #FF6833;
		color: white;
		cursor: pointer;
	}
	#wrap {
		display: table-cell;
		margin: 0;
		padding: 0;
		width: 750px;
		height: 460px;
		vertical-align: middle;
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
		width: 25%;
		height: 40px;
		line-height: 40px; /* 중앙정렬 */
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
	#title {
		font-size: 22px;
		margin: 0px;
		padding: 10px;
	}
	table {
		margin-left: auto;
		margin-right: auto;
		border-collapse: collapse;
	}
	.tdContent {
		border: 1px solid #C4C4C4;
		text-align: left;
	}
	.tdCheck {
		padding: 10px;
	}
	.warnTitle {
		text-align: center;
		margin: 0px;
		padding: 25px;
		font-size: 18px;
	}
	.warnContent1 {
		margin: 0px;
		padding: 0px 25px 5px 25px;
		font-size: 14px;
	}
	.warnContent2 {
		margin: 0px;
		padding: 0px 25px 25px 25px;
		font-size: 14px;
	}
	input[id="leaveCheck"] {
		display: none;
	}
	input[id="leaveCheck"]+label {
		display: inline-block;
		width: 15px;
		height: 15px;
		border: 1px solid #bcbcbc;
		cursor: pointer;
		vertical-align: middle;
	}
	input[id="leaveCheck"]:checked+label {
		background:
			url(${ pageContext.servletContext.contextPath }/resources/images/myPage/check.png);
	}
	#agree {
		padding: 5px;
		font-size: 14px;
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
						<button class="sideMenuBtn" style="cursor: default;" id="selectedBtn">개인정보 관리</button>
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
								<button onclick="location.href='memberDeleteView.me'" class="sideMenuBtn" id="selectedBtn">회원 탈퇴</button>
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
						<button class="sideMenuBtn" style="cursor: default;">찜 목록</button>
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
		            		<button class="sideMenuBtn">스타 신청</button>
		            	</c:if>
		            	<c:if test="${ loginUser.memLevel == 1 }">
		            		<button onclick="location.href='wookroomView.wr'" class="sideMenuBtn">작업실</button>
		            	</c:if>
					</li>
				</ul>
			</div>
		</div>
		<form action="myInfoPwdCheck.me" method="post" autocomplete="off">
			<div class="content">
				<div class="tab-box">
					<ul>
						<li onclick="location.href='myInfoPwdCheckView.me'">개인정보 변경</li>
						<li onclick="location.href='myPwdUpdateView.me'">비밀번호 변경</li>
						<li onclick="location.href=''">프로필사진 변경</li>
						<li onclick="location.href='memberDeleteView.me'" class="selected">회원 탈퇴</li>
					</ul>
				</div>
				<div id="wrap">
					<p id="title">회원 탈퇴</p>
					<table>
						<tr>
							<td class="tdContent">
								<p class="warnTitle">지금까지 이용해주셔서 감사드립니다. 탈퇴하기 전 아래 유의사항을
									확인해주세요.</p>
								<p class="warnContent1">- 탈퇴하신 아이디는 복구가 불가능하며, 추후 동일한 아이디로
									재가입이 되지 않습니다.</p>
								<p class="warnContent2">- 회원 탈퇴 시 등록한 게시물은 삭제되지 않으므로, 삭제를
									원하시면 회원 탈퇴 전에 삭제해 주시기 바랍니다.</p>
							</td>
						</tr>
						<tr>
							<td class="tdCheck">
								<!-- <input type="checkbox" id="leaveCheck">유의사항을 모두 확인했으며, 이에 동의합니다. -->
								<input type="checkbox" id="leaveCheck"> <label
								for="leaveCheck"></label><span id="agree">유의사항을 모두 확인했으며, 이에 동의합니다.</span>
							</td>
						</tr>
					</table>
					<button type="button" class="button"
						onclick="location.href='myPageMainView.me'">취소</button>
					<button type="button" class="button" onclick="checkValidate(this)">탈퇴</button>
				</div>
			</div>
		</form>
	</div>
	
	<c:import url="../common/footer.jsp"/>

	<script>
		function checkValidate(leaveChk) {
			console.log(leaveChk);
			var check = document.getElementById('leaveCheck').checked;
			
			if(check) {
				var bool = confirm('정말 회원 탈퇴를 하시겠습니까?');
				
				if(bool) {
					location.href='mdelete.me';
				}
			} else {
				alert('유의사항을 확인하고 동의해 주세요.');
				return false;
			}
		}
	</script>
</body>
</html>