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
		z-index: 1;
	}
	.sideMenuUl > li ul.purDropdown {
		list-style: none;
		display: none;
		position: absolute;
		top: 50px;
		left: 200px;
		background: #F4F4F4;
		border: 1px solid #DCDCDC;
		z-index: 1;
	}
	.sideMenuUl > li ul.favDropdown {
		list-style: none;
		display: none;
		position: absolute;
		top: 100px;
		left: 200px;
		background: #F4F4F4;
		border: 1px solid #DCDCDC;
		z-index: 1;
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
	.starArea {
		min-height: 160px;
	}
	.star {
		display: inline-block;
		width: 184px;
		height: 194px;
		padding-top: 13px;
		text-align: center;
		vertical-align: middle;
	}
	.hoverDiv {
		vertical-align: middle;
	}
	.hoverDiv:hover {
		opacity: 0.6;
		cursor: pointer;
		vertical-align: middle;
	}
	.starDiv {
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
	.starImg {
		position: absolute;
		margin: auto;
		width: 146px;
		height: auto;
		left: -100%;
		right: -100%;
		top: -100%;
		bottom: -100%;
	}
	.starName {
		display: inline-block;
		margin: 0px;
		padding-top: 10px;
		width: 130px;
	}
	.starDelDiv {
		position: relative;
		display: inline-block;
		width: 15px;
		height: 15px;
		top: -178px;
		left: 59px;
	}
	.starDelImg {
		position: absolute;
		text-align: right;
		width: 15px;
		height: 15px;
		cursor: pointer;
		opacity: 0.2;
	}
	.starDelImg:hover {
		cursor: pointer;
		opacity: 1;
	}
	#wrap {
		display: table-cell;
		margin: 0;
		padding: 0;
		width: 750px;
		height: 510px;
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
	.pagindDiv {
		border-top: 1px solid #D4D4D4;
		padding-top: 10px;
		padding-bottom: 10px;
	}
	.pagingArea {
		text-align: center; 
	}
	.pageBtn {
		display: inline-block;
		font-family: initial;
		font-size: 11px;
		padding-top: 3px;
		width: 22px;
		height: 20px;
		background: #E4E4E4;
	}
	.pageBtn:hover {
		background: #FF6833;
		color: white;
		font-weight: bold;
	}
	.pageBtnSelected {
		display: inline-block;
		font-family: initial;
		font-size: 11px;
		padding-top: 3px;
		width: 22px;
		height: 20px;
		background: #FF6833;
		color: white;
		font-weight: bold;
	}
	.pageBtnEnd {
		display: inline-block;
		font-family: initial;
		font-size: 11px;
		padding-top: 3px;
		width: 22px;
		height: 20px;
		background: #E4E4E4;
		corsur: default;
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
						<button onclick="location.href='myPageMainView.me'" class="sideMenuBtn">개인정보 관리</button>
						<ul class="myinfoDropdown">
							<li>
								<button onclick="location.href='myInfoPwdCheckView.me'" class="sideMenuBtn">개인정보 변경</button>
							</li>
							<li>
								<button onclick="location.href='myPwdUpdateView.me'" class="sideMenuBtn">비밀번호 변경</button>
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
				<div class="tab-box">
					<ul>
						<li onclick="location.href='myFavActView.me'">찜한 활동</li>
						<li onclick="location.href='myFavProView.me'">찜한 상품</li>
						<li onclick="location.href='myFavStarView.me'" class="selected">찜한 스타</li>
					</ul>
				</div>
			<!-- 찜한 스타가 없는 경우 -->
				<c:if test="${ f.size() == 0 }">
					<div id="wrap">
						<table>
							<tr>
								<td class="nothing">
									찜한 스타가 없습니다.
								</td>
							</tr>
						</table>
					</div>
				</c:if>
			<!-- 찜한 스타가 있는 경우 반복문 시작 -->
				<c:if test="${ f.size() > 0 }">
					<c:forEach var="f" items="${ f }">
						<div class="star">
							<div class="hoverDiv">
								<div class="starDiv">
									<input type="hidden" class="favNo" value="${ f.favNo }" name="favNo">
									<input type="hidden" class="memNo" value="${ f.member.memNo }" name="memNo">
									<c:if test="${ f.image.imgRefno ne f.favRefno }">
										<img class="starImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/basic.png">
									</c:if>
									<c:if test="${ f.image.imgRefno eq f.favRefno }">
										<img class="starImg" src="${ pageContext.servletContext.contextPath }/resources/piUploadFiles/${ f.image.imgName }">
									</c:if>
								</div>
								<div>
									<p class="starName">${ f.member.memNickname }</p>
								</div>
							</div>
							<div id="starDelDiv" class="starDelDiv">
								<div class="delBtn">
									<img id="starDelImg" class="starDelImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/x.png">
								</div>
							</div>
						</div>
					</c:forEach>
					<div class="pagindDiv">
						<table class="pagingArea">
							<tr align="center" height="20">
								<td colspan="6">
									<!-- [이전] -->
									<c:if test="${ pi.currentPage <= 1 }">
										<a class="pageBtnEnd">&lt;</a>
									</c:if>
									<c:if test="${ pi.currentPage > 1 }">
										<c:url var="before" value="myFavStarView.me">
											<c:param name="page" value="${ pi.currentPage - 1 }"/>
										</c:url>
										<a href="${ before }" class="pageBtn">&lt;</a>
									</c:if>
									
									<!-- 페이지 -->
									<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
										<c:if test="${ p eq pi.currentPage }">
											<a class="pageBtnSelected">${ p }</a>
										</c:if>
										
										<c:if test="${ p ne pi.currentPage }">
											<c:url var="pagination" value="myFavStarView.me">
												<c:param name="page" value="${ p }"/>
											</c:url>
											<a href="${ pagination }" class="pageBtn">${ p }</a>
										</c:if>
									</c:forEach>
									
									<!-- [다음] -->
									<c:if test="${ pi.currentPage >= pi.maxPage }">
										<a class="pageBtnEnd">&gt;</a>
									</c:if>
									<c:if test="${ pi.currentPage < pi.maxPage }">
										<c:url var="after" value="myFavStarView.me">
											<c:param name="page" value="${ pi.currentPage + 1 }"/>
										</c:url> 
										<a href="${ after }" class="pageBtn">&gt;</a>
									</c:if>
								</td>
							</tr>
						</table>
					</div>
					<hr class="line">
				</c:if>
			<!-- 반복문 종료 -->
			</div>
		</div>
	</div>
	
	<c:import url="../common/footer.jsp"/>
	
	<script>
		$(".delBtn").click(function() {
			var bool = confirm("삭제 된 내역은 복구할 수 없습니다. 정말로 삭제 하시겠습니까?")
			var favNo = $(this).parent().parent().children(".hoverDiv").children(".starDiv").children(".favNo").val();
			var favRefno = $(this).parent().parent().children(".hoverDiv").children(".starDiv").children(".memNo").val();
			
			if(bool) {
				location.href='deleteFavStar.me?favNo=' + favNo + '&favRefno=' + favRefno;
			}			
		});
	</script>
</body>
</html>