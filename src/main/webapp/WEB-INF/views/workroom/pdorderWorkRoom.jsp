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
		min-height: 800px;
		
	}
	.MainLogoText {
		margin-left: 250px;
	}
	

/* 여기까지 유지해서 페이지 만드시면 콘텐츠 길이만큼 사이드메뉴 회색배경 길이도 늘어납니다 */
	.MainText {
		color: #585858;
		font-size: 20px;
	}

	#pagingArea {
		text-align: center; 
		margin-top: 15px;
		margin-bottom: 15px;
	}

	#pagingArea > button {
		font-size: 10px;
	}

	.insertBtn {
		margin-left: 8px;
		font-family: "G마켓 산스 TTF Medium";
		font-size: 13px;
		margin-top: 10px;
		width: 65px;
		height: 35px;
		outline: 0;
		border: 0;
		cursor: pointer;
		background: #F4F4F4;
		color: #585858;
		border-radius: 5px;
	}
	
	.insertBtn:hover {
		background: #FF6833;
		color: white;
	}
	
	#orderSelectedBtn {
		background: #FF6833;
		color: white;
		cursor: pointer;
	}
	
	/* 검색창  */
	.orderbox {
		border: 2px solid #ECECEC;
		padding-bottom: 15px;
	}
	
	.searchbox{
		margin-top: 10px;
		margin-left: 10px;	
	}
	
	.timeinput {
		width: 110px;
	}

	.searchId {
		margin-left: 15px;
	}
	
	.searchBtn {
		margin-left: 8px;
		font-family: "G마켓 산스 TTF Medium";
		font-size: 13px;
		margin-top: 10px;
		width: 70px;
		height: 30px;
		outline: 0;
		border: 0;
		cursor: pointer;
		background: #FF6833;
		color: white;
		border-radius: 10px;
	}
	
	/* 검색내용테이블 부분  */
	.searchValueArea{
		margin-top: 20px;
	}
	
	.valueText {
		color: #585858;
	}
	
	.totalprice {
		color: #FF6833;
	}
	
	table {
		border-collapse: collapse;
		width: 750px;
		font-size: 9px;
	}
	thead {
		background-color: #F4F4F4;
	}
	
	td {
		text-align: center;
	}
	
	.ordTitle {
		white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
	}
</style>
</head>
<body>
	<c:import url="../common/gnb.jsp"/>
	<div class="outer">
		<!-- 사이드 메뉴 -->
		<div class="sideMenu">
	    	<div class="profile">
				<!-- <img src="<%=request.getContextPath()%>/Image/LogoImage.png" onclick="goHome();"> -->
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
						<button onclick="location.href='wookroomView.wr'" class="sideMenuBtn" >활동 목록 관리</button>
					</li>
					<li class="sideMenuLi">
						<button onclick="location.href='productView.wr'" class="sideMenuBtn">상품 목록 관리</button>
					</li>
					<li class="sideMenuLi">
						<button class="sideMenuBtn" id="selectedBtn">주문 내역 관리</button>
					</li>
					<li class="sideMenuLi">
						<button onclick="location.href='customerView.wr'" class="sideMenuBtn">고객 문의 관리</button>
					</li>
				</ul>
			</div>
		</div>		
		<div class="MainLogoText">
			<p class="MainText">
				주문 내역 관리
			</p>
		</div>
		<div class="content">
			<div class="orderbox">
				<div class="buttonGroup">
					<button class="insertBtn" id="activityBtn">활동</button>
					<button class="insertBtn" id="orderSelectedBtn">상품</button>
				</div>
				<div class="searchbox">
					기간 &nbsp;&nbsp;<input type="text" class="timeinput" id="startday" placeholder="2021-01-21">
					&nbsp;-&nbsp;<input type="text" class="timeinput" id="endday" placeholder="2021-01-21">
					<span class="searchId">아이디</span>
					&nbsp;&nbsp;<input type="text" class="idInput" placeholder="고객 아이디를 입력하세요.">
					<button class="searchBtn" onclick="searchPdOrder();">조회</button>
				</div>
			</div>
			<div class="searchValueArea">
				<p class="valueText">
					<c:set var="total" value="0"/>
					<c:forEach var="od" items="${ odlist }">
						<c:set var="total" value="${ total + od.ordPay }"/>
					</c:forEach>
					주문 결과 총 매출&nbsp;&nbsp; <span class="totalprice">&#8361;<c:out value="${total}"/></span>
				</p>
				<div class="serachValue">
					<table class="table table-hover" id="listArea">
						<thead>
							<tr>
								<th scope="col" class="text-center" width="10%">주문번호</th>
								<th scope="col" class="text-center" width="10%">상품명</th>
								<th scope="col" class="text-center" width="2%">수</th>
								<th scope="col" class="text-center" width="10%">구매자</th>
								<th scope="col" class="text-center" width="10%">주문일</th>
								<th scope="col" class="text-center" width="10%">구매액</th>
								<th scope="col" class="text-center" width="10%">배송 번호</th>
								<th scope="col" class="text-center" width="10%">결제 수단</th>
								<th scope="col" class="text-center" width="10%">환불액</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="od" items="${ odlist }">
							<tr>
								<td>${ od.ordPayno }</td>
								<td class="ordTitle">${ od.product.proTitle }</td>
								<td>${ od.ordCount }</td>
								<td>${ od.memId }</td>
								<td>${ od.ordDate }</td>
								<td><span class="price">${ od.ordPay }</span></td>
								<c:choose>
									<c:when test="${ od.ordParcelcode eq null }">
										<td>&nbsp;&nbsp;</td>
									</c:when>
									<c:when test="${ od.ordParcelcode ne null }">
										<td>${ od.ordParcelcode }</td>
									</c:when>
								</c:choose>
								<c:choose>
									 <c:when test="${ od.ordPayWay eq 0 }">
									 	<td>카드</td>
									 </c:when>
									 <c:when test="${ od.ordPayWay eq 1 }">
									 	<td>페이</td>
									 </c:when>
								</c:choose>
								<c:choose>
									<c:when test="${ od.ordRePay eq 0 }">
										<td>&nbsp;&nbsp;</td>
									</c:when>
									<c:when test="${ od.ordRePay ne 0 }">
										<td><span class="price">${ od.ordRePay }</span>원</td>
									</c:when>
								</c:choose>
							</tr>
							
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div id="pagingArea">
			
				<c:if test="${ searchId eq null and startday eq null and endday eq null }">
					<c:set var="loc" value="orderView.wr"/>
				</c:if>
				<c:if test="${ searchId ne null and startday ne null and endday ne null }">
					<c:set var="loc" value="searchPdOrder.wr"/>
				</c:if>			
			
				<!-- 이전 페이지로 -->
				<c:if test="${ pi.currentPage <= 1 }">
					<button class="btn btn-light" onclick="#" id="beforeBtn" disabled="disabled">&lt;</button>
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="${ loc }">
						<c:if test="${ searchId ne null and startday ne null and endday ne null }">
							<c:param name="searchId" value="${ searchId }"/>
							<c:param name="startday" value="${ startday }"/>
							<c:param name="endday" value="${ endday }"/>
						</c:if>
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
						<c:url var="before" value="${ loc }">
							<c:if test="${ searchId ne null and startday ne null and endday ne null }">
								<c:param name="searchId" value="${ searchId }"/>
								<c:param name="startday" value="${ startday }"/>
								<c:param name="endday" value="${ endday }"/>
							</c:if>
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
					<c:url var="before" value="${ loc }">
						<c:if test="${ searchId ne null and startday ne null and endday ne null }">
							<c:param name="searchId" value="${ searchId }"/>
							<c:param name="startday" value="${ startday }"/>
							<c:param name="endday" value="${ endday }"/>
						</c:if>
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url>
					<button class="btn btn-light" onclick="location.href='${ after }'" id="afterBtn">&gt;</button>
				</c:if>
			</div>
		</div>
	</div>
	<script>
		$('#selectedBtn').on('click', function(){
			location.reload();
		});

		$(document).ready(function(){
			var price = $('.price').text();
			var totalprice = $('.totalprice').text();
	        price = price.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	        totalprice = totalprice.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	        $('.price').html(price);
	        $('.totalprice').html(totalprice);
		});

		$('#activityBtn').on('click', function(){
			location.href='orderView.wr';
		});

		function searchPdOrder(){
			var searchId = $(".idInput").val();
			var startday = $("#startday").val();
			var endday = $("#endday").val();

			location.href="searchPdOrder.wr?searchId=" + searchId + "&startday=" + startday + "&endday=" + endday;
		}
	</script>
</body>
</html>