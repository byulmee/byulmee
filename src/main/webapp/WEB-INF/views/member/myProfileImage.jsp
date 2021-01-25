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
	.profileDiv {
		display: inline-block;
		width: 150px;
		height: 150px;
		border-radius: 90%;
		overflow: hidden;
		border: 2px solid gray;
	}
	.profileImg {
		width: 170px;
		height: auto;
		margin-left: -10px;
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
		height: 40px;
		width: 100px;
		padding: 5px;
		border: 1px solid #C4C4C4;
		background: white;
		color: #747474;
		font-family: "Gmarket Sans TTF";
		font-size: 16px;
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
	table {
		margin-left: auto;
		margin-right: auto;
		border-spacing: 10px;
	}
	td {
		text-align: center;
	}
	#wrap {
		display: table-cell;
		margin: 0;
		padding: 0;
		width: 750px;
		height: 460px;
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
	    		<c:forEach var="i" items="${ img }">
	    			<div class="profileDiv">
						<c:if test="${ i.imgStatus == 'Y' }">
							<img class="profileImg" name="profileImg" src="${ pageContext.servletContext.contextPath }/resources/piUploadFiles/${ i.imgName }">
	    				</c:if>
	    				<c:if test="${ i.imgStatus == 'N' }">
							<img class="profileImg" name="profileImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/basic.png">
	    				</c:if>
	    			</div>
				</c:forEach>
				<p class="nickname"> <c:out value="${ loginUser.memName } (${ loginUser.memNickname }) 님"/> </p>
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
								<button onclick="location.href='myPwdUpdateView.me'" class="sideMenuBtn">비밀번호 변경</button>
							</li>
							<li>
								<button onclick="location.href='profileImageUpdateView.me'" class="sideMenuBtn" id="selectedBtn">프로필사진 변경</button>
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
					<li onclick="location.href='myInfoPwdCheckView.me'">개인정보 변경</li>
					<li onclick="location.href='myPwdUpdateView.me'">비밀번호 변경</li>
					<li onclick="location.href='profileImageUpdateView.me'" class="selected">프로필사진 변경</li>
					<li onclick="location.href='memberDeleteView.me'">회원 탈퇴</li>
				</ul>
			</div>
			<div id="wrap">
				<form action="profileImgInsert.me" method="post" enctype="Multipart/form-data">
					<table>
						<tr>
							<td colspan="3">
								<c:forEach var="i" items="${ img }">
									<div class="profileDiv">
										<c:if test="${ i.imgStatus == 'Y' }">
											<img class="profileImg" name="profileImg" src="${ pageContext.servletContext.contextPath }/resources/piUploadFiles/${ i.imgName }">
					    				</c:if>
					    				<c:if test="${ i.imgStatus == 'N' }">
											<img class="profileImg" name="profileImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/basic.png">
					    				</c:if>
					    			</div>
								</c:forEach>
							</td>
						</tr>
						<tr>
							<td>
								<button type="button" class="button" id="imgDeleteBtn">사진 삭제</button>
							</td>
							<td>
								<button type="button" class="button" id="imgUpdateBtn">사진 변경</button>
							</td>
							<td>
								<button type="submit" class="button">저장</button>
							</td>
						</tr>
					</table>
					<!-- 파일 업로드 부분 / 숨김상태 -->
					<div id="fileArea">
						<input type="file" id="updateImg" multiple="multiple" name="updateImg" onchange="LoadImg(this, 1)">
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<c:import url="../common/footer.jsp"/>
	
	<script>
		$("#imgDeleteBtn").click(function() { // 
			/* $(".profileImg").attr("src", "${ pageContext.servletContext.contextPath }/resources/images/myPage/basic.png"); */
			var bool = confirm("정말 프로필 사진을 삭제하시겠습니까?")
			
			if(bool) {
				location.href='profileImgDeleteView.me';
			}
		});
	</script>
	
	<script>
		// 파일 첨부 창 팝업
		$(function() {
			$("#fileArea").hide(); // 파일 업로드 부분 숨김

			$("#imgUpdateBtn").click(function() {
				$("#updateImg").click();
			});
		});
	</script>

	<script>
		// 파일 첨부 후 미리보기 변경
		function LoadImg(value, num) {
			if (value.files && value.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					switch (num) {
					case 1:
						$(".profileImg").attr("src", e.target.result);
						break;
					}
				}
				reader.readAsDataURL(value.files[0]);
			}
		}
	</script>
</body>
</html>