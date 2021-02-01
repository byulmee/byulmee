<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>    
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
    margin-top: 20px;
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
    margin-top: 17px;
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
    margin-top: 18px;
}
#all-price1{
	font-size: 15px;
	color: #9E9E9E;
}
#all-price2{
	font-size: 15px;
	color: black;
}
.address-info{
	margin-top: 17px;
}
#address-info1{
	font-size: 15px;
	color: #9E9E9E;
}
#address-info2{
	font-size: 15px;
	color: black;
}
#address-button{
	border: none; 
	background: lightgray; 
	border-radius: 5px; 
	color: black; 
	width: 70px; 
	height: 25px; 
	text-align: center; 
	font-size: 13px;
	margin-left: 7px;
	outline: 0;
	cursor: pointer; 
	font-weight: bold;
}
.period{
	margin-top: 17px;
}
#period1{
	font-size: 15px;
	color: #9E9E9E;
}
#period2{
	font-size: 15px;
	color: black;
}
.material{
	margin-top: 17px;
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
	margin-top: 19px;
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
	width:957px;
	font-size:15px;
}
.product-check{
	width:957px;
	font-size:25px;
}

.cancle-table{
	margin-top: 10px;
	width: 957px;
	border: 1px solid #E9E9E9;
	border-collapse: collapse;
	
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
	border: 1px solid #FF6833; 
	background: #FF6833; 
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
	<c:import url="../common/gnb.jsp"/>
   <div class="outer" align="center">
          <div class="product-check" align="left">활동 신청 확인</div>
       <!-- 상단 섬네일, 상품 정보 -->
      <div class="top">
	       <div class="thumbnail" align="center">
	      	 <img src="${ thumb }" id="thumbImg">
	       </div>
	       
	       <div class="product-info" align="left">
				<div id="title">[${ category }] ${ activity.actTitle }</div>
				<div class="price">
					<span id="price">${ activity.actPrice }</span> <span id="one">원</span>
				</div>
	       		<div class="star">
		       		<span id="star1">★★★★★</span>
		       		<span id="star2">4.8</span>
		       		<span id="star3">1,800개의 평가</span>
	       		</div>
	       		<div class="option">
		       		<span id="option1">신청 인원</span>
		       		<span id="option2">${ amount }명</span>
	       		</div>
	       		<div class="all-price">
	       			<span id="all-price1">총 활동비</span>
	       			<span id="all-price2"><b>${ price }</b>원</span>
	       		</div>
	       		<div class="address-info">
	       			<span id="address-info1">활동 장소</span>
	       			<span id="address-info2">${ activity.actPlace }</span>
	       			<input type="button" id="address-button" value="지도보기">
	       		</div>
	       		<div class="period">
	       			<span id="period1">활동 기간</span>
	       			<span id="period2">${ activity.actStartday } ~ ${ activity.actEndday }</span>
	       		</div>
	       		<div class="material">
	       			<span id="material1">준비물 링크</span>
	       			<span id="material2"><a href="${ activity.actUrl }">${ activity.actUrl }</a></span>
	       		</div>
	       		
	       		
				<div class="starInfo">
					<span><img src="resources/images/common/star.png" width="18px" id="star_img" alt="별"></span>
					<span><strong id="starInfo1">${ writer.memNickname }</strong></span><br>
					<span id="starInfo2">${ writer.memPhone }&nbsp;&nbsp;</span>
					<span id="starInfo3"> &nbsp;&nbsp;${ writer.memEmail }</span><br>
					<input type="button" id="star-button1" style="padding: 5px; line-height:100%; text-align:center; font-family: 'GmarketSansMedium';" value="+작업실 방문하기"> 
					<input type="button" id="star-button2" style="padding: 5px; line-height:100%; text-align:center; font-family: 'GmarketSansMedium';" value="+스타 찜하기">
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
       </script>
       
       <hr><hr><hr><hr>
       
       <div class="cancle-info" align="left">&nbsp;취소 및 환불 정책</div>
       
       <table class="cancle-table">
	       <tr>
		       <th></th>
		       <th>클래스 이용 전</th>
		       <th>클래스 이용 후</th>
	       </tr>	
	       <tr>
	       		<td>클래스 신청 후, 7일 이내</td>
	       		<td>전액 환불</td>
	       		<td>기이용분 차감 후, 환불 진행<br>(기이용분 = 정상가 * (이용한 강의 수 / 전체 강의 수))</td>
	       </tr>
	       <tr>
	       		<td>클래스 신청 후, 7일 초과</td>
	       		<td>이용권 판매금액에서 10% 수수료 차감 후, 환불진행<br>(수강기간 종료 시, 환불 불가)</td>
	       		<td>환불 불가</td>
	       </tr>
       </table>
       
       <div class="personal-info-agreement" align="left">&nbsp;개인 정보 제공 동의</div>
       <div id="personal-info">
	        - 제공받는 자 : 자바봄<br>
			- 목적 : 스타와 구매자 사이의 원활한 거래 진행, 고객상담 및 불만처리 등<br>
			- 정보 : 별명, 이름, 전화<br>
			- 보유기간 : 수강 기간 만료 후, 15일<br><br>
			※ 자바봄은 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 자바봄은 상품 거래정보 및 거래에 대하여 책임을 지지 않습니다.
       </div>
       <div class="personal-info-check">
           <input type="hidden" value="${ activity.actNo }" class="acId">
           <input type="hidden" value="${ writer.memNo }" class="memNo">
	       <span>구매 동의 : 활동 신청 정보, 취소 및 환불 정책, 개인 정보 제공 동의 등을 최종 확인하고 구매에 동의합니다.(필수)</span>
	       <span><input type="checkbox" id="check"></span>
       </div>
       	<input type="button" value="결제" id="orderButton">
       	<input type="button" id="cancleButton" value="취소">
	</div>
	
	<script>
	
	// 결제 페이지 이동
	/* $(document).ready(function(){
		var acId = $(this).val();
		console.log(acId);
		$('#orderButton').click(function(){
			location.href = "payment.py";
		});
	}); */
	$('#orderButton').click(function(){
		var acId = $(this).parent().children('.personal-info-check').children('.acId').val();
		var memNo = $(this).parent().children('.personal-info-check').children('.memNo').val();
		location.href = "payment.py?acId=" + acId + "&memNo=" + memNo;
	});
	</script>
	<c:import url="../common/footer.jsp"/>

</body>
</html>