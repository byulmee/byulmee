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
	table {
		width: 750px;
		border-collapse: collapse;
	}
	table td {
		border-bottom: 2px solid #F4F4F4;
	}
	table tr:last-child td {
		border: 0;
	}
	.profileTd {
		width: 200px;
		height: 501px;
		background: #F4F4F4;
	}
	.colNameTd {
		padding-left: 5px;
		text-align: left;
		width: 130px;
	}
	.alert_gray {
		font-size: 14px;
		color: #C4C4C4;
	}
	.alert_orange {
		font-size: 14px;
		color: #FF6833;
	}
	.colContentTd {
		text-align: left;
		width: 420px;
	}
	.colContentTd_btn {
		padding-right: 5px;
		text-align: right;
	}
	.input {
		outline: 0;
		border: 1px solid #9F9F9F;
		height: 23px;
		width: 200px;		
	}
	#post {
		outline: 0;
		border: 1px solid #9F9F9F;
		height: 23px;
		width: 40px;		
	}
	#address1 {
		outline: 0;
		border: 1px solid #9F9F9F;
		height: 23px;
		width: 360px;		
	}
	#address2 {
		outline: 0;
		border: 1px solid #9F9F9F;
		height: 23px;
		width: 410px;		
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
		<div class="content">
			<table>
				<tr>
					<td rowspan="9" class="profileTd">
						<img class="profileImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/a.jpg">
						<button class="button" onclick="">사진 변경</button>
						<button class="button" onclick="">사진 삭제</button>
					</td>
					<td class="colNameTd">
						아이디
					</td>
					<td class="colContentTd">
						<input type="text" name="id" id="id" class="input">
					</td>
				</tr>
				<tr>
					<td class="colNameTd">
						이름
					</td>
					<td class="colContentTd">
						<input type="text" name="name" id="name" class="input">
					</td>
				</tr>
				<tr>
					<td class="colNameTd">
						닉네임
					</td>
					<td class="colContentTd">
						<input type="text" name="nickname" id="nickname" class="input">
						<a class="alert_gray">사용 가능한 닉네임입니다.</a>
					</td>
				</tr>
				<!-- <tr>
					<td class="colNameTd">
						새 비밀번호
					</td>
					<td class="colContentTd">
						<input type="password" name="newPwd" id="newPwd" class="input">
					</td>
				</tr>
				<tr>
					<td class="colNameTd">
						새 비밀번호 확인
					</td>
					<td class="colContentTd">
						<input type="password" name="newPwdCheck" id="newPwdCheck" class="input">
						<a class="alert_orange">비밀번호가 일치하지 않습니다.</a>
					</td>
				</tr> -->
				<tr>
					<td class="colNameTd">
						이메일
					</td>
					<td class="colContentTd">
						<input type="text" name="email" id="email" class="input">
						<a class="alert_orange">중복된 이메일 주소입니다.</a>
					</td>
				</tr>
				<tr>
					<td class="colNameTd">
						휴대전화
					</td>
					<td class="colContentTd">
						<input type="text" name="phone" id="phone" class="input">
						<button class="button" onclick="">인증</button>
					</td>
				</tr>
				<tr>
					<td rowspan="2" class="colNameTd">
						주소
						<button type="button" class="button" id="postcodify_search_button">검색</button>
					</td>
					<td class="colContentTd" style="border:0">
						<input type="text" name="post" id="post" class="postcodify_postcode5" value="" size="6">
						<input type="text" name="address1" id="address1" class="postcodify_address" value="">
					</td>
				</tr>
				<tr>
					<td class="colContentTd">
						<input type="text" name="address2" id="address2" class="postcodify_extra_info" value="">
					</td>
				</tr>
				<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
				<script>
					$(function(){
						$("#postcodify_search_button").postcodifyPopUp();
					});
				</script>
				<tr>
					<td class="colNameTd">
					</td>
					<td class="colContentTd_btn">
						<button class="button" onclick="">회원 탈퇴</button>
						<button class="button" onclick="">비밀번호 변경</button>
						<button class="button" onclick="">개인정보 변경</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	<c:import url="../common/footer.jsp"/>
</body>
</html>