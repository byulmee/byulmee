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
	margin-left:auto; margin-right:auto;
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

.product-info{
    float: left;
    width: 500px;
    box-sizing: border-box;
    margin-top: 100px;
    margin-left: 50px;
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
    margin-top: 25px;
}
#option1{
	font-size: 15px;
	color: #9E9E9E;
}
#plus, #minus{
	border: 1px solid #E9E9E9;
	color: 9E9E9E;
	background-color: #F7F7F7;
	outline: 0;
	cursor: pointer; 
}
#option3{
	font-size: 12px;
	color: #9E9E9E;
}
.all-price{
    margin-top: 20px;
}
#all-price1{
	font-size: 15px;
	color: #9E9E9E;
}
#all-price2{
	font-size: 25px;
}
#all-price3{
	font-size: 15px;
}
.button{
    margin-top: 25px;  
}
#button1{
	border: 1px solid #E9E9E9; 
	background: white; 
	border-radius: 18px; 
	color: #9B9B9B; 
	width: 200px; 
	height: 76px; 
	text-align: center; 
	font-size: 18px;
	outline: 0;
	cursor: pointer;  
}
#button2{
	border: 1px solid #FF6833; 
	background: #FF6833; 
	border-radius: 18px; 
	color: white; 
	width: 200px; 
	height: 76px; 
	text-align: center; 
	font-size: 18px;
	margin-left: 7px;
	outline: 0;
	cursor: pointer; 
}
.starInfo{
	padding-top: 12px;
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

.nav-area{
	height: 50px; 
	width: 957px;
	margin-top: 55px;
	margin-bottom: 55px;
}
.menu{
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
.menu:hover{
	border-top: 3px solid #FF6833; 
	font-weight: bold;
	cursor: pointer; 
}
#menu1, #menu2, #menu3, #menu4{
	border-top: 3px solid #FF6833; 
	font-weight: bold;
}
.detailArea{
	height: 800px; 
	width: 957px;
	background-color: #E9E9E9; 
}

.reviewArea{
	width: 800px;
	min-height:auto;
}
.reviewWriter{
	width: 800px;
	min-height:auto;
	margin-bottom: 15px;
}
#reviewWriter{
	font-weight: bold;
	margin-left: 10px;
}
#revieDate{
	font-weight: bold;
	color: #9E9E9E;
	font-size: 15px;
	margin-left: 10px;
}
#reviewStar{
	color: #ffd400;
	font-size: 15px;
	margin-left: 10px;
}
.reviewImageArea{
	width: 800px;
	min-height:auto;
	margin-bottom: 15px;
	border-spacing: 5px;
}
.reviewImage{
	display: table-cell;
	width: 150px;
	height: 150px;
	background-color: #E9E9E9;
}
.reviewDetail{
	width: 800px;
	min-height:auto;
	margin-bottom: 15px;
	margin-left: 10px;
	font-size: 15px;
	color: #767676;
}
.expand{
	width: 800px;
	min-height:auto;
}
#expandButton{
	border: 0; 
	background-color: white;
	color: #9E9E9E;
}
.questionArea{
	width: 800px;
	line-height: 40px;
	border-bottom: 1px solid #E9E9E9;
	margin-bottom: 10px;
	margin-top: 10px;
}
#question1{
	font-weight: bold;
	margin-right: 20px;
}
#question2{
	font-size: 15px;
	font-weight: bold;
	margin-right: 400px;
}
#question3{
	font-size: 13px;
	font-weight: bold;
	margin-right: 20px;
	color: #9E9E9E;
}
#question4{
	font-size: 13px;
	margin-right: 20px;
	color: #9E9E9E;
}
.questionWrite{
	margin-top: 20px;
	width: 700px;
	height: 100px;
	border: 1px solid #E9E9E9;
}
#questionButton{
	margin-top: 15px;
	border: 1px solid #FF6833; 
	background: #FF6833; 
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
.refundArea{
	width: 957px;
	border-bottom: 1px solid #E9E9E9;
}
.refund{
	width: 800px;
	height: 200px;
}
.declare{
	width: 957px;
	height: 130px;
}
#declareButton{
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

#recommend{
	font-size: 22px;
	font-weight: bold;
}
 
</style>
</head>
<body>
	<c:import url="../common/gnb.jsp"/>
   <div class="outer" align="center">
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
		       		<span id="option1">인원선택&nbsp;</span>
		       		<span><button id="plus">+</button></span>
		       		<span id="option2"> &nbsp; 1 &nbsp; </span>
		       		<span><button id="minus">-</button></span>
		       		<span id="option3">잔여 인원 : 7명</span>
	       		</div>
	       		<div class="all-price">
	       			<span id="all-price1">총 활동비</span>
	       			<span id="all-price2"><b>100,000</b></span>
	       			<span id="all-price3">원</span>
	       		</div>
	       		<div class="button">
	       			<input type="button" id="button1" value="별미 찜하기">
	       			<input type="submit" id="button2" value="신청하기" onclick="location.href='activityCheck.ac'">
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
       
       <hr>
       <!-- 메뉴바 -->
       <div class="nav-area" align="center">
			<div class="menu" id="menu1"><a href="#menu1">별미 정보</a></div>
			<div class="menu"><a href="#menu2">별미 후기</a></div>
			<div class="menu"><a href="#menu3">별미 문의</a></div>
			<div class="menu"><a href="#menu4">취소/환불 규정</a></div>
		</div>
       
       <!-- 본문영역 -->
       <div class="detailArea">
       </div>
       
       <!-- 메뉴바 -->
       <div class="nav-area" align="center">
			<div class="menu"><a href="#menu1">별미 정보</a></div>
			<div class="menu" id="menu2"><a href="#menu2">별미 후기</a></div>
			<div class="menu"><a href="#menu3">별미 문의</a></div>
			<div class="menu"><a href="#menu4">취소/환불 규정</a></div>
		</div>
		
		
		<div class="reviewArea">
			<div class="reviewWriter" align="left">
				<span id="reviewWriter">스프링</span>
				<span id="revieDate">2020-11-28</span>
				<span id="reviewStar">★★★★★</span>
			</div>
			<div class="reviewImageArea" align="left">
				<div class="reviewImage"></div>
				<div class="reviewImage"></div>
				<div class="reviewImage"></div>
			</div>
			<div class="reviewDetail" align="left">
				<div>텃밭이 너무 작아서 별로였어요. 좀 더 컸으면 좋았을텐데.. 그리고 밥도 안주고 텃밭만 가꾸게 시켜요<br>
					 노잼노잼 아무도 이거 하지마세요 왜 별점이 4.8이나 되는지 모르겠네요; <br>
					 별미텃밭이 너무 작아서 별로였어요. 좀 더 컸으면 좋았을텐데.. </div>
			</div>
			<div class="expand" align="right">
				<input type="button" id="expandButton" value="+확대하기">
			</div>
		</div>
		
       <!-- 메뉴바 -->
       <div class="nav-area" align="center">
			<div class="menu"><a href="#menu1">별미 정보</a></div>
			<div class="menu"><a href="#menu2">별미 후기</a></div>
			<div class="menu" id="menu3"><a href="#menu3">별미 문의</a></div>
			<div class="menu"><a href="#menu4">취소/환불 규정</a></div>
		</div>
		
		<div class="questionArea" align="center">
			<span class="question" id="question1">스프링</span>
			<span class="question" id="question2">텃밭 문의합니다</span>
			<span class="question" id="question3">2020-11-28</span>
			<span class="question" id="question4">+내용보기</span>
		</div>
		<div class="questionArea" align="center">
			<span class="question" id="question1">스프링</span>
			<span class="question" id="question2">텃밭 문의합니다</span>
			<span class="question" id="question3">2020-11-28</span>
			<span class="question" id="question4">+내용보기</span>
		</div>
		<div class="questionArea" align="center">
			<span class="question" id="question1">스프링</span>
			<span class="question" id="question2">텃밭 문의합니다</span>
			<span class="question" id="question3">2020-11-28</span>
			<span class="question" id="question4">+내용보기</span>
		</div>
		<div class="questionArea" align="center">
			<span class="question" id="question1">스프링</span>
			<span class="question" id="question2">텃밭 문의합니다</span>
			<span class="question" id="question3">2020-11-28</span>
			<span class="question" id="question4">+내용보기</span>
		</div>
		
		<div class="questionWrite"></div>
		<input type="button" id="questionButton" value="문의하기">
		
		
       <!-- 메뉴바 -->
       <div class="nav-area" align="center">
			<div class="menu"><a href="#menu1">별미 정보</a></div>
			<div class="menu"><a href="#menu2">별미 후기</a></div>
			<div class="menu"><a href="#menu3">별미 문의</a></div>
			<div class="menu" id="menu4"><a href="#menu4">취소/환불 규정</a></div>
		</div>
		
		<div class="refundArea" align="left">
			<div class="refund" align="left">별미 공통 취소/환불 규정 기재</div>
		</div>
		
		<div class="declare" align="right">
 			<input type="button" id="declareButton" value="불편사항 신고하기">
		</div>
		
		<div class="recommendArea" align="center">
			<div id="recommend">이런 별미는 어때요?</div>
		</div>
		
	</div>
	
	<br><br><br><br><br><br><br><br>
	<c:import url="../common/footer.jsp"/>

</body>
</html>