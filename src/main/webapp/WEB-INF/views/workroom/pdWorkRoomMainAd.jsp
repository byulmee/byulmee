<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--
	메인컬러 - #FF6833
	메인폰트 - font-family: "G마켓 산스 TTF Medium";
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro&display=swap"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<style>
/* 여기서부터 */
	.outer {
		margin-top: 50px;
		margin-bottom: 50px;
		margin-left: auto;
		margin-right: auto;
		overflow: hidden;
		position: relative;
		width: 1000px;
		font-family: "G마켓 산스 TTF Medium";
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
		font-weight: bold;
	}
	.sideMenuList {
		text-align: center;
		list-style: none;
	}
	.sideMenuUl {
		list-style: none;
		padding-left: 0px;
	}
	.sideMenuBtn {
		font-family: "G마켓 산스 TTF Medium";
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
		margin-left: 250px;
		border: 2px solid #ECECEC;
		min-height: 700px;
	}
	.MainLogoText {
		margin-left: 250px;
	}
	.insertArea {
		float: right;
		list-style: none;
		padding-right: 5px;
		margin-bottom: 20px;
	}
	
	.insertBtn {
		font-family: "G마켓 산스 TTF Medium";
		font-size: 13px;
		padding-top: 5px;
		width: 150px;
		height: 35px;
		outline: 0;
		border: 0;
		background: none;
		cursor: pointer;
		background: #FF6833;
		color: white;
		border-radius: 25px;
	}
	
	.insertBtn:hover {
		background: #FFA98B;
		color: white;
	}
/* 여기까지 유지해서 페이지 만드시면 콘텐츠 길이만큼 사이드메뉴 회색배경 길이도 늘어납니다 */
	.MainText {
		color: #585858;
		font-size: 20px;
		margin-bottom: 20px;
	}
	.productArea {
		border-collapse: collapse;
		width: 750px;
		min-height: 620px;
		/* text-align: center; */
	}
	.product {
		margin-top: 20px;
		margin-left: 45px;
		vertical-align: middle;
		display: inline-block;
		width: 149px;
		height: 290px;
	}
	
	.img {
		width: 200px;
		height: 200px;
		padding: 10px;
		vertical-align: middle;
		object-fit: cover;
	}
	.text {
		font-size: 14px;
		font-family: "G마켓 산스 TTF Medium";
		padding-left: 10px;
		margin-bottom: 0px;
	}
	.text:hover {
		color: #FF6833;
		cursor: pointer;
	}
	.btnTd {
		text-align: right;
		padding-right: 5px;
		border-top: 3px solid #FF6833;
		border-bottom: 3px solid #FF6833;
	}
	
	.btnimg {
		width: 23px;
		hight: 19px;
		vertical-align: middle;
	}
	
	.priceText {
		text-align: left;
		margin-bottom: 0px;
		margin-left: 10px;
	}
	
	.btnimg2 {
		width: 18px;
		hight: 17px;
		vertical-align: middle;
	}
	
	.priceText2 {
		text-align: left;
		font-size: 8px;
		color: #9E9E9E;
		margin-left: 10px;
	}
	
	#pagingArea {
		text-align: center; 
		margin-top: 30px;
		margin-bottom: 15px;
	}

	#pagingArea > button {
		font-size: 10px;
	}

</style>
</head>
<body>
	<c:import url="../common/gnb.jsp"/>
	<div class="outer">
		<!-- 사이드 메뉴 -->
		<div class="sideMenu">
	    	<div class="profile">
				<%--  <img src="<%=request.getContextPath()%>/Image/LogoImage.png" onclick="goHome();"> --%>
				<c:if test="${ empty img }">
				<img class="profileImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/basic.png">
				</c:if>
				<c:if test="${ !empty img }">
					<c:if test="${ img.imgStatus == 'Y' }">
						<img class="profileImg" src="${ pageContext.servletContext.contextPath }/resources/piUploadFiles/${ img.imgName }">
					</c:if>
					<c:if test="${ img.imgStatus == 'N' }">
						<img class="profileImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/basic.png">
					</c:if>
				</c:if>
				<p class="nickname"> ${ loginUser.memNickname } </p>
				
			</div>
			<div class="sideMenuList">
				<ul class="sideMenuUl">
					<li class="sideMenuLi">
						<button onclick="location.href='wookroomView.wr'" class="sideMenuBtn">활동 목록 관리</button>
					</li>
					<li class="sideMenuLi">
						<button class="sideMenuBtn" id="selectedBtn">상품 목록 관리</button>
					</li>
					<li class="sideMenuLi">
						<button onclick="location.href='orderView.wr'" class="sideMenuBtn">주문 내역 관리</button>
					</li>
					<li class="sideMenuLi">
						<button onclick="location.href='customerView.wr'" class="sideMenuBtn">고객 문의 관리</button>
					</li>
				</ul>
			</div>
		</div>
		<div class="MainLogoText">
			<p class="MainText">
				스타 상품 전체보기
				<span class="insertArea"><button class="insertBtn" onclick="location.href='productInsertForm.wr'">상품등록</button></span>
			</p>
		</div>
		<div class="content">
			<div class="productArea">
				<c:forEach var="p" items="${ plist }">
				<%-- <div class="activity">
					<img class="img" src="${ pageContext.servletContext.contextPath }/resources/images/board/tennis1.jpg">
					<p class="text">[운동] 같이하는 테니스 일일레슨</p>
					<p class="priceText"><img class="btnimg" src="${ pageContext.servletContext.contextPath }/resources/images/board/button1.PNG" align="middle">50,000원</p>
					<p class="priceText2"><img class="btnimg2" src="${ pageContext.servletContext.contextPath }/resources/images/board/star1.PNG" align="middle">4.8 1891개의 평가</p>	
				</div> --%> 
				<c:if test="${ p.proStatus eq 'Y' }">
				<div class="product">
					<input type="hidden" name="proNo" value="${ p.proNo }">
					<c:forEach var="i" items="${ ilist }">
						<c:if test="${ p.proNo eq i.imgRefno and i.imgLevel eq '0'}">
							<img class="img" src="${ pageContext.servletContext.contextPath }/resources/auploadFiles/${ i.imgName }">
						</c:if>
					</c:forEach>
					<p class="text">[<c:choose>
							<c:when test="${ p.proCategory eq '0' }">액티비티</c:when>	
							<c:when test="${ p.proCategory eq '1' }">리빙</c:when>
							<c:when test="${ p.proCategory eq '2' }">건강/미용</c:when>
							<c:when test="${ p.proCategory eq '3' }">힐링</c:when>
							<c:when test="${ p.proCategory eq '4' }">푸드</c:when>
							<c:when test="${ p.proCategory eq '5' }">커리어</c:when>					
						</c:choose>] ${ p.proTitle }</p>
					<p class="priceText"><img class="btnimg" src="${ pageContext.servletContext.contextPath }/resources/images/board/button1.PNG" align="middle"><span id="price">${ p.proPrice }</span>원</p>
					<p class="priceText2"><img class="btnimg2" src="${ pageContext.servletContext.contextPath }/resources/images/board/star1.PNG" align="middle">${ p.proRating } ${ p.proReviewCnt }개의 평가</p>
				</div>
				</c:if>
				<c:if test="${ p.proStatus eq 'N' }">
				<div class="product" style="opacity: 0.5">
					<input type="hidden" name="proNo" value="${ p.proNo }">
					<c:forEach var="i" items="${ ilist }">
						<c:if test="${ p.proNo eq i.imgRefno and i.imgLevel eq '0'}">
							<img class="img" src="${ pageContext.servletContext.contextPath }/resources/auploadFiles/${ i.imgName }">
						</c:if>
					</c:forEach>
					<p class="text">[<c:choose>
							<c:when test="${ p.proCategory eq '0' }">액티비티</c:when>	
							<c:when test="${ p.proCategory eq '1' }">리빙</c:when>
							<c:when test="${ p.proCategory eq '2' }">건강/미용</c:when>
							<c:when test="${ p.proCategory eq '3' }">힐링</c:when>
							<c:when test="${ p.proCategory eq '4' }">푸드</c:when>
							<c:when test="${ p.proCategory eq '5' }">커리어</c:when>					
						</c:choose>] ${ p.proTitle }</p>
					<p class="priceText"><img class="btnimg" src="${ pageContext.servletContext.contextPath }/resources/images/board/button1.PNG" align="middle"><span id="price">${ p.proPrice }</span>원</p>
					<p class="priceText2"><img class="btnimg2" src="${ pageContext.servletContext.contextPath }/resources/images/board/star1.PNG" align="middle">${ p.proRating } ${ p.proReviewCnt }개의 평가</p>
				</div>
				</c:if>
				</c:forEach>
			</div>
			<div id="pagingArea">
				<!-- 이전 페이지로 -->
				<c:if test="${ pi.currentPage <= 1 }">
					<button class="btn btn-light" onclick="#" id="beforeBtn" disabled="disabled">&lt;</button>
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="productView.wr">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<button class="btn btn-light" onclick="location.href='${ before }'" id="beforeBtn">&lt;</button>
				</c:if>
				
				<!-- 숫자 목록 버튼 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<button class="btn btn-light" id="numBtn" class="text-reset" onclick="#"  disabled="disabled">${ p }</button>
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="productView.wr">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<button class="btn btn-light" id="numBtn" class="text-reset" onclick="location.href='${ pagination }'">${ p }</button>
					</c:if>
				</c:forEach>
				
				<!-- 다음 페이지로 -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					<button class="btn btn-light" onclick="#" id="afterBtn" disabled="disabled">&gt;</button>
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="productView.wr">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url>
					<button class="btn btn-light" onclick="location.href='${ after }'" id="afterBtn">&gt;</button>
				</c:if>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			$('.product').mouseenter(function(){
				$(this).css({'color': '#FF6833',  'font-weight':'bold', 'cursor': 'pointer'});
			}).mouseout(function(){
				$(this).css({'color': '#585858', 'font-weight':'normal'});
			}).click(function(){
				var proNo=$(this).children('input').val();
				console.log(proNo);
				location.href='proupdateform.wr?proNo=' + proNo + '&page=' + ${pi.currentPage};
			});
		});

		$('#selectedBtn').on('click', function(){
			location.reload();
		});

		// 가격에 천단위 ,(콤마)추가
	 /*    $(document).ready(function(){
			var price = $('#price').text();
	        price = price.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	        $('#price').html(price);
	    }); */
	</script>
</body>
</html>