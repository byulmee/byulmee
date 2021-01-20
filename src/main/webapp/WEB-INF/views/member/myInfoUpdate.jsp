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
		text-align: center;
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
		text-align: center;
		border-top: 2px solid #FF6833;
		border-bottom: 2px solid #FF6833;
	}
	.button {
		width: 80px;
		margin-top: 5px;
		padding: 5px;
		padding-bottom: 2px;
		border: 1px solid #C4C4C4;
		background: white;
		font-family: "Gmarket Sans TTF";
		cursor:pointer;
		outline: 0;
	}
	.button:hover {
		background: #FF6833;
		color: white;
		cursor: pointer;
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
		width: 750px;
		border-collapse: collapse;
	}
	table td {
		border-top: 2px solid #F4F4F4;
		border-bottom: 2px solid #F4F4F4;
	}
	table tr:last-child td {
		border: 0;
	}
	.colNameTd {
		padding-left: 70px;
		text-align: left;
		width: 80px;
		height: 50px;
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
		font-size: 14px;
		text-align: left;
		width: 420px;
	}
	.colContentTd_btn {
		padding: 5px;
		vertical-align: middle;
		text-align: center;
	}
	.input {
		outline: 0;
		border: 1px solid #9F9F9F;
		height: 23px;
		width: 250px;	
	}
	#post {
		outline: 0;
		border: 1px solid #9F9F9F;
		height: 23px;
		width: 60px;		
	}
	#address1 {
		outline: 0;
		border: 1px solid #9F9F9F;
		height: 23px;
		width: 400px;		
	}
	#address2 {
		outline: 0;
		border: 1px solid #9F9F9F;
		height: 23px;
		width: 400px;		
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
								<button onclick="location.href='myInfoPwdCheckView.me'" class="sideMenuBtn" id="selectedBtn">개인정보 변경</button>
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
			<div class="tab-box">
				<ul>
					<li onclick="location.href='myInfoPwdCheckView.me'" class="selected">개인정보 변경</li>
					<li onclick="location.href='myPwdUpdateView.me'">비밀번호 변경</li>
					<li onclick="location.href=''">프로필사진 변경</li>
					<li onclick="location.href='memberDeleteView.me'">회원 탈퇴</li>
				</ul>
			</div>
			<form action="myInfoUpdate.me" method="post">
				<p id="title">개인정보 변경</p>
				<table>
					<tr>
						<td class="colNameTd">
							아이디
						</td>
						<td class="colContentTd">
							${ loginUser.memId }
							<input type="hidden" name="memId" id="id" value="${ loginUser.memId }">
						</td>
					</tr>
					<tr>
						<td class="colNameTd">
							이름
						</td>
						<td class="colContentTd">
							<input type="text" name="memName" id="name" class="input" value="<c:out value="${ loginUser.memName }"/>">
						</td>
					</tr>
					<tr>
						<td class="colNameTd">
							닉네임
						</td>
						<td class="colContentTd">
							<input type="text" name="memNickname" id="nickname" class="input" value="<c:out value="${ loginUser.memNickname }"/>">
							<a class="alert_gray">사용 가능한 닉네임입니다.</a>
						</td>
					</tr>
					<tr>
						<td class="colNameTd">
							이메일
						</td>
						<td class="colContentTd">
							<input type="text" name="memEmail" id="email" class="input" value="<c:out value="${ loginUser.memEmail }"/>">
							<a class="alert_orange">중복된 이메일 주소입니다.</a>
						</td>
					</tr>
					<tr>
						<td class="colNameTd">
							휴대전화
						</td>
						<td class="colContentTd">
							<input type="text" name="memPhone" id="phone" class="input" value="<c:out value="${ loginUser.memPhone }"/>">
							<button class="button" onclick="">인증</button>
						</td>
					</tr>
					<tr>
						<td rowspan="3" class="colNameTd">
							주소
						</td>
						<td class="colContentTd" style="border:0">
							우편번호&nbsp;&nbsp;&nbsp;<input type="text" name="memPostcode" id="post" class="postcodify_postcode5"  value="<c:out value="${ loginUser.memPostcode }"/>">
							<button type="button" class="button" id="postcodify_search_button">검색</button>
						</td>
					</tr>
					<tr>
						<td class="colContentTd" style="border:0">
							기본주소&nbsp;&nbsp;&nbsp;<input type="text" name="memBasicAddr" id="address1" class="postcodify_address"  value="<c:out value="${ loginUser.memBasicAddr }"/>">
						</td>
					<tr>
						<td class="colContentTd">
							상세주소&nbsp;&nbsp;&nbsp;<input type="text" name="memDetailAddr" id="address2" class="postcodify_extra_info"  value="<c:out value="${ loginUser.memDetailAddr }"/>">
						</td>
					</tr>
					<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
					<script>
						$(function(){
							$("#postcodify_search_button").postcodifyPopUp();
						});
					</script>
					<tr>
						<td colspan="2" class="colContentTd_btn">
							<button type="button" class="button" onclick="location.href='myPageMainView.me'">취소</button>
							<button type="submit" class="button">확인</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<c:import url="../common/footer.jsp"/>
</body>
</html>