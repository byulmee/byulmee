<!-- ajax 방식 -->
<!--
	메인컬러 - #FF6833
	메인폰트 - font-family: "Gmarket Sans TTF";
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet"/>
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
		width: 350px;
		height: 130px;
		display: inline-block;
		padding: 15px 0px 0px 20px;
	}
	.btnDiv {
		width: 90px;
		display: inline-block;
		vertical-align: middle;
		text-align: right;
	}
	.button, .detailProBtn, .reviewProBtn {
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
	.button:hover, .detailProBtn:hover ,.reviewProBtn:hover {
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
	
/* 모달창 기본 css */	
	#modalBG {
		display: none;
		position: fixed; 
		width: 100%;
		height: 100%;
		top: 0;
		left: 0; 
		background: rgba(0,0,0,0.6);
		z-index: 999;
	}
	.modal-con {
		display: none;
		position: fixed;
		top: 50%;
		left: 50%;
		transform: translate(-50%,-50%);
		min-width: 30%;
		min-height: 50%;
		background: #fff;
		z-index: 1000;
	}
/* 	.reviewWrite {
		z-index: 1500;
	} */
	.modal-con .con {
		font-size: 15px;
		line-height: 1.3;
		padding: 30px;
	}
	.modal-con .closeModal {
		display: block;
		position: absolute;
		line-height: 15px;
		right: 0px;
		top: 0x;
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
/* 상세내역 모달창 */		
	.detailTable {
		border-collapse: collapse;
		font-family: "Gmarket Sans TTF";
	}
	.detailTable td {
		padding: 10px;
		padding-bottom: 5px;
		border: 2px solid #D2D2D2;
	}
	.detailTitle {
		text-align: center;
		font-size: 22px;
		background: #E3E3E3;
	}
	.tdName1 {
		min-width: 90px;
		font-size: 16px;
		background: #E3E3E3;
		text-align: center;
	}
	.tdName2 {
		min-width: 180px;
		font-size: 16px;
		background: #F4F4F4;
		text-align: left;
	}
	.tdText {
		margin: 2px 0px 0px 0px;
	}
	.tdContent {
		min-width: 600px;
	}
/* 리뷰작성 모달창 */		
	.reviewTable {
		text-align: center;
		width: 600px;
		padding: 0px;
	}
	.reviewTitleTd {
		text-align: center;
		width: 600px;
		font-size: 26px;
		font-weight: bold;
	}
/* 별점 */
	.reviewScoreTd {
		font-size: 20px;
		padding-bottom: 30px;
	}
	.reviewScoreDiv {
		margin-left: auto;
		margin-right: auto;
		text-align: right;
		width: 60px;
	}
	.star-input>.input,
	.star-input>.input>label:hover,
	.star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label {
		display: inline-block;
		vertical-align: top;
		background: url("resources/images/myPage/star.png") no-repeat;
	}
	.star-input {
		-space: nowrap;
	}
	.star-input>.input {
		display:inline-block;
		width: 200px;
		background-size: 200px;
		height: 38px;
		white-space: nowrap;
		overflow: hidden;
		position: relative;
	}
	.star-input>.input>input {
		position: absolute;
		width: 1px;
		height: 1px;
		opacity: 0;
	}
	.star-input>.input>label {
		width: 20px;
		height: 0;
		padding: 38px 0 0 0;
		overflow: hidden;
		float: left;
		cursor: pointer;
		position: absolute;
		top: 0;
		left: 0;
	}
	.star-input>.input>label:hover,
	.star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label {
		background-size: 200px;
		background-position: 0 bottom;
	}
	.star-input>.input>label:hover~label {
		background-image: none;
	}
	.star-input>.input>label[for="p1"] { 
		width: 21px;
		z-index: 10;
	}
	.star-input>.input>label[for="p2"] { 
		width: 40px;
		z-index: 9;
	}
	.star-input>.input>label[for="p3"] { 
		width: 60px;
		z-index: 8;
	}
	.star-input>.input>label[for="p4"] { 
		width: 80px;
		z-index: 7;
	}
	.star-input>.input>label[for="p5"] { 
		width: 100px;
		z-index: 6;
	}
	.star-input>.input>label[for="p6"] { 
		width: 120px;
		z-index: 5;
	}
	.star-input>.input>label[for="p7"] { 
		width: 139px;
		z-index: 4;
	}
	.star-input>.input>label[for="p8"] { 
		width: 160px;
		z-index: 3;
	}
	.star-input>.input>label[for="p9"] { 
		width: 179px;
		z-index: 2;
	}
	.star-input>.input>label[for="p10"] { 
		width: 200px;
		z-index: 1;
	}
	output {
		width: 50px;
		height: 38px;
		font-family: "Gmarket Sans TTF";
		text-align: center;
		vertical-align: middle;
	}
/* 리뷰 작성 */
	.reviewTextTd {
		padding: 10px;
		padding-bottom: 30px;
	}
	.reviewText {
		width: 588px;
		height: 200px;
		border: 2px solid #D2D2D2;
		outline: none;
		padding: 0px;
	}
/* 리뷰 이미지 */
	.reviewImgTd {
		diaplay: inline-block;
		padding: 10px 10px 50px 10px;
	}
	.reviewImgDiv {
		position: relative;
		display: inline-block;
		width: 180px;
		height: 180px;
		overflow: hidden;
		border: 2px solid #D2D2D2;
	}
	.reviewImg {
		position: absolute;
		width: 180px;
		height: auto;
		margin: auto;
		left: -100%;
		right: -100%;
		top: -100%;
		bottom: -100%;
	}
	.reviewImg:hover {
		cursor: pointer;
	}
	.reviewImgDelDiv {
		position: absolute;
		left: 160px;
		width: 20px;
		height: 20px;
		background: #FF6833;
		z-index: 10;
		display: none;
	}
	.reviewImgDel {
		position: absolute;
		text-align: right;
		width: 12px;
		height: 12px;
		top: 4px;
		left: 4px;
	}
	.reviewImgDel {
		cursor: pointer;
	}
/* 리뷰 관련 버튼 */
	.reviewBtnDiv {
		display: inline-block;
		text-align: center;
		width: 612px;
	}
	.reviewBtn {
		width: 294px;
		height: 50px;
		border: 2px solid #D2D2D2;
		background: white;
		font-size: 20px;
		font-family: "Gmarket Sans TTF";
		cursor: pointer;
		outline: 0;
		vertical-align: middle;
	}
	.reviewBtn:hover {
		background: #FF6833;
		color: white;
		cursor: pointer;
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
						<button class="sideMenuBtn" style="cursor: default;" id="selectedBtn">구매내역</button>
						<ul class="purDropdown">
							<li>
								<button onclick="location.href='myPurActView.me'" class="sideMenuBtn">신청한 활동</button>
							</li>
							<li>
								<button onclick="location.href='myPurProView.me'" class="sideMenuBtn" id="selectedBtn">구매한 상품</button>
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
		            		<button onclick="" class="sideMenuBtn">스타 신청</button>
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
						<li onclick="location.href='myPurActView.me'">신청한 활동</li>
						<li onclick="location.href='myPurProView.me'" class="selected">구매한 상품</li>
					</ul>
				</div>
			<!-- 구매한 상품이 없는 경우 -->
				<c:if test="${ o.size() == 0 }">
					<div id="wrap">
						<table>
							<tr>
								<td class="nothing">
									신청한 활동이 없습니다.
								</td>
							</tr>
						</table>
					</div>
				</c:if>
			<!-- 구매한 상품이 있는 경우 반복문 시작 -->
				<c:if test="${ o.size() > 0 }">
					<c:forEach var="o" items="${ o }">
						<div class="list">
							<div class="hoverDiv" onclick="location.href='activityDetail.ac?acId=${ o.product.proNo }'">
								<div class="imgDiv">
									<img class="img" src="${ pageContext.servletContext.contextPath }/resources/auploadFiles/${ o.image.imgName }">
								</div>
								<div class="textDiv">
									<input type="hidden" class="ordNo" value="${ o.ordNo }" name="ordNo">
									<input type="hidden" class="proNo" value="${ o.product.proNo }" name="proNo">
									<p class="text">${ o.product.proTitle }</p>
									<p class="text"><fmt:formatNumber value="${ o.ordPay }"/> 원</p>
									<p class="text">${ o.ordDate } 구매</p>
								</div>
							</div>
							<div class="btnDiv">
								<button class="detailProBtn" onclick="openModal('detail')">상세내역</button>
								<button class="button" onclick="location.href='salesQnaInsertView.sq?acId=${ o.product.proNo }'">문의하기</button>
								<c:if test="${ o.ordReview == 'N' }">
									<button class="reviewProBtn" onclick="openModal('reviewWrite')">리뷰작성</button>
								</c:if>
								<c:if test="${ o.ordReview == 'Y' }">
									<button class="button" disabled>작성완료</button>
								</c:if>
							</div>
							<div class="delBtnDiv">
								<div class="delBtn">
									<img class="xImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/x.png">
								</div>
							</div>
						</div>
					</c:forEach>
					<table class="pagingArea">
						<tr align="center" height="20">
							<td colspan="6">
								<!-- [이전] -->
								<c:if test="${ pi.currentPage <= 1 }">
									<a class="pageBtnEnd">&lt;</a>
								</c:if>
								<c:if test="${ pi.currentPage > 1 }">
									<c:url var="before" value="myPurProView.me">
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
										<c:url var="pagination" value="myPurProView.me">
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
									<c:url var="after" value="myPurProView.me">
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
	
	<!-- 모달 배경 -->
	<div id="modalBG"></div>
	<!-- 상세내역 모달 -->
	<div class="modal-con detail">
		<a href="javascript:;" class="closeModal"><img class="xImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/x.png"></a>
		<div class="con">
			<table class="detailTable">
				<thead>
					<tr>
						<td colspan="3" class="detailTitle">상품 구매 상세내역</td>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
	<!-- 리뷰작성 모달 -->
	<div class="modal-con reviewWrite">
		<a href="javascript:;" class="closeModal"><img class="xImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/x.png"></a>
		<div class="con">
			<form action="reviewInsert.me" method="post" enctype="Multipart/form-data">
				<table class="reviewTable">
					<tr>
						<td colspan="3" class="reviewTitleTd">
							<input type="hidden" name="memId" value="${ loginUser.memId }">
							<input type="hidden" class="revRefcode" value="1" name="revRefcode">
							<input type="hidden" class="revRefno" value="" name="revRefno">
							<input type="hidden" class="ordNo" value="" name="ordNo">
							상품은 만족하셨나요?
						</td>
					</tr>
					<tr>
						<td colspan="3" class="reviewStarTd">
							<div class="star-input">
								<div class="input">
									<input type="radio" name="revRating" id="p1" value="0.5" class="radio"><label for="p1" class="label">0.5</label>
									<input type="radio" name="revRating" id="p2" value="1.0" class="radio"><label for="p2" class="label">1.0</label>
									<input type="radio" name="revRating" id="p3" value="1.5" class="radio"><label for="p3" class="label">1.5</label>
									<input type="radio" name="revRating" id="p4" value="2.0" class="radio"><label for="p4" class="label">2.0</label>
									<input type="radio" name="revRating" id="p5" value="2.5" class="radio"><label for="p5" class="label">2.5</label>
									<input type="radio" name="revRating" id="p6" value="3.0" class="radio"><label for="p6" class="label">3.0</label>
									<input type="radio" name="revRating" id="p7" value="3.5" class="radio"><label for="p7" class="label">3.5</label>
									<input type="radio" name="revRating" id="p8" value="4.0" class="radio"><label for="p8" class="label">4.0</label>
									<input type="radio" name="revRating" id="p9" value="4.5" class="radio"><label for="p9" class="label">4.5</label>
									<input type="radio" name="revRating" id="p10" value="5.0" class="radio"><label for="p10" class="label">5.0</label>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="3" class="reviewScoreTd">
							<div class="reviewScoreDiv">
								<output for="star-input" class="score">3</output> 점
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="3" class="reviewTitleTd">
							고객님의 소중한 의견을 남겨주세요.
						</td>
					</tr>
					<tr>
						<td colspan="3" class="reviewTextTd">
							<textarea class="reviewText" name="revContent" style="resize: none;"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="3" class="reviewTitleTd">
							상품에 대한 사진을 등록해주세요.
						</td>
					</tr>
					<tr>
						<td id="reviewImgTd1" class="reviewImgTd">
							<div id="reviewImgDiv1" class="reviewImgDiv">
								<div id="reviewImgDelDiv1" class="reviewImgDelDiv">
									<img id="reviewImgDel1" class="reviewImgDel" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/x_white.png">
								</div>
								<img id="reviewImg1" name="reviewImg1" class="reviewImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/plus.png">
							</div>
						</td>
						<td id="reviewImgTd2" class="reviewImgTd">
							<div id="reviewImgDiv2" class="reviewImgDiv">
								<div id="reviewImgDelDiv2" class="reviewImgDelDiv">
									<img id="reviewImgDel2" class="reviewImgDel" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/x_white.png">
								</div>
								<img id="reviewImg2" name="reviewImg2" class="reviewImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/plus.png">
							</div>
						</td>
						<td id="reviewImgTd3" class="reviewImgTd">
							<div id="reviewImgDiv3" class="reviewImgDiv">
								<div id="reviewImgDelDiv3" class="reviewImgDelDiv">
									<img id="reviewImgDel3" class="reviewImgDel" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/x_white.png">
								</div>
								<img id="reviewImg3" name="reviewImg3" class="reviewImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/plus.png">
							</div>
						</td>
					</tr>
				</table>
				<div class="reviewBtnDiv">
					<button type="button" class="reviewBtn" id="cancelBtn">취소</button>
					<button type="submit" class="reviewBtn" id="finishBtn">작성 완료</button>
				</div>
				<!-- 파일 업로드 부분 / 숨김상태 -->
				<div id="fileArea">
					<input type="file" id="reviewImgFile1" multiple="multiple" name="reviewImgFile1" onchange="LoadImg(this, 1)">
					<input type="file" id="reviewImgFile2" multiple="multiple" name="reviewImgFile2" onchange="LoadImg(this, 2)">
					<input type="file" id="reviewImgFile3" multiple="multiple" name="reviewImgFile3" onchange="LoadImg(this, 3)">
				</div>
			</form>
		</div>
	</div>
	
	<script>
		function openModal(modalname) {
			document.get
			$("#modalBG").fadeIn(300);
			$("." + modalname).fadeIn(300);
			$("#p6").prop("checked", true); // 리뷰 모달 창 실행 시 별 3개 체크
			$(".score").val("3"); // 리뷰 모달 창 실행 시 '3점' 표시
			$(".reviewText").val(""); // 리뷰 모달 창 실행 시 텍스트 초기화
			$(".reviewImg").attr("src", "${ pageContext.servletContext.contextPath }/resources/images/myPage/plus.png"); // 리뷰 모달 창 실행 시 전체 이미지 초기화
			$("#reviewImgDiv1").css({'background':'white'}); // 리뷰 모달 창 실행 시 첫 번째 사진 첨부 부분 배경화면 흰색으로 변경
			$("#reviewImgDiv2").css({'background':'white'}); // 리뷰 모달 창 실행 시 첫 번째 사진 첨부 부분 배경화면 흰색으로 변경
			$("#reviewImgDiv3").css({'background':'white'}); // 리뷰 모달 창 실행 시 첫 번째 사진 첨부 부분 배경화면 흰색으로 변경
			$("#reviewImgDelDiv1").css("display", "none"); // 리뷰 모달 창 실행 시 첫 번째 이미지 삭제 버튼 숨기기
			$("#reviewImgDelDiv2").css("display", "none"); // 리뷰 모달 창 실행 시 두 번째 이미지 삭제 버튼 숨기기
			$("#reviewImgDelDiv3").css("display", "none"); // 리뷰 모달 창 실행 시 세 번째 이미지 삭제 버튼 숨기기
		}
	</script>
		
	<script>
		$(".reviewProBtn").click(function(){
			var revRefno = $(this).parent().parent().children(".hoverDiv").children(".textDiv").children(".proNo").val();
			var ordNo = $(this).parent().parent().children(".hoverDiv").children(".textDiv").children(".ordNo").val();
			$('.revRefno').val(revRefno);
			$('.ordNo').val(ordNo);
		});
		
		$(".delBtn").click(function() {
			var bool = confirm("삭제 된 내역은 복구할 수 없습니다. 정말로 삭제 하시겠습니까?")
			var ordNo = $(this).parent().parent().children(".hoverDiv").children(".textDiv").children(".ordNo").val();
			var ordRefno = $(this).parent().parent().children(".hoverDiv").children(".textDiv").children(".proNo").val();
			
			if(bool) {
				location.href='deletePurPro.me?ordNo=' + ordNo + '&ordRefno=' + ordRefno;
			}			
		});
	</script>
	
	<script>
		$("#modalBG, .closeModal, .reviewBtn").click(function() {
			$("#modalBG").fadeOut(300);
			$(".modal-con").fadeOut(300);
		});
		
		$("#reviewImgDiv1").click(function() { // 첫 번째 사진 첨부 클릭 시 배경화면 검은색으로 변경 -> 레터박스 효과
			$(this).css({'background':'black'});
		});
		
		$("#reviewImgDiv2").click(function() { // 두 번째 사진 첨부 클릭 시 배경화면 검은색으로 변경 -> 레터박스 효과
			$(this).css({'background':'black'});
		});
		
		$("#reviewImgDiv3").click(function() { // 세 번째 사진 첨부 클릭 시 배경화면 검은색으로 변경 -> 레터박스 효과
			$(this).css({'background':'black'});
		});
		
		$("#reviewImgDel1").click(function() { // 첫 번째 사진 삭제 클릭 시 + 이미지 불러오고 삭제 버튼 숨기기
			$("#reviewImg1").attr("src", "${ pageContext.servletContext.contextPath }/resources/images/myPage/plus.png");
			$("#reviewImgDelDiv1").css("display", "none");
		});
		
		$("#reviewImgDel2").click(function() { // 두 번째 사진 삭제 클릭 시 + 이미지 불러오고 삭제 버튼 숨기기
			$("#reviewImg2").attr("src", "${ pageContext.servletContext.contextPath }/resources/images/myPage/plus.png");
			$("#reviewImgDelDiv2").css("display", "none");
		});
		
		$("#reviewImgDel3").click(function() { // 세 번째 사진 삭제 클릭 시 + 이미지 불러오고 삭제 버튼 숨기기
			$("#reviewImg3").attr("src", "${ pageContext.servletContext.contextPath }/resources/images/myPage/plus.png");
			$("#reviewImgDelDiv3").css("display", "none");
		});
	</script>
	
	<script>
		// star rating
		var starRating = function() {
			var $star = $(".star-input"), $result = $(".reviewTable").find("output");
			$(document).on("focusin", ".star-input>.input", function() {
				$(this).addClass("focus");
			}).on("focusout", ".star-input>.input", function() {
				var $this = $(this);
				setTimeout(function() {
					if ($this.find(":focus").length === 0) {
						$this.removeClass("focus");
					}
				}, 100);
			}).on("change", ".star-input :radio", function() {
				$result.text($(this).next().text());
			}).on("mouseover", ".star-input label", function() {
				$result.text($(this).text());
			}).on("mouseleave", ".star-input>.input", function() {
				var $checked = $star.find(":checked");
				if ($checked.length === 0) {
					$result.text("0");
				} else {
					$result.text($checked.next().text());
				}
			});
		};
		starRating();
	</script>
	
 	<script>
		$(".detailProBtn").click(function(){
			var ordNo = $(this).parent().parent().children(".hoverDiv").children(".textDiv").children(".ordNo").val();

			$.ajax({
				url : "detailPro.me",
				data : {ordNo : ordNo},
				success : function(data) {
					
					// 금액 , 표시 //////////////////////////////////////////////////////////
					function currencyFormat(val) {
						return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					}
					
					var num1 = data[0].ordPay;
					var num2 = data[0].product.proPrice;
					var num3 = data[0].product.proPrice*data[0].ordCount;
					var num4 = data[0].product.proCharge;

					var ordPay = currencyFormat(num1);
					var proPrice = currencyFormat(num2);
					var totalProPrice = currencyFormat(num3);
					var proCharge = currencyFormat(num4);
					//////////////////////////////////////////////////////////////////////
					
					// 전화번호 - 표시 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
					function phoneFormat(val) {
						return val.toString().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-");
					}

					var phone = data[0].ordPhone;

					var ordPhone = phoneFormat(phone);
					/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
					
					var $tableBody = $('.detailTable tbody');
					
					$tableBody.html('');
					
					var $proInfoTd = $("<td rowspan='3' class='tdName1'>").text("상품 정보");
					var $payInfoTd = $("<td rowspan='6' class='tdName1'>").text("결제 정보");
					var $reqInfoTd = $("<td rowspan='4' class='tdName1'>").text("구매자 정보");
					
					var ordPayWay = "";
					if (data[0].ordPayWay == 0) {
						ordPayWay = "카드";
					} else if (data[1].ordPayWay == 1) {
						ordPayWay = "페이";
					}
					
					$tableBody.append($("<tr>").append($proInfoTd).append($("<td class='tdName2'>").text("상품명")).append($("<td class='tdContent'>").text(data[0].product.proTitle)));
					$tableBody.append($("<tr>").append($("<td class='tdName2'>").text("스타")).append($("<td class='tdContent'>").text(data[0].member.memNickname)));
					$tableBody.append($("<tr>").append($("<td class='tdName2'>").text("구매일")).append($("<td class='tdContent'>").text(data[0].ordDate)));
					$tableBody.append($("<tr>").append($payInfoTd).append($("<td class='tdName2'>").text("① 1개당 상품 금액")).append($("<td class='tdContent'>").text(proPrice + ' 원')));
					$tableBody.append($("<tr>").append($("<td class='tdName2'>").text("② 구매 수량")).append($("<td class='tdContent'>").text(data[0].ordCount + " 개")));
					$tableBody.append($("<tr>").append($("<td class='tdName2'>").text("③ 총 상품 금액 (① × ②)")).append($("<td class='tdContent'>").text(totalProPrice + ' 원')));
					$tableBody.append($("<tr>").append($("<td class='tdName2'>").text("④ 배송비")).append($("<td class='tdContent'>").text(proCharge + ' 원')));
					$tableBody.append($("<tr>").append($("<td class='tdName2'>").text("⑤ 총 결제 금액 (③ + ④)")).append($("<td class='tdContent'>").text(ordPay + ' 원')));
					$tableBody.append($("<tr>").append($("<td class='tdName2'>").text("결제 수단")).append($("<td class='tdContent'>").text(ordPayWay)));
					$tableBody.append($("<tr>").append($reqInfoTd).append($("<td class='tdName2'>").text("신청자")).append($("<td class='tdContent'>").text(data[0].ordName)));
					$tableBody.append($("<tr>").append($("<td class='tdName2'>").text("연락처")).append($("<td class='tdContent'>").text(ordPhone)));
					$tableBody.append($("<tr>").append($("<td class='tdName2'>").text("배송 주소")).append($("<td class='tdContent'>").append($("<p class='tdText'>").text('우편번호　' + data[0].ordPostcode)).append($("<p class='tdText'>").text('기본주소　' + data[0].ordBasicaddr)).append($("<p class='tdText'>").text('상세주소　' + data[0].ordDetailaddr))));
					/* $tableBody.append($("<tr>").append($("<td class='tdName2'>").text("배송 주소")).append($("<td class='tdContent'>").text('우) ' + data[0].ordPostcode + ' 　' + data[0].ordBasicaddr + ' 　' + data[0].ordDetailaddr))); */
					$tableBody.append($("<tr>").append($("<td class='tdName2'>").text("추가 요청 사항")).append($("<td class='tdContent'>").text(data[0].ordRequest)));
					/* $tableBody.append($("<tr>").append($("<td class='tdName2'>").text("추가 요청 사항")).append($("<td class='tdContent'>")
							.html("<img class='img' src=' ${ pageContext.servletContext.contextPath }/resources/auploadFiles/" + data[0].image.imgName + "'>"))); */
				}
			});
		});
	</script>
	
	<script>
		// 파일 첨부 창 팝업
		$(function() {
			$("#fileArea").hide(); // 파일 업로드 부분 숨김

			$("#reviewImg1").click(function() {
				$("#reviewImgFile1").click();
			});
			$("#reviewImg2").click(function() {
				$("#reviewImgFile2").click();
			});
			$("#reviewImg3").click(function() {
				$("#reviewImgFile3").click();
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
						$("#reviewImg1").attr("src", e.target.result);
						$("#reviewImgDelDiv1").css("display", "block"); // 첫 번째 사진 첨부 시 삭제 버튼 나타내기
						break;
					case 2:
						$("#reviewImg2").attr("src", e.target.result);
						$("#reviewImgDelDiv2").css("display", "block"); // 첫 번째 사진 첨부 시 삭제 버튼 나타내기
						break;
					case 3:
						$("#reviewImg3").attr("src", e.target.result);
						$("#reviewImgDelDiv3").css("display", "block"); // 첫 번째 사진 첨부 시 삭제 버튼 나타내기
						break;
					}
				}
				reader.readAsDataURL(value.files[0]);
			}
		}
	</script>
</body>
</html>