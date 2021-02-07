<!-- ajax 방식 -->
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
		width: 50%;
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
	.listArea {
		min-height: 480px;
	}
	.list {
		display: inline-block;
		width: 100%;
		height: 160px;
		border-bottom: 1px solid #D4D4D4;
	}
	.hoverDiv {
		display: inline-block;
		width: 620px;
		height: 160px;
		vertical-align: middle;
	}
	.hoverDiv:hover {
		opacity: 0.6;
		cursor: pointer;
		vertical-align: middle;
	}
	.imgDiv {
		display: inline-block;
		position: relative;
		width: 136px;
		height: 136px;
		margin-top: 10px;
		overflow: hidden;
		border: 2px solid gray;
		background: black;
		left: 10px;
	}
	.img {
		position: absolute;
		width: 136px;
		height: auto;
		margin: auto;
		left: -100%;
		right: -100%;
		top: -100%;
		bottom: -100%;
	}
	.textDiv {
		position: absolute;
		width: 460px;
		height: 130px;
		display: inline-block;
		padding: 15px 0px 0px 20px;
	}
	.conTable {
		width: 460px;
		height: 130px;
		text-align: left;
		vertical-align: middle;
		table-layout: fixed;
	}
	.conTd {
		width: 350px;
		height: 30px;
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
	}
	.btnDiv {
		width: 90px;
		display: inline-block;
		vertical-align: middle;
		text-align: right;
	}
	.button, .detailProBtn {
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
	.button:hover, .detailProBtn:hover {
		background: #FF6833;
		color: white;
		cursor: pointer;
	}
	.button:disabled {
		background: gray;
		color: white;
		cursor: default;
	}
	.delBtnDiv {
		width: 30px;
		display: inline-block;
		vertical-align: middle;
		text-align: right;
	}
	.xImg {
		padding: 10px 10px 0px 0px;
		width: 15px;
		height: 15px;
		object-fit: cover;
		cursor: pointer;
		opacity: 0.2;
	}
	.xImg:hover {
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
	.pagingArea {
		text-align: center; 
		margin-top: 10px;
		margin-bottom: 10px;
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
								<button onclick="location.href='myQnaCusListView.me'" class="sideMenuBtn">고객 문의</button>
							</li>
							<li>
								<button onclick="location.href='myQnaActListView.me'" class="sideMenuBtn">활동 문의</button>
							</li>
							<li>
								<button onclick="location.href='myQnaProListView.me'" class="sideMenuBtn">상품 문의</button>
							</li>
						</ul>
					</li>
					<li>
						<button class="sideMenuBtn" style="cursor: default;" id="selectedBtn">후기 목록</button>
						<ul class="reviewDropdown">
							<li>
								<button onclick="location.href='myRevActListView.me'" class="sideMenuBtn">활동 후기</button>
							</li>
							<li>
								<button onclick="location.href='myRevProListView.me'" class="sideMenuBtn" id="selectedBtn">상품 후기</button>
							</li>
						</ul>
					</li>
					<li>
						<c:if test="${ loginUser.memLevel == 0 }">
		            		<button onclick="location.href='starRequestView.me'" class="sideMenuBtn">스타 신청</button>
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
						<li onclick="location.href='myRevActListView.me'">활동 후기</li>
						<li onclick="location.href='myRevProListView.me'" class="selected">상품 후기</li>
					</ul>
				</div>
			<!-- 작성한 상품 후기가 없는 경우 -->
				<c:if test="${ r.size() == 0 }">
					<div id="wrap">
						<table>
							<tr>
								<td class="nothing">
									작성한 상품 후기가 없습니다.
								</td>
							</tr>
						</table>
					</div>
				</c:if>
			<!-- 작성한 상품 후기가 있는 경우 반복문 시작 -->
				<c:if test="${ r.size() > 0}">
					<c:forEach var="r" items="${ r }">
						<form action="myRevProUpdateView.me" method="post">
							<div class="list">
								<div class="hoverDiv" onclick="location.href='productDetail.pd?pdId=${ r.product.proNo }#menu2'">
									<div class="imgDiv">
										<c:if test="${ r.img.imgName ne null}">
											<img class="img" src="${ pageContext.servletContext.contextPath }/resources/riUploadFiles/${ r.img.imgName }">
										</c:if>
										<c:if test="${ r.img.imgName eq null}">
											<img class="img" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/revProDefault.png">
										</c:if>
									</div>
									<div class="textDiv">
										<input type="hidden" class="revNo" value="${ r.revNo }" name="revNo">
										<input type="hidden" class="memId" value="${ r.memId }" name="memId">
										<input type="hidden" class="revRating" value="${ r.revRating }" name="revRating">
										<input type="hidden" class="revDate" value="${ r.revDate }" name="revDate">
										<input type="hidden" class="revRefcode" value="1" name="revRefcode">
										<input type="hidden" class="revRefno" value="${ r.revRefno }" name="revRefno">
										<input type="hidden" class="ordNo" value="${ r.ordNo }" name="ordNo">
										<table class="conTable">
											<tr>
												<td class="conTd">
													${ r.product.proTitle }
												</td>
											</tr>
											<tr>
												<td class="conTd">
													<span class="star"><img class='rating' src='${ pageContext.servletContext.contextPath }/resources/images/myPage/star${ r.revRating }.png'></span>
													&nbsp;${ r.revRating }&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;${ r.revDate } 작성
												</td>
											</tr>
											<tr>
												<td class="conTd">
													<input type="hidden" class="revContent" value="${ r.revContent }" name="revContent">
													${ r.revContent }
												</td>
											</tr>
										</table>
									</div>
								</div>
								<div class="btnDiv">
									<button type="submit" class="detailProBtn">수정</button>
								</div>
								<div class="delBtnDiv">
									<div class="delBtn">
										<img class="xImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/x.png">
									</div>
								</div>
							</div>
						</form>
					</c:forEach>
					<table class="pagingArea">
						<tr align="center" height="20">
							<td colspan="6">
								<!-- [이전] -->
								<c:if test="${ pi.currentPage <= 1 }">
									<a class="pageBtnEnd">&lt;</a>
								</c:if>
								<c:if test="${ pi.currentPage > 1 }">
									<c:url var="before" value="myRevProListView.me">
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
										<c:url var="pagination" value="myRevProListView.me">
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
									<c:url var="after" value="myRevProListView.me">
										<c:param name="page" value="${ pi.currentPage + 1 }"/>
									</c:url> 
									<a href="${ after }" class="pageBtn">&gt;</a>
								</c:if>
							</td>
						</tr>
					</table>
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
			var revNo = $(this).parent().parent().children(".hoverDiv").children(".textDiv").children(".revNo").val();
			var revRating = $(this).parent().parent().children(".hoverDiv").children(".textDiv").children(".revRating").val();
			var revRefcode = $(this).parent().parent().children(".hoverDiv").children(".textDiv").children(".revRefcode").val();
			var revRefno = $(this).parent().parent().children(".hoverDiv").children(".textDiv").children(".revRefno").val();
			var ordNo = $(this).parent().parent().children(".hoverDiv").children(".textDiv").children(".ordNo").val();
			
			if(bool) {
				location.href='deleteRev.me?revNo=' + revNo + '&revRating=' + revRating + '&revRefcode=' + revRefcode
								+ '&revRefno=' + revRefno + '&ordNo=' + ordNo;
			}			
		});
	</script>
</body>
</html>