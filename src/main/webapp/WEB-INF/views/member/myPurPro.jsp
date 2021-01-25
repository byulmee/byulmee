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
		height: 140px;
	}
	.list:hover {
		opacity: 0.6;
		cursor: pointer;
		border-bottom: 1px solid #D4D4D4;
	}
	.imgDiv {
		display: inline-block;
		width: 140px;
		height: 140px;
		vertical-align: middle;
	}
	.img {
		display: table-cell;
		width: 100px;
		height: 100px;
		padding: 20px;
		object-fit: cover;
		vertical-align: middle;
	}
	.textDiv {
		width: 500px;
		margin: 0;
		display: inline-block;
		vertical-align: middle;
	}
	.btnDiv {
		width: 90px;
		display: inline-block;
		vertical-align: middle;
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
	
/* 모달창 */	
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
	#summernote {
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
		text-align: right;
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
				<!-- <div id="wrap">
					<table>
						<tr>
							<td class="nothing">
								구매한 상품이 없습니다.
							</td>
						</tr>
					</table>
				</div> -->
			<!-- 구매한 상품이 있는 경우 반복문 시작 -->	
				<div class="list">
					<div class="imgDiv">
						<img class="img" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/surfing.jpg">
					</div>
					<div class="textDiv">
						<p class="text">
							강릉 겨울서핑 & 렌탈권<br><br>
							2020.12.14<br><br>
							35,000 원
						</p>
					</div>
				</div>
				<div class="btnDiv">
					<button class="button" onclick="openModal('detail')">상세내역</button>
					<button class="button">문의하기</button>
					<button class="button" onclick="openModal('reviewWrite')">리뷰작성</button>
				</div>
				<hr class="line">
				<div class="list">
					<div class="imgDiv">
						<img class="img" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/flower.png">
					</div>
					<div class="textDiv">
						<p class="text">
							인테리어소품 드라이리스 만들기<br><br>
							2020.11.21<br><br>
							39,000 원
						</p>
					</div>
				</div>
				<div class="btnDiv">
					<button class="button" onclick="openModal('detail')">상세내역</button>
					<button class="button">문의하기</button>
					<button class="button">리뷰작성</button>
				</div>
				<hr class="line">
				<div class="list">
					<div class="imgDiv">
						<img class="img" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/drawing.jpg">
					</div>
					<div class="textDiv">
						<p class="text">
							힐링하며 그리는 유화 원데이 클래스<br><br>
							2020.10.01<br><br>
							25,000 원
						</p>
					</div>
				</div>
				<div class="btnDiv">
					<button class="button" onclick="openModal('detail')">상세내역</button>
					<button class="button">문의하기</button>
					<button class="button" disabled>작성완료</button>
				</div>
				<hr class="line">
				<div class="list">
					<div class="imgDiv">
						<img class="img" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/leather.jpg">
					</div>
					<div class="textDiv">
						<p class="text">
							감성저격 물성형 입체 가죽공예<br><br>
							2020.09.08<br><br>
							180,000 원
						</p>
					</div>
				</div>
				<div class="btnDiv">
					<button class="button" onclick="openModal('detail')">상세내역</button>
					<button class="button">문의하기</button>
					<button class="button" disabled>작성완료</button>
				</div>
				<hr class="line">
				<div class="list">
					<div class="imgDiv">
						<img class="img" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/write.jpg">
					</div>
					<div class="textDiv">
						<p class="text">
							또박또박 만년필로 반듯함을 씁니다, 펜글씨 클래스<br><br>
							2020.06.14<br><br>
							169,000 원
						</p>
					</div>
				</div>
				<div class="btnDiv">
					<button class="button" onclick="openModal('detail')">상세내역</button>
					<button class="button">문의하기</button>
					<button class="button" disabled>작성완료</button>
				</div>
				<hr class="line">
			<!-- 반복문 종료 -->
			</div>
		</div>
	</div>
	
	<c:import url="../common/footer.jsp"/>
	
	<!-- 모달 배경 -->
	<div id="modalBG"></div>
	<!-- 상세내역 모달창 -->
	<div class="modal-con detail">
		<a href="javascript:;" class="closeModal"><img class="xImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/x.png"></a>
		<div class="con">
			<table class="detailTable">
				<tr>
					<td colspan="4" class="detailTitle">활동 신청 상세내역</td>
				</tr>
				<tr>
					<td class="tdName">활동명</td>
					<td colspan="3">강릉 겨울서핑 & 렌탈권</td>
				</tr>
				<tr>
					<td class="tdName">신청일</td>
					<td colspan="3">2020.12.14</td>
				</tr>
				<tr>
					<td class="tdName">활동비</td>
					<td colspan="3">35,000원</td>
				</tr>
				<tr>
					<td class="tdName">활동기간</td>
					<td colspan="3">2020.12.21 06:00 ~ 2020.12.21 22:00</td>
				</tr>
				<tr>
					<td class="tdName">활동장소</td>
					<td colspan="3">강원 양양군 현남면 죽도해수욕장</td>
				</tr>
				<tr>
					<td colspan="4" class="modalTableTitle">결제정보</td>
				</tr>
				<tr>
					<td class="tdName">신청자</td>
					<td width="300px;">강건강</td>
					<td class="tdName">활동비</td>
					<td width="300px;">35,000원</td>
				</tr>
				<tr>
					<td class="tdName">연락처</td>
					<td>010-2222-3333</td>
					<td class="tdName">신청인원</td>
					<td>2명</td>
				</tr>
				<tr>
					<td class="tdName">주소</td>
					<td>서울시 강남구 역삼동 132-4번지 101호</td>
					<td class="tdName">결제금액</td>
					<td>70,000원</td>
				</tr>
				<tr>
					<td class="tdName">추가사항</td>
					<td>없음</td>
					<td class="tdName">결제수단</td>
					<td>삼성카드 5188-****-****-2342</td>
				</tr>
			</table>
		</div>
	</div>
	<!-- 리뷰작성 모달창 -->
	<div class="modal-con reviewWrite">
		<a href="javascript:;" class="closeModal"><img class="xImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/x.png"></a>
		<div class="con">
			<form method="post">
				<table class="reviewTable">
					<tr>
						<td>
							<div class="star-input">
								<div class="input">
									<input type="radio" name="star-input" id="p1" value="0.5"><label for="p1">0.5</label>
									<input type="radio" name="star-input" id="p2" value="1"><label for="p2">1</label>
									<input type="radio" name="star-input" id="p3" value="1.5"><label for="p3">1.5</label>
									<input type="radio" name="star-input" id="p4" value="2"><label for="p4">2</label>
									<input type="radio" name="star-input" id="p5" value="2.5"><label for="p5">2.5</label>
									<input type="radio" name="star-input" id="p6" value="3"><label for="p6">3</label>
									<input type="radio" name="star-input" id="p7" value="3.5"><label for="p7">3.5</label>
									<input type="radio" name="star-input" id="p8" value="4"><label for="p8">4</label>
									<input type="radio" name="star-input" id="p9" value="4.5"><label for="p9">4.5</label>
									<input type="radio" name="star-input" id="p10" value="5"><label for="p10">5</label>
								</div>
								<br>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<output for="star-input"><b class="score">0</b><b> 점</b></output>
						</td>
					</tr>
					<tr>
						<td>
							<textarea id="summernote" name="editordata"></textarea>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
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
	</script>
		
	<script>
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
	</script>
		
	<script>
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