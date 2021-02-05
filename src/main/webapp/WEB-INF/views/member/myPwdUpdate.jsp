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
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="resources/js/member/jquery.validate.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
		margin: 0;
		overflow:scroll;
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
		padding: 25px 25px 23px 25px;
	}
	.profileDiv {
		position: relative;
		margin-left: auto;
		margin-right: auto;
		width: 146px;
		height: 146px;
		border-radius: 90%;
		overflow: hidden;
		border: 2px solid gray;
		background: black;
	}
	.profileImg {
		position: absolute;
	    margin: auto;
	    width: 146px;
	    height: auto;
	    left: -100%;
	    right: -100%;
	    top: -100%;
	    bottom: -100%;
	}
	.nickname {
		margin: 0;
		padding-top: 10px;
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
	.sideMenuUl > li ul.qnaDropdown {
		list-style: none;
		display: none;
		position: absolute;
		top: 150px;
		left: 200px;
		background: #F4F4F4;
		border: 1px solid #DCDCDC;
		z-index: 1;
	}
	.sideMenuUl > li ul.reviewDropdown {
		list-style: none;
		display: none;
		position: absolute;
		top: 200px;
		left: 200px;
		background: #F4F4F4;
		border: 1px solid #DCDCDC;
		z-index: 1;
	}
	.sideMenuUl > li:hover ul.myinfoDropdown,
	.sideMenuUl > li:hover ul.purDropdown,
	.sideMenuUl > li:hover ul.favDropdown,
	.sideMenuUl > li:hover ul.qnaDropdown,
	.sideMenuUl > li:hover ul.reviewDropdown {
		display: block;
	}
	.sideMenuUl > li ul.myinfoDropdown > li
	.sideMenuUl > li ul.purDropdown > li,
	.sideMenuUl > li ul.favDropdown > li,
	.sideMenuUl > li ul.qnaDropdown > li,
	.sideMenuUl > li ul.reviewDropdown > li {
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
		min-height: 550px;
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
	#title {
		font-size: 22px;
		margin: 0px;
		padding: 10px;
	}
	#text {
		font-size: 12px;
		margin: 0px;
		padding: 0px 10px 10px 10px;
	}
	table {
		margin-left: auto;
		margin-right: auto;
		border-collapse: collapse;
	}
	.tdName {
		border: 1px solid #C4C4C4;
		width: 120px;
		text-align: left;
		background: #F4F4F4;
		padding: 5px;
	}
	.tdContent {
		border: 1px solid #C4C4C4;
		width: 320px;
		text-align: left;
		padding: 5px;
	}
	.inputPwdField {
		width: 314px;
		outline: 0;
		border: none;
	}
	label.error {
		/* position: absolute;
		left: 760px; */
		font-family: 'GmarketSansLight';
		font-weight: bold;
		color: rgb(59, 59, 59);
		font-size: 0.7rem;
		padding-bottom: 0.4rem;
		line-height: 0.9rem;
		color: #FF6833;
	}
	/* #memPwd-error{
		top: 297px;
	}
	#pwdCheck-error{
		top: 329px;
	} */
	input.error {
		border: 1px solid #FF6833;
	}
	#wrap {
		display: table-cell;
		margin: 0;
		padding: 0;
		width: 750px;
		height: 510px;
		vertical-align: middle;
	}
</style>
</head>
<body>
	<c:import url="../common/gnb.jsp"/>
	
	<div class="outer">
		<!-- 사이드 메뉴 -->
		<div class="sideMenu">
	    	<div class="profile">
    			<div class="profileDiv">
					<c:if test="${ empty img }">
						<img class="profileImg" name="profileImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/basic.png">
    				</c:if>
    				<c:if test="${ !empty img }">
    					<c:if test="${ img.imgStatus == 'Y' }">
							<img class="profileImg" name="profileImg" src="${ pageContext.servletContext.contextPath }/resources/piUploadFiles/${ img.imgName }">
	    				</c:if>
	    				<c:if test="${ img.imgStatus == 'N' }">
							<img class="profileImg" name="profileImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/basic.png">
	    				</c:if>
    				</c:if>
    			</div>
				<p class="nickname"> <c:out value="${ loginUser.memName } 님"/> </p>
				<p class="nickname"> <c:out value="(${ loginUser.memNickname })"/> </p>
			</div>
			<div class="sideMenuList">
				<ul class="sideMenuUl">
					<li>
						<button onclick="location.href='myPageMainView.me'" class="sideMenuBtn" id="selectedBtn">개인정보 관리</button>
						<ul class="myinfoDropdown">
							<li>
								<button onclick="location.href='myInfoPwdCheckView.me'" class="sideMenuBtn">개인정보 변경</button>
							</li>
							<li>
								<button onclick="location.href='myPwdUpdateView.me'" class="sideMenuBtn" id="selectedBtn">비밀번호 변경</button>
							</li>
							<li>
								<button onclick="location.href='profileImageUpdateView.me'" class="sideMenuBtn">프로필사진 변경</button>
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
						<button class="sideMenuBtn" style="cursor: default;">문의 목록</button>
						<ul class="qnaDropdown">
							<li>
								<button onclick="location.href=''" class="sideMenuBtn">고객 문의</button>
							</li>
							<li>
								<button onclick="location.href=''" class="sideMenuBtn">활동 문의</button>
							</li>
							<li>
								<button onclick="location.href=''" class="sideMenuBtn">상품 문의</button>
							</li>
						</ul>
					</li>
					<li>
						<button class="sideMenuBtn" style="cursor: default;">후기 목록</button>
						<ul class="reviewDropdown">
							<li>
								<button onclick="location.href='myRevActListView.me'" class="sideMenuBtn">활동 후기</button>
							</li>
							<li>
								<button onclick="location.href='myRevProListView.me'" class="sideMenuBtn">상품 후기</button>
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
		<form id="join" action="myPwdUpdate.me" method="post">
			<div class="content">
				<div class="tab-box">
					<ul>
						<li onclick="location.href='myInfoPwdCheckView.me'">개인정보 변경</li>
						<li onclick="location.href='myPwdUpdateView.me'" class="selected">비밀번호 변경</li>
						<li onclick="location.href='profileImageUpdateView.me'">프로필사진 변경</li>
						<li onclick="location.href='memberDeleteView.me'">회원 탈퇴</li>
					</ul>
				</div>
				<div id="wrap">
					<p id="title">
						비밀번호 변경
					</p>
					<p id="text">
						비밀번호는 8자~20자 이내여야 하고, 영문자/특수문자/숫자가 반드시 하나 이상 포함되어야 합니다.
					</p>
					<table>
						<tr>
							<td class="tdName">
								현재 비밀번호
							</td>
							<td class="tdContent">
								<input type="password" class="inputPwdField" name="beforePwd">
							</td>
						</tr>
						<tr>
							<td class="tdName">
								새 비밀번호
							</td>
							<td class="tdContent">
								<input type="password" class="inputPwdField" name="memPwd">
							</td>
						</tr>
						<tr>
							<td class="tdName">
								새 비밀번호 확인
							</td>
							<td class="tdContent">
								<input type="password" class="inputPwdField" name="pwdCheck">
							</td>
						</tr>
					</table>
					<button type="button" class="button" onclick="location.href='myPageMainView.me'">취소</button>
					<button type="submit" class="button">확인</button>
				</div>
			</div>
		</form>
	</div>
	
	<c:import url="../common/footer.jsp"/>

	<script>
		$.validator.addMethod("checkPwd", function(value, element) {
			return this.optional(element) || /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[*:;\\"\\'\-_!@#$%^&~`₩+=\\(\\)/?\{\}\[\]])./g.test(value);
		},"영문자, 숫자, 특수문자가 반드시 1자 이상 포함되어있어야 합니다.");
		
		$.validator.addMethod("pwdCheck",  function( value, element ) {
			return this.optional(element) || /^.(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).$/.test(value);
		});
		
		$('#join').validate({
			rules : {
				memPwd : {
					required : true,
					minlength : 8,
					maxlength : 20,
					checkPwd : true
				},
				pwdCheck : {
					required : true,
					equalTo : "[name='memPwd']"
				},
			},
			messages : {
				memPwd : {
					required : "비밀번호는 필수 입력입니다.",
					minlength : "비밀번호는 8자 이상이어야 합니다.",
					maxlength : "비밀번호는 20자 이내여야 합니다.",
				},
				pwdCheck : {
					required : "비밀번호를 한 번 더 확인해주세요.",
					equalTo : "비밀번호가 일치하지 않습니다."
				},
			}
		});
	</script>
</body>
</html>