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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet"/>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/js/summernote/summernote-lite.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/summernote/summernote-lite.css">
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
		height: 120px;
		border-bottom: 1px solid #D4D4D4;
	}
	.hoverDiv {
		display: inline-block;
		width: 650px;
		height: 120px;
	}
	.hoverDiv:hover {
		opacity: 0.6;
		cursor: pointer;
	}
	.imgDiv {
		display: inline-block;
		width: 120px;
		height: 120px;
		vertical-align: middle;
	}
	.img {
		display: table-cell;
		width: 100px;
		height: 100px;
		padding: 10px;
		object-fit: cover;
		vertical-align: middle;
	}
	.textDiv {
		width: 400px;
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
	.reviewWrite {
		z-index: 1500;
	}
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
		background: #F4F4F4;
	}
	.tdName {
		font-size: 16px;
		background: #F4F4F4;
	}
/* 리뷰작성 모달창 */		
	.reviewTable {
		text-align: center;
		width: 100%;
	}
/* 별점 */	
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
		display: inline-block;
		width: 50px;
		height: 38px;
		font-family: "Gmarket Sans TTF";
		text-align: center;
		vertical-align: middle;
	}
	.pagingArea {
		text-align: center; 
		margin-top: 10px;
		margin-bottom: 10px;
	}
	.pageBtn {
		display: inline-block;
		font-family: initial;
		font-size: 12px;
		width: 20px;
		border: 1px solid gray;
	}
	.pageBtnSelected {
		display: inline-block;
		font-family: initial;
		font-size: 12px;
		width: 20px;
		border: 1px solid red;
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
						<button class="sideMenuBtn" style="cursor: default;" id="selectedBtn">구매내역</button>
						<ul class="purDropdown">
							<li>
								<button onclick="location.href='myPurActView.me'" class="sideMenuBtn" id="selectedBtn">신청한 활동</button>
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
						<li onclick="location.href='myPurActView.me'" class="selected">신청한 활동</li>
						<li onclick="location.href='myPurProView.me'">구매한 상품</li>
					</ul>
				</div>
			<!-- 신청한 활동이 없는 경우 -->
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
			<!-- 신청한 활동이 있는 경우 반복문 시작 -->
				<c:if test="${ o.size() > 0 }">
					<c:forEach var="o" items="${ o }">
						<div class="list">
							<div class="hoverDiv">
								<div class="imgDiv">
									<img class="img" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/surfing.jpg">
								</div>
								<div class="textDiv">
									<p class="text">
										${ o.activity.actTitle }<br><br>
										${ o.ordPay } 원&nbsp;&nbsp;|&nbsp;&nbsp;${ o.ordDate } 신청
									</p>
								</div>
							</div>
							<div class="btnDiv">
								<button class="button" onclick="openModal('detail')">상세내역</button>
								<button class="button">문의하기</button>
								<button class="button" onclick="openModal('reviewWrite')">리뷰작성</button>
							</div>
						</div>
						
						<!-- 상세내역 모달창 -->
						<div class="modal-con detail">
							<a href="javascript:;" class="closeModal"><img class="xImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/x.png"></a>
							<div class="con">
								<table class="detailTable">
									<tr>
										<td colspan="3" class="detailTitle">활동 신청 상세내역</td>
									</tr>
									<tr>
										<td rowspan="5" class="tdName">활동 정보</td>
										<td class="tdName">활동명</td>
										<td width="600px;">${ o.activity.actTitle }</td>
									</tr>
									<tr>
										<td class="tdName">스타</td>
										<td>${ o.activity.memId }</td>
									</tr>
									<tr>
										<td class="tdName">신청일</td>
										<td>${ o.ordDate }</td>
									</tr>
									<tr>
										<td class="tdName">활동 기간</td>
										<td>${ o.activity.actStartday } ~ ${ o.activity.actEndday }</td>
									</tr>
									<tr>
										<td class="tdName">활동 장소</td>
										<td>${ o.activity.actPlace }</td>
									</tr>
									<tr>
										<td rowspan="4" class="tdName">결제 정보</td>
										<td class="tdName">활동비</td>
										<td>${ o.activity.actPrice }</td>
									</tr>
									<tr>
										<td class="tdName">신청 인원</td>
										<td>${ o.ordCount }</td>
									</tr>
									<tr>
										<td class="tdName">총 결제 금액</td>
										<td>${ o.ordPay }</td>
									</tr>
									<tr>
										<td class="tdName">결제 수단</td>
										<td>${ o.ordPayWay }</td>
									</tr>
									<tr>
										<td rowspan="4" class="tdName">배송 정보</td>
										<td class="tdName">신청자</td>
										<td>${ o.ordName }</td>
									</tr>
									<tr>
										<td class="tdName">연락처</td>
										<td>${ o.ordPhone }</td>
									</tr>
									<tr>
										<td class="tdName">주소</td>
										<td>${ o.ordBasicaddr } ${ o.ordDetailaddr }</td>
									</tr>
									<tr>
										<td class="tdName">추가 요청 사항</td>
										<td>${ o.ordRequest }</td>
									</tr>
								</table>
							</div>
						</div>
						<!-- 리뷰작성 모달창 -->
						<div class="modal-con reviewWrite">
							<a href="javascript:;" class="closeModal"><img class="xImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/x.png"></a>
							<div class="con">
								<table class="reviewTable">
									<tr>
										<td>
											<div class="star-input">
												<div class="input">
													<input type="radio" name="star-input" id="p1" value="0.5" class="radio"><label for="p1" class="label">0.5</label>
													<input type="radio" name="star-input" id="p2" value="1" class="radio"><label for="p2" class="label">1</label>
													<input type="radio" name="star-input" id="p3" value="1.5" class="radio"><label for="p3" class="label">1.5</label>
													<input type="radio" name="star-input" id="p4" value="2" class="radio"><label for="p4" class="label">2</label>
													<input type="radio" name="star-input" id="p5" value="2.5" class="radio"><label for="p5" class="label">2.5</label>
													<input type="radio" name="star-input" id="p6" value="3" class="radio" checked><label for="p6" class="label">3</label>
													<input type="radio" name="star-input" id="p7" value="3.5" class="radio"><label for="p7" class="label">3.5</label>
													<input type="radio" name="star-input" id="p8" value="4" class="radio"><label for="p8" class="label">4</label>
													<input type="radio" name="star-input" id="p9" value="4.5" class="radio"><label for="p9" class="label">4.5</label>
													<input type="radio" name="star-input" id="p10" value="5" class="radio"><label for="p10" class="label">5</label>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<output for="star-input"><b class="score">3</b><b> 점</b></output>
										</td>
									</tr>
									<tr>
										<td>
											<textarea id="summernote" name="editordata"></textarea>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</c:forEach>
					<table class="pagingArea">
						<tr align="center" height="20">
							<td colspan="6">
								<!-- [이전] -->
								<c:if test="${ pi.currentPage <= 1 }">
									<a class="pageBtn">&lt;</a>
								</c:if>
								<c:if test="${ pi.currentPage > 1 }">
									<c:url var="before" value="myPurActView.me">
										<c:param name="page" value="${ pi.currentPage - 1 }"/>
									</c:url>
									<a href="${ before }" class="pageBtn">&lt;</a>
								</c:if>
								
								<!-- 페이지 -->
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
									<c:if test="${ p eq pi.currentPage }">
										<%-- <font color="red" size="4"><b>[${ p }]</b></font> --%>
										<a class="pageBtnSelected">${ p }</a>
									</c:if>
									
									<c:if test="${ p ne pi.currentPage }">
										<c:url var="pagination" value="myPurActView.me">
											<c:param name="page" value="${ p }"/>
										</c:url>
										<a href="${ pagination }" class="pageBtn">${ p }</a>
									</c:if>
								</c:forEach>
								
								<!-- [다음] -->
								<c:if test="${ pi.currentPage >= pi.maxPage }">
									<a class="pageBtn">&gt;</a>
								</c:if>
								<c:if test="${ pi.currentPage < pi.maxPage }">
									<c:url var="after" value="myPurActView.me">
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
	
	<div id="modalBG"><!-- 배경 --></div>
	
	<c:import url="../common/footer.jsp"/>
	
	<script>
		function openModal(modalname) {
			document.get
			$("#modalBG").fadeIn(300);
			$("." + modalname).fadeIn(300);
		}

		$("#modalBG, .closeModal").on('click', function() {
			$("#modalBG").fadeOut(300);
			$(".modal-con").fadeOut(300);
		});
		

		// star rating
		var starRating = function() {
			var $star = $(".star-input"), $result = $(".reviewTable").find("output>.score");
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
		
		$(document).ready(function() {
			$('#summernote').summernote({
				toolbar: [
					['fontname', ['fontname']],
					['fontsize', ['fontsize']],
					['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
					['color', ['forecolor','color']],
					['para', ['paragraph']],
					['insert',['picture']],
					['view', ['help']]
				],
				fontNames: ['맑은 고딕', '궁서', '굴림체', '굴림', '돋음체', '바탕체',
							'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New'],
				fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20',
							'22', '24', '28', '30', '36', '50', '72'],
				width: 650,
				height: 400,
				disableResizeEditor: true,
				lang: "ko-KR"
			});
			$('.note-statusbar').hide();
		});
	</script>
</body>
</html>