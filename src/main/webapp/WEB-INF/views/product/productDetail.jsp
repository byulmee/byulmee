<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<style>
@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'GmarketSansBold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'GmarketSansLight';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	margin: 0;
	font-family: 'GmarketSansMedium';
}

.outer {
	width: 1280px;
	min-height: auto;
	border: 5px solid white;
	margin-left: auto;
	margin-right: auto;
}

.thumbnail {
	float: left;
	width: 500px;
	height: 500px;
	box-sizing: border-box;
	background-color: gray;
	margin-left: 162px;
	margin-top: 100px;
}

#thumbImg {
	width: 500px;
	height: 500px;
	object-fit: fill;
}

.titleImg {
	width: 800px;
	height: auto;
	object-fit: fill;
}

.product-info {
	float: left;
	width: 500px;
	box-sizing: border-box;
	margin-top: 100px;
	margin-left: 50px;
}

#title {
	margin-top: 15px;
	font-size: 25px;
}

.price {
	margin-top: 15px;
}

#price {
	font-size: 30px;
}

.star {
	margin-top: 20px;
}

#star1 {
	font-size: 15px;
	color: #ffd400;
}

#star2 {
	font-size: 15px;
	color: #9E9E9E;
}

#star3 {
	font-size: 15px;
	color: #9E9E9E;
}

.option {
	margin-top: 25px;
}

#option1 {
	font-size: 15px;
	color: #9E9E9E;
}

#plus, #minus {
	border: 1px solid #E9E9E9;
	color: 9E9E9E;
	background-color: #F7F7F7;
	outline: 0;
	cursor: pointer;
}

#amount{
	width: 20px;
	border: none;
	text-align: center;
	font-size: 15px;
	color: black;
	font-family: 'GmarketSansMedium';
}

#option3 {
	font-size: 12px;
	color: #9E9E9E;
}

.all-price {
	margin-top: 20px;
}

#all-price1 {
	font-size: 15px;
	color: #9E9E9E;
}

input:focus {
	outline:none;
}

#all-price3 {
	font-size: 15px;
}

#all-price-fix{
	min-width: 103px auto;
	border: none;
	font-size: 25px;
	color: black;
	font-family: 'GmarketSansMedium';
}

.button {
	margin-top: 25px;
}

#button1 {
	border: 1px solid #E9E9E9;
	background: white;
	border-radius: 18px;
	color: #9B9B9B;
	width: 197px;
	height: 76px;
	text-align: center;
	font-size: 18px;
	outline: 0;
	cursor: pointer;
}

#button3 {
	border: 1px solid #E9E9E9;
	background: white;
	border-radius: 18px;
	color: #9B9B9B;
	width: 197px;
	height: 76px;
	text-align: center;
	font-size: 18px;
	outline: 0;
	cursor: pointer;
}

#button2 {
	border: 1px solid black;
	background: black;
	border-radius: 18px;
	color: white;
	width: 197px;
	height: 76px;
	text-align: center;
	font-size: 18px;
	margin-left: 7px;
	outline: 0;
	cursor: pointer;
}

#button4 {
	border: 1px solid black;
	background: black;
	border-radius: 18px;
	color: white;
	width: 197px;
	height: 76px;
	text-align: center;
	font-size: 18px;
	margin-left: 7px;
	outline: 0;
	cursor: pointer;
}

.starInfo {
	padding-top: 12px;
	line-height: 30px;
	margin-top: 22px;
	width: 407px;
	height: 109px;
	border-top: 1px solid #E9E9E9;
	border-bottom: 1px solid #E9E9E9;
	text-align: center;
	background-color: #f8f8f8;
}

#star_img {
	vertical-align: middle;
}

#starInfo1 {
	padding-top: 10px;
	font-size: 18px;
}

#starInfo2 {
	padding-top: 10px;
	color: #9B9B9B;
	font-size: 15px;
}

#starInfo3 {
	padding-top: 10px;
	color: #9B9B9B;
	font-size: 15px;
	border-left: 1px solid #E9E9E9;
}

#star-button1 {
	border: 1px solid #888888;
	background: #F0F0F0;
	border-radius: 5px;
	color: #888888;
	width: 110px;
	height: 20px;
	font-size: 12px;
	outline: 0;
	cursor: pointer;
	vertical-align: middle;
	margin-top: 4px;
}

#star-button2 {
	border: 1px solid #888888;
	background: white;
	border-radius: 5px;
	color: #888888;
	width: 110px;
	height: 20px;
	font-size: 12px;
	outline: 0;
	cursor: pointer;
	vertical-align: middle;
	margin-top: 4px;
}

#star-button3 {
	border: 1px solid #888888;
	background: white;
	border-radius: 5px;
	color: #888888;
	width: 110px;
	height: 20px;
	font-size: 12px;
	outline: 0;
	cursor: pointer;
	vertical-align: middle;
	margin-top: 4px;
}

hr {
	width: 1280px;
	visibility: hidden;
}

.nav-area {
	height: 50px;
	width: 957px;
	margin-top: 55px;
	margin-bottom: 55px;
}

.menu {
	display: table-cell;
	width: 239px;
	height: 50px;
	text-align: center;
	vertical-align: middle;
	font-size: 17px;
	background-color: white;
	color: #888888;
	border-top: 1px solid #E9E9E9;
	border-bottom: 1px solid #E9E9E9;
}

.menu:hover {
	border-top: 3px solid black;
	font-weight: bold;
	cursor: pointer;
}

#menu1, #menu2, #menu3, #menu4 {
	border-top: 3px solid black;
	font-weight: bold;
}

.detailArea {
	height: auto;
	width: 957px;
	background-color: white;
}

#place, #starMessage{
	font-size: 20px;
	margin: 50px 0 15px 0;
	font-family: 'GmarketSansBold';
}

#starMessage2{
	line-height: 120%;
	width: 800px;
}

.reviewArea {
	width: 800px;
	min-height: auto;
}

.review_flex{
 	width: 800px;
	table-layout: fixed;
}

.reviewDetail_Main{
	width: 630px;
	text-overflow: ellipsis;
 	overflow: hidden;
	display:-webkit-box; 
    word-wrap:break-word; 
    -webkit-line-clamp:2; 
    -webkit-box-orient:vertical; 
    height: 40px;
    line-height: 20px;
}

.reviewMdDetail_Main{
	width: 630px;
	color : black;
	font-size: 14px;
	font-family: 'GmarketSansMedium';
}

.reviewWriter {
	width: auto;
}

.reviewWriter_Main {
	width: 800px;
	min-height: auto;
	margin-bottom: 15px;
}

#reviewDate {
	color: #9E9E9E;
	font-size: 13px;
	text-align: left;
}

#reviewStar {
	color: #ffd400;
	font-size: 15px;
	text-align: left;
	vertical-align: middle;
}

#reviewNo {
	visibility: collapse;
}

.reviewImageArea {
	width: 800px;
	min-height: auto;
	margin-bottom: 15px;
	border-spacing: 5px;
}

.reviewImageArea_Main {
	width: 110px;
	height: 100px;
	background-color: none;
}

.reviewMdImageArea_Main {
	width: 200px;
	height: 200px;
	background-color: none;
}

.reviewMdThumb {
	width: 200px;
	height: 200px;
	object-fit: fill;
	border-radius: 10px;
}

.reviewThumb {
	width: 100px;
	height: 100px;
	object-fit: fill;
	border-radius: 10px;
}

.reviewWriter_Main {
	width: 800px;
	min-height: auto;
	margin-bottom: 15px;
	border-spacing: 5px;
}

.reviewImage {
	display: table-cell;
	width: 150px;
	height: 150px;
	background-color: #E9E9E9;
}

.reviewImage_Main {
	width: 100px;
	height: 100px;
	background-color: #E9E9E9;
}

.reviewDetail {
	width: 800px;
	min-height: auto;
	margin-bottom: 15px;
	margin-left: 10px;
	font-size: 15px;
	color: #767676;
}

.reviewDetail_Main {
	font-size: 13px;
	color: #767676;
}

.expand {
	width: 800px;
	min-height: auto;
}

.trReviewExpand {
	text-align: center; 
	position:relative; 
	margin:0 auto; 
}

.expandButton {
	cursor: pointer;
	font-family: 'GmarketSansMedium';
	font-size: 12px;
	text-align: right;
	margin-right: 2px;
}

.expandButton:hover {
	color: black;
}

.expandButton {
	border: 0;
	background-color: white;
	color: #9E9E9E;
}

.question {
 	width: 800px;
 	line-height: 40px;
 	margin-top: 10px;
 	table-layout: fixed;
} 

.questionExcept {
	visibility: collapse;
 	width: 800px;
 	line-height: 40px;
 	margin-bottom: 10px;
 	table-layout: fixed;
} 

.question td:not(.noqna){
 	border-bottom: 1px solid #E9E9E9;
 	text-align: left;
} 

#memId, #salqnaTitle, #salqnaDate, #salqnaDetail{
 	text-overflow: ellipsis;
 	overflow: hidden;
 	white-space: nowrap;
} 

.noqna {
	text-align: center;
}

.question tr:not(.noqna):hover{
 	background-color: #f9f9f9;
} 

.questionExcept td{
 	border-bottom: 1px solid #E9E9E9;
 	text-align: left;
} 

.questionExcept tr:hover{
 	background-color: #f9f9f9;
} 

#salqnaTitle, #salqnaTitleExcept {
 	font-size: 15px;
 	margin-right: 400px;
}

#salqnaDate, #salqnaDateExcept {
 	font-size: 13px;
 	margin-right: 20px;
 	color: #9E9E9E;
 	text-align: center;
}

#salqnaDetail, #salqnaDetailExcept {
 	font-size: 12px;
 	margin-right: 20px;
 	color: #9E9E9E;
 	text-align: right;
}

#salqnaNo, #salqnaNoExcept {
 	visibility: hidden; 
}

.trContent{
  	display: none;
}

.salqnaReply{
	display: none;
}

.show {
	display:table-row; 
	height: auto;
	font-size:12px;
	background-color: #f9f9f9;
}
.show2 {
	display:table-row; 
	height: auto;
	font-size:12px;
	background-color: #f9f9f9;
}

.trQuestion td {
	cursor:pointer;
}

#qnaReply, #qnaContent {
	padding-left: 30px;
	padding-right: 30px;
	font-size: 13px;
}

#all-question {
	width: 800px;
	text-align: right;
	font-size: 13px;
	cursor: pointer;
	color: #9E9E9E;
	margin-right: 15px;
}

#all-question:hover{
	color: black;
}

#questionButton {
	margin-top: 15px;
	border: 1px solid black;
	background: black;
	border-radius: 5px;
	color: white;
	width: 80px;
	height: 30px;
	text-align: center;
	font-size: 13px;
	margin-left: 7px;
	outline: 0;
	cursor: pointer;
	font-weight: bold;
}

.refundArea {
	width: 957px;
	border-bottom: 1px solid #E9E9E9;
}

.refund {
	width: 800px;
	height: 200px;
	text-align: left; 
	position: relative; 
	margin: 0 auto; 
}

.declare {
	width: 957px;
	height: 130px;
}

#declareButton {
	margin-top: 15px;
	border: 0;
	background: #EFEFEF;
	border-radius: 8px;
	color: #5A5A5A;
	width: 150px;
	height: 40px;
	text-align: center;
	font-size: 13px;
	margin-left: 7px;
	outline: 0;
	cursor: pointer;
	font-weight: bold;
}

.recommendArea {
	margin-bottom: 10px;
}

#recommend {
	font-size: 22px;
	font-weight: bold;
}
/* 후기 모달창 */
.review_wrap {
	display: none;
	width: 650px;
	min-height: 410px;
	position: fixed;
	top: 50%;
	left: 50%;
	margin: -250px -350px; 0 -250 px;
	padding: 20px;
	background: white;
	z-index: 1000;
}

.review_modal{
	width: 650px;
	min-height: 410px;
	position: fixed;
	top: 50%;
	left: 50%;
	margin: -250px -350px; 0 -250 px;
	padding: 20px;
	background: white;
}

.black_bg {
	display: none;
	position: fixed;
	content: "";
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	top: 0;
	left: 0;
	z-index: 999;
}

.review_close {
	width: 26px;
	height: 26px;
	position: absolute;
	top: -30px;
	right: 0;
}

.review_close>a {
	display: block;
	width: 100%;
	height: 100%;
	background: url(https://img.icons8.com/metro/26/000000/close-window.png);
	text-indent: -9999px;
}

/* 이런 별미는 어때요 */
.rec-list {
	width: 80vw;
	margin: auto;
	max-width: 980px;
}

.list {
	display: flex;
	justify-content: space-between;
	white-space: nowrap;
	overflow-x: auto;
	overflow-y: hidden;
}

.list li{
	text-align: left; 
	position:relative; 
	margin:0 auto; 
}

.list-item {
	width: 170px;
	display: inline-block;
	font-size: 0.6rem;
	margin-right: 1.2rem;
}

.item5 {
	margin-right: 0;
}

.list-item span {
	display: block;
	color: #313131;
	line-height: 1.2rem;
	font-family: 'GmarketSansLight';
}

.list-cate {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	font-size: 0.8rem;
	padding: 0.2rem 0;
}

.list-thumb {
	width: 170px;
	height: 175px;
	object-fit: cover;
}

.list-item span:nth-of-type(1) {
	color: #9E9E9E;
	font-size: 0.2rem;
	font-weight: 500;
}

.list-item span:nth-of-type(2) {
	font-family: 'GmarketSansMidium';
	font-size: 0.7rem;
	font-weight: 700;
}

.list-item span:nth-of-type(3) {
	color: #9E9E9E;
	font-size: 0.4rem;
}

.fa-receipt {
	font-size: 0.8rem;
	vertical-align: middle;
	margin-right: 4px;
	color: #D8D8D8;
}

.list-item:hover {
	cursor: pointer;
}

.rec-list.last {
	margin-bottom: 80px;
}

#acId {
	display: none;
}

#pagingArea {
	text-align: center; 
	margin-top: 15px;
	margin-bottom: 15px;
}

#pagingArea > button {
	font-size: 10px;
}



</style>
</head>
<body>
	<c:import url="../common/gnbTypeB.jsp" />
	
	<div class="outer" align="center">
	<form id="productCheck" action="productCheck.pd" method="post">
		<!-- 상단 섬네일, 상품 정보 -->
		<div class="top">
			<div class="thumbnail" align="center">
				<img src="${ thumb }" id="thumbImg">
			</div>

			<div class="product-info" align="left">
				<div id="title">[${ category }] ${ product.proTitle }</div>
				<input type="hidden" name="pdId" value="${ product.proNo }">
				<div class="price">
					<span id="price">${ product.proPrice }</span> <span id="one">원</span>
				</div>
				
				<c:if test="${ reviewNum != 0 }">
					<div class="star">
						<c:if test="${ ratingAvg >= 4.5 }">
							<span id="star1"><img class='rating' src='resources\\images\\rating\\star10.png'></span> 
						</c:if>
						<c:if test="${ ratingAvg >= 4 && ratingAvg < 4.5 }">
							<span id="star1"><img class='rating' src='resources\\images\\rating\\star9.png'></span> 
						</c:if>
						<c:if test="${ ratingAvg >= 3.5 && ratingAvg < 4 }">
							<span id="star1"><img class='rating' src='resources\\images\\rating\\star8.png'></span> 
						</c:if>
						<c:if test="${ ratingAvg >= 3 && ratingAvg < 3.5 }">
							<span id="star1"><img class='rating' src='resources\\images\\rating\\star7.png'></span> 
						</c:if>
						<c:if test="${ ratingAvg >= 2.5 && ratingAvg < 3 }">
							<span id="star1"><img class='rating' src='resources\\images\\rating\\star6.png'></span> 
						</c:if>
						<c:if test="${ ratingAvg >= 2 && ratingAvg < 2.5 }">
							<span id="star1"><img class='rating' src='resources\\images\\rating\\star5.png'></span> 
						</c:if>
						<c:if test="${ ratingAvg >= 1.5 && ratingAvg < 2 }">
							<span id="star1"><img class='rating' src='resources\\images\\rating\\star4.png'></span> 
						</c:if>
						<c:if test="${ ratingAvg >= 1 && ratingAvg < 1.5 }">
							<span id="star1"><img class='rating' src='resources\\images\\rating\\star3.png'></span> 
						</c:if>
						<c:if test="${ ratingAvg >= 0.5 && ratingAvg < 1 }">
							<span id="star1"><img class='rating' src='resources\\images\\rating\\star2.png'></span> 
						</c:if>
						<c:if test="${ ratingAvg < 0.5 }">
							<span id="star1"><img class='rating' src='resources\\images\\rating\\star1.png'></span> 
						</c:if>
						<span id="star2">${ ratingAvg }</span> 
						<span id="star3">${ reviewNum }개의 평가</span>
					</div>
				</c:if>
				<c:if test="${ reviewNum == 0 }">
					<div class="star">
						<span id="star3">등록된 별점이 없습니다.</span>
					</div>
				</c:if>
				
				<div class="option">
					<span id="option1">수량 선택&nbsp;</span> 
					<span><button type="button" id="minus" onclick="cntNum(-1);">-</button></span>
					<span id="option2"><input type="text" id="amount" name="amount" value="1" onchange="setNum();" readonly></span> 
					<span><button type="button" id="plus" onclick="cntNum(1);">+</button></span> 
					<span id="option3">잔여 수량 : ${ possibleStock }개</span>
				</div>
				<div class="all-price">
					<span id="all-price1">합계 금액</span> 
					<span id="all-price2"><input type="text" id="all-price-fix" name="all-price2" value="${ product.proPrice }원" onchange="setNum();" readonly></span>
				</div>
				
				<div class="button">
					<c:if test="${ !empty loginUser }">
					<input type="button" id="button1" style="padding: 5px; line-height:100%; text-align:center; font-family: 'GmarketSansMedium';" value="상품 찜하기"> 
					</c:if>
					<c:if test="${ !empty loginUser }">
					<input type="submit" id="button2" style="padding: 5px; line-height:100%; text-align:center; font-family: 'GmarketSansMedium';" value="구매하기">
					</c:if>
					<c:if test="${ empty loginUser }">
					<input type="button" id="button3" style="padding: 5px; line-height:100%; text-align:center; font-family: 'GmarketSansMedium';" value="상품 찜하기" onclick="alert('로그인 후 이용 가능합니다.')"> 
					</c:if>
					<c:if test="${ empty loginUser }">
					<input type="button" id="button4" style="padding: 5px; line-height:100%; text-align:center; font-family: 'GmarketSansMedium';" value="구매하기" onclick="alert('로그인 후 이용 가능합니다.')">
					</c:if>
				</div>
				<div class="starInfo">
					<span><img src="resources/images/detail/starBlack.png" width="18px" id="star_img" alt="별"></span>
					<span><strong id="starInfo1">${ writer.memNickname }</strong></span><br>
					<span id="starInfo2">${ writer.memPhone }&nbsp;&nbsp;</span>
					<span id="starInfo3"> &nbsp;&nbsp;${ writer.memEmail }</span><br>
					<input type="button" id="star-button1" style="padding: 5px; line-height:100%; text-align:center; font-family: 'GmarketSansMedium';" value="+작업실 방문하기"> 
					
					<c:url var="starFavoriteInsertProduct" value="starFavoriteInsertProduct.fa">
						<c:param name="starNo" value="${ writer.memNo }"></c:param>
						<c:param name="pdId" value="${ product.proNo }"></c:param>
					</c:url>
					<c:if test="${ !empty loginUser }">
					<input type="button" id="star-button2" style="padding: 5px; line-height:100%; text-align:center; font-family: 'GmarketSansMedium';" value="+스타 찜하기" onclick="location.href='${ starFavoriteInsertProduct }'">
					</c:if>
					<c:if test="${ empty loginUser }">
					<input type="button" id="star-button3" style="padding: 5px; line-height:100%; text-align:center; font-family: 'GmarketSansMedium';" value="+스타 찜하기" onclick="alert('로그인 후 이용 가능합니다.')">
					</c:if>
				</div>
			</div>
		</div>
		
		<!-- 수량 버튼 클릭에 따라 총 활동비와 수량 변경 -->
		<script>
			var cnt = 1;
			var amount = document.getElementById("amount");
			var price = document.getElementById("price").innerHTML;
			var possibleNum = "<c:out value='${ product.proMaximum }'/>";
			
			function cntNum(n){
				cnt += n;
				checkNum();
			}
			
			function setNum(){
				cnt = Number(amount.value);
				checkNum();
			}
			
			function checkNum(){
				if(cnt < 1){
					cnt = 1
				} else if(cnt > possibleNum){
					cnt = possibleNum;
					alert("구매 가능한 최대 갯수를 초과하였습니다.");
					cnt = possibleNum - 1;
				}
				amount.value = cnt;
				var total = String(price * cnt);
				total = total.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
 				document.getElementById("all-price2").innerHTML = '<input type="text" id="all-price-fix" name="all-price2" value="' + total + "원" + '"onchange="setNum();" readonly>';
//  				document.getElementById("all-price2").innerHTML = total;
			}
			
			// 평균 별점 소수점 절삭
			var rating = "<c:out value='${ ratingAvg }'/>";
		    $(document).ready(function(){
				var rating = $('#star2').text();
				var ratingAvg = parseFloat(rating).toFixed(1);
		        $('#star2').text(ratingAvg);
		    });
		
			// 상품 찜하기
			var pdId = "<c:out value='${ product.proNo}'/>";
			$(function(){
				$('#button1').click(function(){
					location.href='productFavorite.fa?pdId=' + pdId;
					alert('찜목록에 추가되었습니다!');
				});
			});
			
			// 가격에 천단위 ,(콤마)추가
		    $(document).ready(function(){
				var price = $('#price').text();
		        price = price.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		        $('#price').html(price);
		    });
			
			// 토탈금액에 천단위 ,(콤마)추가
		    $(document).ready(function(){
				var total = $('#all-price2').html();
				total = total.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		        $('#all-price2').html(total);
		    });
			
			// 스타 휴대폰에 -(하이픈)추가
			$(document).ready(function(){
				var starPhone = $('#starInfo2').text();
				starPhone = starPhone.replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-");
				$('#starInfo2').html(starPhone);
			});
		</script>
		</form>

		<hr>
		<!-- 메뉴바 -->
		<div class="nav-area" align="center">
			<div class="menu" id="menu1">
				<a href="#menu1">상품 정보</a>
			</div>
			<div class="menu">
				<a href="#menu2">상품 후기</a>
			</div>
			<div class="menu">
				<a href="#menu3">상품 문의</a>
			</div>
			<div class="menu">
				<a href="#menu4">취소/환불 규정</a>
			</div>
		</div>

		<!-- 본문영역 -->
		<div class="detailArea">
			<img src="${ content1 }" class="titleImg">
			<img src="${ content2 }" class="titleImg">
			<img src="${ content3 }" class="titleImg">
			<img src="${ content4 }" class="titleImg">
			<div id="starMessage">스타 한마디</div>
			<div id="starMessage2" align="left">${ contentText }</div>
		</div>

		<!-- 메뉴바 -->
		<div class="nav-area" align="center">
			<div class="menu">
				<a href="#menu1">상품 정보</a>
			</div>
			<div class="menu" id="menu2">
				<a href="#menu2">상품 후기</a>
			</div>
			<div class="menu">
				<a href="#menu3">상품 문의</a>
			</div>
			<div class="menu">
				<a href="#menu4">취소/환불 규정</a>
			</div>
		</div>

		<!-- 별미 후기 -->
		<div class="reviewArea">
			<table class="review_flex">
				<thead>
					<tr></tr>			
				</thead>
				<tbody></tbody>
			</table>
			
			<div class="expand" align="right">
				
				<div class="black_bg"></div>
				
				<div class="review_wrap">
					<div class="review_close">
						<a href="javascript:;"></a>
						<div>
							<table class="review_modal">
								<thead>
									<tr></tr>			
								</thead>
								<tbody></tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<script>
			var pdId = "<c:out value='${ product.proNo}'/>";
			
			$.ajax({
				url: 'salesProductReviewList.pd',
				data: {pdId:pdId},
				success: function(data){
					console.log(data);
					
					$review = $('.review_flex tbody');
					
					var $tr;
					var $tr2;
					var $div;
					var $memId;
					var $revDate;
					var $revRating;
					var $revContent;
					var $revNo;	
					var $expand;
					
					if(data.length > 0){
						for(var i in data){
							$tr = $('<tr class="trReview">');
							$tr2 = $('<tr class="trReviewContent">');
							$memId = $('<td id="reviewWriter">').text(data[i].member.memNickname);
							$revDate = $('<td id="reviewDate">').text(data[i].revDate);
							$revRating = $('<td id="reviewStar">').text(data[i].revRating);
							$revNo = $('<td id="reviewNo">').text(data[i].revNo);
							$revContent = $('<td colspan="5" class="reviewDetail_Main">').text(data[i].revContent);
							$expand = $('<td class="expandButton" text-align="right">').text("+내용보기");
							
							if(data[i].image != null ){
								$div = $('<td rowspan="2" class="reviewImageArea_Main">').html("<img class='reviewThumb' src='resources\\riUploadFiles\\" + data[i].image[i].imgName + "'>");
// 								$div = $('<td rowspan="2" class="reviewImageArea_Main">').html("<img class='reviewThumb' src='resources\\riUploadFiles\\202101262000005802.jpg'>");
							} else{
								$div = $('<td rowspan="2" class="reviewImageArea_Main">').html("<img class='reviewThumb' src='resources\\images\\detail\\x.png'>");
							}
							
							if(data[i].revRating == 0.5){
								$revRating = $('<td id="reviewStar">').html("<img class='rating' src='resources\\images\\rating\\star1.png'>");
							} else if(data[i].revRating == 1){
								$revRating = $('<td id="reviewStar">').html("<img class='rating' src='resources\\images\\rating\\star2.png'>");
							} else if(data[i].revRating == 1.5){
								$revRating = $('<td id="reviewStar">').html("<img class='rating' src='resources\\images\\rating\\star3.png'>");
							} else if(data[i].revRating == 2){
								$revRating = $('<td id="reviewStar">').html("<img class='rating' src='resources\\images\\rating\\star4.png'>");
							} else if(data[i].revRating == 2.5){
								$revRating = $('<td id="reviewStar">').html("<img class='rating' src='resources\\images\\rating\\star5.png'>");
							} else if(data[i].revRating == 3){
								$revRating = $('<td id="reviewStar">').html("<img class='rating' src='resources\\images\\rating\\star6.png'>");
							} else if(data[i].revRating == 3.5){
								$revRating = $('<td id="reviewStar">').html("<img class='rating' src='resources\\images\\rating\\star7.png'>");
							} else if(data[i].revRating == 4){
								$revRating = $('<td id="reviewStar">').html("<img class='rating' src='resources\\images\\rating\\star8.png'>");
							} else if(data[i].revRating == 4.5){
								$revRating = $('<td id="reviewStar">').html("<img class='rating' src='resources\\images\\rating\\star9.png'>");
							} else {
								$revRating = $('<td id="reviewStar">').html("<img class='rating' src='resources\\images\\rating\\star10.png'>");
							}
							
							$tr.append($div);
							$tr.append($memId);
							$tr.append($revRating);
							$tr.append($revDate);
							$tr.append($revNo);
							$tr.append($expand);
							$review.append($tr);
							$tr2.append($revContent);
							$review.append($tr2);
							
						}
					} else{
						$tr = $('<tr>');
						$revContent = $('<td>').text('등록된 후기가 없습니다.');
						
						$tr.append($revContent);
						$review.append($tr);
					}
				}
			});
		</script>
				
		<script>
		$(document).on("click", ".expandButton", function(){ 
			var revNo = $(this).prev().text();
			console.log(revNo);
			
			$.ajax({
				url: 'salesProductReviewDetail.pd',
				data: {revNo:revNo},
				success: function(data){
					console.log(data);
					
					$review = $('.review_modal tbody');
					
					var $tr;
					var $tr2;
					var $tr3;
					var $div1;
					var $div2;
					var $div3;
					var $memId;
					var $revDate;
					var $revRating;
					var $revContent;
					
					$tr = $('<tr height="30px" class="trMdReview">');
					$tr2 = $('<tr class="trMdReviewContent">');
					$tr3 = $('<tr class="reviewMdImageArea">');
					$memId = $('<td id="reviewMdWriter">').text("작성자 : " + data.member.memNickname);
					$revDate = $('<td id="reviewMdDate">').text("작성일 : " + data.revDate);
					$revContent = $('<td colspan="3">').html("<pre class='reviewMdDetail_Main'>" + data.revContent);
					
					if(data.image != null){
						$div1 = $('<td class="reviewMdImageArea_Main">').html("<img class='reviewMdThumb' src='resources\\riUploadFiles\\" + data.image[0].imgName + "'>");
						$div2 = $('<td class="reviewMdImageArea_Main">').html("<img class='reviewMdThumb' src='resources\\riUploadFiles\\" + data.image[1].imgName + "'>");
						$div3 = $('<td class="reviewMdImageArea_Main">').html("<img class='reviewMdThumb' src='resources\\riUploadFiles\\" + data.image[2].imgName + "'>");
					} else{
						$div1 = $('<td class="reviewMdImageArea_Main">').html("<img class='reviewMdThumb' src='resources\\images\\detail\\x.png'>");
						$div2 = $('<td class="reviewMdImageArea_Main">').html("<img class='reviewMdThumb' src='resources\\images\\detail\\x.png'>");
						$div3 = $('<td class="reviewMdImageArea_Main">').html("<img class='reviewMdThumb' src='resources\\images\\detail\\x.png'>");
					}
					
					
					if(data.revRating == 0.5){
						$revRating = $('<td id="reviewMdStar">').html("별점 : " + "<img class='rating' src='resources\\images\\rating\\star1.png'>");
					} else if(data.revRating == 1){
						$revRating = $('<td id="reviewMdStar">').html("별점 : " + "<img class='rating' src='resources\\images\\rating\\star2.png'>");
					} else if(data.revRating == 1.5){
						$revRating = $('<td id="reviewMdStar">').html("별점 : " + "<img class='rating' src='resources\\images\\rating\\star3.png'>");
					} else if(data.revRating == 2){
						$revRating = $('<td id="reviewMdStar">').html("별점 : " + "<img class='rating' src='resources\\images\\rating\\star4.png'>");
					} else if(data.revRating == 2.5){
						$revRating = $('<td id="reviewMdStar">').html("별점 : " + "<img class='rating' src='resources\\images\\rating\\star5.png'>");
					} else if(data.revRating == 3){
						$revRating = $('<td id="reviewMdStar">').html("별점 : " + "<img class='rating' src='resources\\images\\rating\\star6.png'>");
					} else if(data.revRating == 3.5){
						$revRating = $('<td id="reviewMdStar">').html("별점 : " + "<img class='rating' src='resources\\images\\rating\\star7.png'>");
					} else if(data.revRating == 4){
						$revRating = $('<td id="reviewMdStar">').html("별점 : " + "<img class='rating' src='resources\\images\\rating\\star8.png'>");
					} else if(data.revRating == 4.5){
						$revRating = $('<td id="reviewMdStar">').html("별점 : " + "<img class='rating' src='resources\\images\\rating\\star9.png'>");
					} else {
						$revRating = $('<td id="reviewMdStar">').html("별점 : " + "<img class='rating' src='resources\\images\\rating\\star10.png'>");
					}
					
					$tr.append($memId);
					$tr.append($revRating);
					$tr.append($revDate);
					$review.append($tr);
					$tr2.append($revContent);
					$review.append($tr2);
					$tr3.append($div1);
					$tr3.append($div2);
					$tr3.append($div3);
					$review.append($tr3);
				}
			});
		});
		</script>
				
		<!-- 후기 모달 열기 -->
		<script>
			window.onload = function(){
				function onClick(){
					document.querySelector('.review_wrap').style.display = 'block';
					document.querySelector('.black_bg').style.display = 'block';
				}
				function offClick(){
					document.querySelector('.review_wrap').style.display = 'none';
					document.querySelector('.black_bg').style.display = 'none';
					$( '.review_wrap tbody').empty();
				}
				
				var expand = document.querySelectorAll('.expandButton');
				for(var i = 0; i < expand.length; i++){
					expand[i].addEventListener('click', onClick);
					document.querySelector('.review_close').addEventListener('click', offClick);
				}
			}
		</script>

		<!-- 메뉴바 -->
		<div class="nav-area" align="center">
			<div class="menu">
				<a href="#menu1">상품 정보</a>
			</div>
			<div class="menu">
				<a href="#menu2">상품 후기</a>
			</div>
			<div class="menu" id="menu3">
				<a href="#menu3">상품 문의</a>
			</div>
			<div class="menu">
				<a href="#menu4">취소/환불 규정</a>
			</div>
		</div>

		<!-- 문의 영역 -->
		<table class="question">
			<colgroup>
			  	<col style="width:18%"/>
			  	<col style="width:57%"/>
			  	<col style="width:15%"/>
			  	<col style="width:10%"/>
			</colgroup>
			<thead>
				<tr>
				</tr>			
			</thead>
			<tbody></tbody>
		</table>
		
		<table class="questionExcept">
			<colgroup>
			  	<col style="width:18%"/>
			  	<col style="width:57%"/>
			  	<col style="width:15%"/>
			  	<col style="width:10%"/>
			</colgroup>
			<thead>
				<tr>
				</tr>			
			</thead>
			<tbody></tbody>
		</table>
		
		<div id="all-question" onclick="toggleQuestion();">+문의 전체보기</div>

		<script>
			var pdId = "<c:out value='${ product.proNo}'/>";
			
			$.ajax({
				url: 'salesQnaProductList.pd',
				data: {pdId:pdId},
				success: function(data){
					console.log(data);
					
					$question = $('.question tbody');
					
					var $tr;
					var $tr2;
					var $tr3;
					var $memId;
					var $salqnaTitle;
					var $salqnaDate;
					var $salqnaContent;
					var $salqnaDetail;
					var $salqnaNo;
					var $salqnaReply;
					var $noqna;
					
					if(data.length > 0){
						for(var i in data){
							$tr = $('<tr class="trQuestion">');
							$tr2 = $('<tr class="trContent">');
							$tr3 = $('<tr class="salqnaReply">');
							$salqnaNo = $('<td id="salqnaNo">').text(data[i].salqnaNo);
							$memId = $('<td id="memId">').text(data[i].member.memNickname);
							$salqnaTitle = $('<td id="salqnaTitle">').text(data[i].salqnaTitle);
							$salqnaDate = $('<td id="salqnaDate">').text(data[i].salqnaDate);
							$salqnaDetail = $('<td id="salqnaDetail">').text("+내용보기");
							$salqnaContent = $('<td colspan="5" id="qnaContent">').text("Q.   " + data[i].salqnaContent);
							
							if(data[i].reply.repContent != null){
								$salqnaReply = $('<td colspan="5" colspan="5" id="qnaReply">').text("A.   " + data[i].reply.repContent);
							} else{
								$salqnaReply = $('<td colspan="5" colspan="5" id="qnaReply">').text("등록된 답변이 없습니다.");
							}
							
							$tr.append($salqnaNo);
							$tr.append($memId);
							$tr.append($salqnaTitle);
							$tr.append($salqnaDate);
							$tr.append($salqnaDetail);
							$tr.append($salqnaNo);
							$question.append($tr);
							$tr2.append($salqnaContent);
							$question.append($tr2);
							$tr3.append($salqnaReply);
							$question.append($tr3);
						}
					} else{
						$tr = $('<tr class="noqna">');
						$noqna = $('<td colspan="4" class="noqna">').text('등록된 질문이 없습니다.');
						
						$tr.append($noqna);
						$question.append($tr);
					}
				}
			});
			
			// 문의게시판 토글
	        $(function(){
	            var article = (".question .show"); 
	            var article2 = (".question .show2"); 
	            $(".question .trQuestion  td").on("click", function() { 
	                var myArticle =$(this).parents().next("tr"); 
	                var myArticle2 =$(this).parents().next().next("tr");
	                if($(myArticle).hasClass('trContent') && $(myArticle2).hasClass('salqnaReply')) { 
	                    $(article).removeClass('show').addClass('trContent'); 
	                    $(article2).removeClass('show2').addClass('salqnaReply'); 
	                    $(myArticle).removeClass('trContent').addClass('show'); 
	                    $(myArticle2).removeClass('salqnaReply').addClass('show2'); 
	                    $('.questionExcept .show td').removeClass('show').addClass('trContent');
	                    $('.questionExcept .show2 td').removeClass('show2').addClass('salqnaReply');
	                } 
	                else { 
	                    $(myArticle).addClass('trContent').removeClass('show');
	                    $(myArticle2).addClass('salqnaReply').removeClass('show2');
	                } 
	            }); 
	        });
			
			// 문의 리스트 불러오기 (최근 5개 제외한 나머지)
			$.ajax({
				url: 'salesQnaExceptProductList.pd',
				data: {pdId:pdId},
				success: function(data){
					console.log(data);
					
					$question = $('.questionExcept tbody');
					
					var $tr;
					var $tr2;
					var $tr3;
					var $memId;
					var $salqnaTitle;
					var $salqnaDate;
					var $salqnaContent;
					var $salqnaDetail;
					var $salqnaNo;
					var $salqnaReply;
					var $noqna;
					
					if(data.length > 0){
						for(var i in data){
							$tr = $('<tr class="trQuestion">');
							$tr2 = $('<tr class="trContent">');
							$tr3 = $('<tr class="salqnaReply">');
							$salqnaNo = $('<td id="salqnaNoExcept">').text(data[i].salqnaNo);
							$memId = $('<td id="memIdExcept">').text(data[i].member.memNickname);
							$salqnaTitle = $('<td id="salqnaTitleExcept">').text(data[i].salqnaTitle);
							$salqnaDate = $('<td id="salqnaDateExcept">').text(data[i].salqnaDate);
							$salqnaDetail = $('<td id="salqnaDetailExcept">').text("+내용보기");
							$salqnaContent = $('<td colspan="5" id="qnaContent">').text("Q.   " + data[i].salqnaContent);
							
							if(data[i].reply.repContent != null){
								$salqnaReply = $('<td colspan="5" colspan="5" id="qnaReply">').text("A.   " + data[i].reply.repContent);
							} else{
								$salqnaReply = $('<td colspan="5" colspan="5" id="qnaReply">').text("등록된 답변이 없습니다.");
							}
							
							$tr.append($salqnaNo);
							$tr.append($memId);
							$tr.append($salqnaTitle);
							$tr.append($salqnaDate);
							$tr.append($salqnaDetail);
							$tr.append($salqnaNo);
							$question.append($tr);
							$tr2.append($salqnaContent);
							$question.append($tr2);
							$tr3.append($salqnaReply);
							$question.append($tr3);
						}
					} else{
						$tr = $('<tr class="noqna">');
						$noqna = $('<td colspan="4" class="noqna">').text('등록된 질문이 없습니다.');
						
						$tr.append($noqna);
						$question.append($tr);
					}
				}
			});
			
	        $(function(){
	            var article = (".questionExcept .show"); 
	            var article2 = (".questionExcept .show2"); 
	            $(".questionExcept .trQuestion  td").on("click", function() { 
	                var myArticle =$(this).parents().next("tr"); 
	                var myArticle2 =$(this).parents().next().next("tr");
	                if($(myArticle).hasClass('trContent') && $(myArticle2).hasClass('salqnaReply')) { 
	                    $(article).removeClass('show').addClass('trContent'); 
	                    $(article2).removeClass('show2').addClass('salqnaReply');
	                    $(myArticle).removeClass('trContent').addClass('show');
	                    $(myArticle2).removeClass('salqnaReply').addClass('show2'); 
	                    $('.question .show td').removeClass('show').addClass('trContent');
	                    $('.question .show2 td').removeClass('show2').addClass('salqnaReply');
	                } 
	                else { 
	                    $(myArticle).addClass('trContent').removeClass('show');
	                    $(myArticle2).addClass('salqnaReply').removeClass('show2');
	                } 
	            }); 
	        });
	        
			// 문의 전체보기 토글버튼
	        function toggleQuestion(){
	        	var toggleBtn = document.getElementById("all-question").innerHTML;
	        	
	        	if(toggleBtn == '+문의 전체보기'){
 					$('.questionExcept').css("visibility", "visible");
 					$('#all-question').html("-접기");	        		
	        	} else{
 					$('.questionExcept').css("visibility", "collapse");
 					$('#all-question').html("+문의 전체보기");	 	        		
	        	}
	        }
		</script>
		
		<c:if test="${ !empty loginUser }">
			<c:url var="salesProductQnaInsertView" value="salesProductQnaInsertView.sq">
				<c:param name="pdId" value="${ product.proNo }"></c:param>
			</c:url>
			<input type="button" id="questionButton" style="padding: 5px; line-height:100%; text-align:center; font-family: 'GmarketSansMedium';" value="문의하기" onclick="location.href='${ salesProductQnaInsertView }'">
		</c:if>
		<c:if test="${ empty loginUser }">
			<input type="button" id="questionButton" style="padding: 5px; line-height:100%; text-align:center; font-family: 'GmarketSansMedium';" value="문의하기" onclick="alert('로그인 후 이용 가능합니다.')">
		</c:if>

		<!-- 메뉴바 -->
		<div class="nav-area" align="center">
			<div class="menu">
				<a href="#menu1">상품 정보</a>
			</div>
			<div class="menu">
				<a href="#menu2">상품 후기</a>
			</div>
			<div class="menu">
				<a href="#menu3">상품 문의</a>
			</div>
			<div class="menu" id="menu4">
				<a href="#menu4">취소/환불 규정</a>
			</div>
		</div>

		<!-- 취소 환불 규정 영역 -->
		<div class="refundArea" align="left">
			<div class="refund" align="left">${ product.proGuide }</div>
		</div>
		
		<!-- 불편사항 신고하기 -->
		<c:if test="${ !empty loginUser }">
			<c:url var="QnAInsertView" value="QnAInsertView.bo">
				<c:param name="starNo" value="${ writer.memNo }"></c:param>
				<c:param name="acId" value="${ activity.actNo }"></c:param>
			</c:url>		
		<div class="declare" align="right">
			<input type="button" id="declareButton" style="padding: 5px; line-height:100%; text-align:center; font-family: 'GmarketSansLight';" value="불편사항 신고하기" onclick="location.href='${ QnAInsertView }'">
		</div>
		</c:if>
		<c:if test="${ empty loginUser }">
		<div class="declare" align="right">
			<input type="button" id="declareButton" style="padding: 5px; line-height:100%; text-align:center; font-family: 'GmarketSansLight';" value="불편사항 신고하기" onclick="alert('로그인 후 이용 가능합니다.')">
		</div>
		</c:if>

		<!-- 별미 추천 영역 -->
		<div class="recommendArea" align="center">
			<div id="recommend">이런 상품은 어때요?</div>
		</div>
		<div class="rec-list" align="left">
			<!-- Swiper -->
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<ul class="list">
							<li class="list-item item1"><img class="list-thumb"
								src="resources/images/common/test.png" alt=""> <span>nickName</span>
								<div class="list-cate">[카테고리]제목제목너무길어무길어</div> <span
								class="list-price"><i class="fas fa-receipt"></i>50,000원</span>
								<span class="list-social">⭐️4.9 9999개의 평가</span></li>
						</ul>
					</div>
					<div class="swiper-slide">
						<ul class="list">
							<li class="list-item item1"><img class="list-thumb"
								src="resources/images/common/test.png" alt=""> <span>nickName</span>
								<div class="list-cate">[카테고리]제목제목너무길어무길어</div> <span
								class="list-price"><i class="fas fa-receipt"></i>50,000원</span>
								<span class="list-social">⭐️4.9 9999개의 평가</span></li>
						</ul>
					</div>
					<div class="swiper-slide">
						<ul class="list">
							<li class="list-item item1"><img class="list-thumb"
								src="resources/images/common/test.png" alt=""> <span>nickName</span>
								<div class="list-cate">[카테고리]제목제목너무길어무길어</div> <span
								class="list-price"><i class="fas fa-receipt"></i>50,000원</span>
								<span class="list-social">⭐️4.9 9999개의 평가</span></li>
						</ul>
					</div>
					<div class="swiper-slide">
						<ul class="list">
							<li class="list-item item1"><img class="list-thumb"
								src="resources/images/common/test.png" alt=""> <span>nickName</span>
								<div class="list-cate">[카테고리]제목제목너무길어무길어</div> <span
								class="list-price"><i class="fas fa-receipt"></i>50,000원</span>
								<span class="list-social">⭐️4.9 9999개의 평가</span></li>
						</ul>
					</div>
					<div class="swiper-slide">
						<ul class="list">
							<li class="list-item item1"><img class="list-thumb"
								src="resources/images/common/test.png" alt=""> <span>nickName</span>
								<div class="list-cate">[카테고리]제목제목너무길어무길어</div> <span
								class="list-price"><i class="fas fa-receipt"></i>50,000원</span>
								<span class="list-social">⭐️4.9 9999개의 평가</span></li>
						</ul>
					</div>
					<div class="swiper-slide">
						<ul class="list">
							<li class="list-item item1"><img class="list-thumb"
								src="resources/images/common/test.png" alt=""> <span>nickName</span>
								<div class="list-cate">[카테고리]제목제목너무길어무길어</div> <span
								class="list-price"><i class="fas fa-receipt"></i>50,000원</span>
								<span class="list-social">⭐️4.9 9999개의 평가</span></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	    var swiper = new Swiper('.swiper-container', {
	      slidesPerView: 5,
	      loop: true,
	      autoplay: {
	          delay: 1500,
	          disableOnInteraction: false,
	      }
	    });
	</script>

	<br>
	<br>
	<br>

	<c:import url="../common/footer.jsp" />

</body>
</html>