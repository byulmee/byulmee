<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    margin-top : 20px;
}

.product-info{
    float: left;
    width: 500px;
    box-sizing: border-box;
    margin-left: 50px;
    margin-top : 20px;
}
#title{
	margin-top: 15px;
	font-size: 25px;
}
.price{
	margin-top: 15px;
}
#price{
	font-size: 30px;
}
.star{
    margin-top: 10px;
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
.starInfo{
	padding-top: 15px;
	line-height: 30px;
	margin-top: 25px;
	width: 407px;
	height: 109px;
	border-top: 1px solid #E9E9E9; 
	border-bottom: 1px solid #E9E9E9; 
	text-align: center;
}
#starInfo1{
	font-size: 18px;
}
#starInfo2{
	color: #9B9B9B;
	font-size: 15px;
}
#starInfo3{
	color: #9B9B9B;
	font-size: 15px;
	border-left: 1px solid #E9E9E9; 
}
#star-button1{
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
}
#star-button2{
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
	      	 <img id="titleImg">
	       </div>
	       
	       <div class="product-info" align="left">
	       		<div id="title">[힐링] 나만의 텃밭 가꾸기</div>
	       		<div class="price">
	       			<span id="price">50,000</span>
	       			<span id="one">원</span>
	       		</div>
	       		<div class="star">
		       		<span id="star1">★★★★★</span>
		       		<span id="star2">4.8</span>
		       		<span id="star3">1,800개의 평가</span>
	       		</div>
	       		<div class="option">
		       		<span id="option1">신청 인원</span>
		       		<span id="option2">2명</span>
	       		</div>
	       		<div class="all-price">
	       			<span id="all-price1">총 활동비</span>
	       			<span id="all-price2"><b>100,000</b>&nbsp;원</span>
	       		</div>
	       		<div class="address-info">
	       			<span id="address-info1">활동 장소</span>
	       			<span id="address-info2">서울시 강남구 역삼동 남도빌딩 옥상 텃밭</span>
	       			<input type="button" id="address-button" value="지도보기">
	       		</div>
	       		<div class="period">
	       			<span id="period1">활동 기간</span>
	       			<span id="period2">20.12.21~21.01.20</span>
	       		</div>
	       		<div class="material">
	       			<span id="material1">준비물 링크</span>
	       			<span id="material2"><a href="xxx">http://www.byulmeemarket.com/1301240</a></span>
	       		</div>
	       		
	       		
	       		<div class="starInfo">
	       			<strong id="starInfo1">스프링</strong><br>
	       			<span id="starInfo2">010-1111-2222&nbsp;</span>
	       			<span id="starInfo3"> &nbsp;&nbsp;abcd123@naver.com</span><br>
	       			<input type="button" id="star-button1" value="+작업실 방문하기">
	       			<input type="button" id="star-button2" value="+스타 찜하기">
	       		</div>
	       </div>
       </div> 
       
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
	       <span>구매 동의 : 활동 신청 정보, 취소 및 환불 정책, 개인 정보 제공 동의 등을 최종 확인하고 구매에 동의합니다.(필수)</span>
	       <span><input type="checkbox" id="check"></span>
       </div>
       	<input type="button" id="orderButton" value="결제">
       	<input type="button" id="cancleButton" value="취소">
       

	</div>
	
	<br><br><br><br><br><br><br><br>

</body>
</html>