<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js"></script>
<style>
@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'GmarketSansBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'GmarketSansLight';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

body {
	font-family: 'GmarketSansMedium'; 
}
.outer {
	width: 1280px; min-height:auto;  border: 5px solid white;
	margin-left:auto; margin-right:auto; margin-top:50px; margin-bottom:50px;
}
/* .product-check{ */
/* 	width: 1280px; min-height:auto;  border: 5px solid white; */
/* 	margin-left:auto; margin-right:auto; margin-top:50px; */
/* 	float: left; */
/*     margin-top: 50px; */
/* } */

.thumbnail {
	float: left;
	width: 500px;
	height: 500px;
	box-sizing: border-box;
	background-color: gray;
	margin-left: 162px;
	margin-top: 12px;
}

#thumbImg {
	width: 500px;
	height: 500px;
	object-fit: fill;
}

.product-info{
    float: left;
    width: 500px;
    box-sizing: border-box;
    margin-left: 50px;
    margin-top : 20px;
}
#title{
	margin-top: 7px;
	font-size: 25px;
}
.price{
	margin-top: 15px;
}
#price{
	font-size: 30px;
}
.star{
    margin-top: 30px;
}
#star1{
	font-size: 15px;
	color: #ffd400;
}
#star2{
	font-size: 15px;
	color: #9E9E9E;
}
#star3{
	font-size: 15px;
	color: #9E9E9E;
}
.option{
    margin-top: 30px;
}
#option1{
	font-size: 15px;
	color: #9E9E9E;
}
#option2{
	font-size: 15px;
	color: black;
}
.all-price{
    margin-top: 30px;
}
#all-price1{
	font-size: 15px;
	color: #9E9E9E;
}
#all-price2{
	font-size: 15px;
	color: black;
}
.material{
	margin-top: 30px;
}
#material1{
	font-size: 15px;
	color: #9E9E9E;
}
#material2{
	font-size: 13px;
}
.starInfo {
	padding-top: 12px;
	line-height: 30px;
	margin-top: 55px;
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
	font-size: 18px;
}

#starInfo2 {
	color: #9B9B9B;
	font-size: 15px;
}

#starInfo3 {
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
	text-align: center;
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
	text-align: center;
	font-size: 12px;
	outline: 0;
	cursor: pointer;
	vertical-align: middle;
	margin-top: 4px;
}

hr {width: 1280px; visibility: hidden;} 

.cancle-info{
	margin-top: 40px;
	width:957px;
	font-size:15px;
}
.address-info{
	margin-top: 40px;
	width:957px;
	font-size:15px;
}
.address{
	margin-top: 30px;
	margin-bottom: 10px;
	text-align: center;
	width:90px;
	font-size:20px;
	border-bottom: 3px solid #FF6833;
	font-family: 'GmarketSansBold';
}
.product-check{
	width:957px;
	font-size:25px;
}
th, tr, td{
	border: 1px solid #E9E9E9;
	text-align: center;
	font-size: 13px;
	padding: 10px;
}
td{
	color: #8A8A8A;
}
.personal-info-agreement{
	width: 957px;
	font-size: 15px;
	margin-top: 40px;
}
#personal-info{
	padding: 15px;
	margin-top: 10px;
	width: 928px;
	border: 1px solid #E9E9E9;
	text-align: left;
	font-size: 13px;
	color: #8A8A8A;
}
#cancle-info2{
	padding: 15px;
	margin-top: 10px;
	width: 928px;
	border: 1px solid #E9E9E9;
	text-align: left;
	font-size: 13px;
	color: #8A8A8A;
}
.personal-info-check{
	margin-top: 10px;
	font-size: 13px;
	color: #6D6D6D;
}
#check{
	position: relative;
	top: 3px;
	width: 15px;
	height: 15px;
	border: 2px solid #bcbcbc;
	cursor: pointer;
}
#orderButton{
	margin-top: 15px;
	border: 1px solid black; 
	background: black; 
	border-radius: 5px; 
	color: white; 
	width: 60px; 
	height: 35px; 
	text-align: center; 
	font-size: 13px;
	margin-left: 7px;
	outline: 0;
	cursor: pointer; 
	font-weight: bold;
}
#cancleButton{
	margin-top: 15px;
	border: 1px solid #EFEFEF; 
	background: #EFEFEF; 
	border-radius: 5px; 
	color: #5A5A5A; 
	width: 60px; 
	height: 35px; 
	text-align: center; 
	font-size: 13px;
	margin-left: 7px;
	outline: 0;
	cursor: pointer; 
	font-weight: bold;
}

</style>
</head>
<body>
	<c:import url="../common/gnbTypeB.jsp" />
   <div class="outer" align="center">
          <div class="product-check" align="left">상품 구매 확인</div>
       <!-- 상단 섬네일, 상품 정보 -->
      <div class="top">
	       <div class="thumbnail" align="center">
	      	 <img src="${ thumb }" id="thumbImg">
	       </div>
	       
	       <div class="product-info" align="left">
				<div id="title">[${ category }] ${ product.proTitle }</div>
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
		       		<span id="option1">구매 수량</span>
		       		<span id="option2">${ amount }개</span>
	       		</div>
	       		<div class="all-price">
	       			<span id="all-price1">합계 금액</span>
	       			<span id="all-price2"><b>${ price }</b></span>
	       		</div>
	       		<div class="material">
	       			<span id="material1">활동 링크</span>
	       			<span id="material2"><a href="${ product.proUrl }">${ product.proUrl }</a></span>
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
       

       <script>
		// 가격에 천단위 ,(콤마)추가
	    $(document).ready(function(){
			var price = $('#price').text();
	        price = price.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	        $('#price').html(price);
	    });
		
		// 스타 휴대폰에 -(하이픈)추가
		$(document).ready(function(){
			var starPhone = $('#starInfo2').text();
			starPhone = starPhone.replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-");
			$('#starInfo2').html(starPhone);
		});
		
		// 평균 별점 소수점 절삭
		var rating = "<c:out value='${ ratingAvg }'/>";
	    $(document).ready(function(){
			var rating = $('#star2').text();
			var ratingAvg = parseFloat(rating).toFixed(1);
	        $('#star2').text(ratingAvg);
	    });
       </script>
       
       
       <hr><hr><hr><hr>
	       
       <div class="address-info" align="left">&nbsp;배송지 정보</div>
       
       
       
       
       <div class="cancle-info" align="left">&nbsp;교환 및 환불 정책</div>
       <div id="cancle-info2">
	       <b>교환/환불 유의 사항</b><br>
			- 단순변심에 의한 교환은 스타에게 문의 주세요.<br>
			- 사전 접수되지 않은 교환/환불건은 처리되지 않을 수 있습니다.<br>
			- 상품훼손, 상품세탁, 사용흔적이 있을경우 교환/환불은 불가합니다.<br>
			- 교환/환불 기간은 상품 수령일로부터 7일 이내 입니다.<br><br>
			<b>배송비 부담</b><br>
			- 고객님 부담 : 단순변심, 착오 등 고객님에게 사유가 있는 경우<br>
			- 스타 부담 : 작품 하자 등 스타에게 사유가 있는 경우
       </div>
       
       <div class="personal-info-agreement" align="left">&nbsp;개인 정보 제공 동의</div>
       <div id="personal-info">
	        - 제공받는 자 : 자바봄<br>
			- 목적 : 스타와 구매자 사이의 원활한 거래 진행, 고객상담 및 불만처리 등<br>
			- 정보 : 별명, 이름, 전화<br>
			- 보유기간 : 수강 기간 만료 후, 15일<br><br>
			※ 자바봄은 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 자바봄은 상품 거래정보 및 거래에 대하여 책임을 지지 않습니다.
       </div>
       <div class="personal-info-check">
	       <span>구매 동의 : 활동 신청 정보, 취소 및 환불 정책, 개인 정보 제공 동의 등을 최종 확인하고 구매에 동의합니다.(필수)</span>
	       <span><input type="checkbox" id="check"></span>
       </div>
       	<input type="button" id="orderButton" value="결제">
       	<input type="button" id="cancleButton" value="취소">
	</div>
	
	<c:import url="../common/footer.jsp"/>

</body>
</html>