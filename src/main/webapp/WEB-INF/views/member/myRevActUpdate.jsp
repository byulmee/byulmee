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
	.button {
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
	.button:hover {
		background: #FF6833;
		color: white;
		cursor: pointer;
	}
	.button:disabled {
		background: gray;
		color: white;
		cursor: default;
	}
	#wrap {
		display: table-cell;
		margin: 0;
		padding: 0;
		width: 750px;
		height: 800px;
		vertical-align: middle;
		text-align: center;
		border-bottom: 2px solid #FF6833;
	}
	.reviewDiv {
		display: inline-block;
		text-align: center;
	}
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
		padding: 10px 10px 30px 10px;
	}
	.reviewImgDiv {
		position: relative;
		display: inline-block;
		width: 180px;
		height: 180px;
		overflow: hidden;
		border: 2px solid #D2D2D2;
		background: black;
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
		cursor: pointer;
	}
/* 리뷰 관련 버튼 */
	.reviewBtnDiv {
		display: inline-block;
		text-align: center;
		width: 612px;
	}
	.reviewBtn {
		width: 196px;
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
	<script>
		$(function() {
			if ('${ ri.size()}' == 0) {
				$("#reviewImgDelDiv1").css("display", "none");
				$("#reviewImgDelDiv2").css("display", "none");
				$("#reviewImgDelDiv3").css("display", "none");
			} else if ('${ ri.size()}' == 1) {
				$("#reviewImgDelDiv1").css("display", "block");
				$("#reviewImgDelDiv2").css("display", "none");
				$("#reviewImgDelDiv3").css("display", "none");
			} else if ('${ ri.size()}' == 2) {
				$("#reviewImgDelDiv1").css("display", "block");
				$("#reviewImgDelDiv2").css("display", "block");
				$("#reviewImgDelDiv3").css("display", "none");
			} else if ('${ ri.size()}' == 3) {
				$("#reviewImgDelDiv1").css("display", "block");
				$("#reviewImgDelDiv2").css("display", "block");
				$("#reviewImgDelDiv3").css("display", "block");
			}
			
			var num = ${ r.revRating } * 2;
			
			$("#p" + num).prop("checked", true);
			$(".score").val(${ r.revRating });
		});
	</script>
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
						<button class="sideMenuBtn" style="cursor: default;" id="selectedBtn">후기 목록</button>
						<ul class="reviewDropdown">
							<li>
								<button onclick="location.href='myRevActListView.me'" class="sideMenuBtn" id="selectedBtn">활동 후기</button>
							</li>
							<li>
								<button onclick="location.href='myRevProListView.me'" class="sideMenuBtn">상품 후기</button>
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
						<li onclick="location.href='myActRevListView.me'" class="selected">활동 후기</li>
						<li onclick="location.href='myProRevListView.me'">상품 후기</li>
					</ul>
				</div>
				<div id="wrap">
					<form action="reviewUpdate.me" method="post" enctype="Multipart/form-data">
						<div class="reviewDiv">
							<table class="reviewTable">
								<tr class="hiddenTr">
									<td colspan="3" class="reviewTitleTd">
										<input type="hidden" class="revNo" value="${ r.revNo }" name="revNo">
										<input type="hidden" class="memId" value="${ r.memId }" name="memId" >
										<input type="hidden" class="revRefcode" value="0" name="revRefcode">
										<input type="hidden" class="revRefno" value="${ r.revRefno }" name="revRefno">
										<input type="hidden" class="ordNo" value="${ r.ordNo }" name="ordNo">
										<input type="hidden" class="revLastRating" value="${ r.revLastRating }" name="revLastRating">
										상품은 만족하셨나요?
									</td>
								</tr>
								<tr>
									<td colspan="3" class="reviewStarTd">
										<div class="star-input">
											<div class="input">
												<input type="radio" name="revRating" id="p1" value="0.5" class="radio"><label for="p1" class="label">0.5</label>
												<input type="radio" name="revRating" id="p2" value="1" class="radio"><label for="p2" class="label">1.0</label>
												<input type="radio" name="revRating" id="p3" value="1.5" class="radio"><label for="p3" class="label">1.5</label>
												<input type="radio" name="revRating" id="p4" value="2" class="radio"><label for="p4" class="label">2.0</label>
												<input type="radio" name="revRating" id="p5" value="2.5" class="radio"><label for="p5" class="label">2.5</label>
												<input type="radio" name="revRating" id="p6" value="3" class="radio"><label for="p6" class="label">3.0</label>
												<input type="radio" name="revRating" id="p7" value="3.5" class="radio"><label for="p7" class="label">3.5</label>
												<input type="radio" name="revRating" id="p8" value="4" class="radio"><label for="p8" class="label">4.0</label>
												<input type="radio" name="revRating" id="p9" value="4.5" class="radio"><label for="p9" class="label">4.5</label>
												<input type="radio" name="revRating" id="p10" value="5" class="radio"><label for="p10" class="label">5.0</label>
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
										<textarea class="reviewText" name="revContent" style="resize: none;">${ r.revContent }</textarea>
									</td>
								</tr>
								<tr>
									<td colspan="3" class="reviewTitleTd">
										활동에 대한 사진을 등록해주세요.
									</td>
								</tr>
								<tr>
									<c:if test="${ ri.size() == 0 }">
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
									</c:if>
									
									<c:if test="${ ri.size() == 1 }">
										<td id="reviewImgTd1" class="reviewImgTd">
											<div id="reviewImgDiv1" class="reviewImgDiv">
												<div id="reviewImgDelDiv1" class="reviewImgDelDiv">
													<img id="reviewImgDel1" class="reviewImgDel" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/x_white.png">
												</div>
												<img id="reviewImg1" name="reviewImg1" class="reviewImg" src="${ pageContext.servletContext.contextPath }/resources/riUploadFiles/${ ri.get(0).imgName }">
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
									</c:if>
									
									<c:if test="${ ri.size() == 2 }">
										<td id="reviewImgTd1" class="reviewImgTd">
											<div id="reviewImgDiv1" class="reviewImgDiv">
												<div id="reviewImgDelDiv1" class="reviewImgDelDiv">
													<img id="reviewImgDel1" class="reviewImgDel" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/x_white.png">
												</div>
												<img id="reviewImg1" name="reviewImg1" class="reviewImg" src="${ pageContext.servletContext.contextPath }/resources/riUploadFiles/${ ri.get(0).imgName }">
											</div>
										</td>
										<td id="reviewImgTd2" class="reviewImgTd">
											<div id="reviewImgDiv2" class="reviewImgDiv">
												<div id="reviewImgDelDiv2" class="reviewImgDelDiv">
													<img id="reviewImgDel2" class="reviewImgDel" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/x_white.png">
												</div>
												<img id="reviewImg2" name="reviewImg2" class="reviewImg" src="${ pageContext.servletContext.contextPath }/resources/riUploadFiles/${ ri.get(1).imgName }">
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
									</c:if>
									
									<c:if test="${ ri.size() == 3 }">
										<td id="reviewImgTd1" class="reviewImgTd">
											<div id="reviewImgDiv1" class="reviewImgDiv">
												<div id="reviewImgDelDiv1" class="reviewImgDelDiv">
													<img id="reviewImgDel1" class="reviewImgDel" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/x_white.png">
												</div>
												<img id="reviewImg1" name="reviewImg1" class="reviewImg" src="${ pageContext.servletContext.contextPath }/resources/riUploadFiles/${ ri.get(0).imgName }">
											</div>
										</td>
										<td id="reviewImgTd2" class="reviewImgTd">
											<div id="reviewImgDiv2" class="reviewImgDiv">
												<div id="reviewImgDelDiv2" class="reviewImgDelDiv">
													<img id="reviewImgDel2" class="reviewImgDel" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/x_white.png">
												</div>
												<img id="reviewImg2" name="reviewImg2" class="reviewImg" src="${ pageContext.servletContext.contextPath }/resources/riUploadFiles/${ ri.get(1).imgName }">
											</div>
										</td>
										<td id="reviewImgTd3" class="reviewImgTd">
											<div id="reviewImgDiv3" class="reviewImgDiv">
												<div id="reviewImgDelDiv3" class="reviewImgDelDiv">
													<img id="reviewImgDel3" class="reviewImgDel" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/x_white.png">
												</div>
												<img id="reviewImg3" name="reviewImg3" class="reviewImg" src="${ pageContext.servletContext.contextPath }/resources/riUploadFiles/${ ri.get(2).imgName }">
											</div>
										</td>
									</c:if>
								</tr>
							</table>
						</div>	
						<div class="reviewBtnDiv">
							<button type="button" class="reviewBtn" id="cancelBtn">취소</button>
							<button type="button" class="reviewBtn" id="deleteBtn">삭제</button>
							<button type="submit" class="reviewBtn" id="finishBtn">수정 완료</button>
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
		</div>
	</div>
	
	<c:import url="../common/footer.jsp"/>
	
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
		// 파일 첨부 창 팝업
		$(function() {
			//$("#fileArea").hide(); // 파일 업로드 부분 숨김

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
		
	<script>
		$("#reviewImgDel1").click(function() {
			$("#reviewImg1").attr("src", "${ pageContext.servletContext.contextPath }/resources/images/myPage/plus.png");
			$("#reviewImgDelDiv1").css("display", "none");
			$("#reviewImg1").val("");
		});
		
		$("#reviewImgDel2").click(function() {
			$("#reviewImg2").attr("src", "${ pageContext.servletContext.contextPath }/resources/images/myPage/plus.png");
			$("#reviewImgDelDiv2").css("display", "none");
			$("#reviewImg2").val("");
		});
		
		$("#reviewImgDel3").click(function() {
			$("#reviewImg3").attr("src", "${ pageContext.servletContext.contextPath }/resources/images/myPage/plus.png");
			$("#reviewImgDelDiv3").css("display", "none");
			$("#reviewImg3").val("");
		});
	</script>
	
	<script>
		
	</script>
</body>
</html>