<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	
<meta charset="UTF-8">
<title>결제완료 페이지</title>
<link rel="stylesheet" href="css/common/cssReset.css">
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


body{
	width: 1050px;
	margin: 0 auto;
	font-family: 'GmarketSansMedium';
}
ul li{
		float: right;
		list-style: none;	
}
   .div{
      text-align: center;
      width: 70%; 
      border: 1px solid lightgray;
      margin: 0 auto;
   }
   
   .div2{
      text-align: center;
      width: 70%; 
      border: 1px solid lightgray;
      margin: 0 auto;
   }
   #info{
   	font-family: 'Gmarket Sans TTF';
   }
</style>

<script>
/* span4 */

$( document ).ready(function() {
	var cardIdKindCK = '<%=request.getParameter("cardIdKind")%>'
	var carIdkindckleng = cardIdKindCK.length;
	var paymethod = '<%=request.getParameter("pay_method")%>'
	
	
	console.log("cardIdKindCK?" , cardIdKindCK.length);
	
	if(carIdkindckleng != 4){
		$("#span4").html("고객님의 입금계좌는 ");
		$("#span5").html(cardIdKindCK);
	}

	if(paymethod == "card"){
		$("#paymethod").html("카드");
	}
	else if(paymethod == "virtual"){
		$("#paymethod").html("무통장 입금");
	}
	else {
		$("#paymethod").html("휴대폰 결제");
	}

	

});


		</script>
</head>
<body>

	<nav>
	<ul>
		<li style="color: orange;">주문/결제 ><strong> 주문완료 </strong></li>
		<li> 주문/결제 > </li>
		

	</ul>
</nav><br>
<hr>
 	
 <span style="text-align: left; font-size: 30px;"><strong>주문 완료</strong></span><br><br>
 			
 <table class="table table-hover">
	<tr>
		<th style = "background-color: orange; color:purple;text-align:center;" width="80px;">혜택정보</th>
		<th style = "background-color:#eeeeee; text-align:center;" width="250px;">${ m.memName }님</th>
	</tr>
</table>
      
   	<div id="info" align="center" style=" border-style: inset" display: block;" >
   		<h2 style=" color: purple;"> Byulmee를 이용해 주셔서 감사합니다</h2>
   		<img src="${ pageContext.servletContext.contextPath }/resources/images/board/Payment_sucess.PNG"><br>
   	<div style="background-color: skyblue; color: purple; display: inline-block;">
   		<span style="font-size: 20px; align="center"><strong>${ m.memName } 고객님, 활동 예약 완료되었습니다.</strong></span><br><br>    			
		</div>	
			<p> 활동 내역 확인은 마이페이지의 조회에서 하실 수 있습니다</p>
			
    </div> 

        <div class="div2">
   <h4 align="left">주문 정보</h4>
   

   
      <span style="font-weight: bold;">사용자 이름 : </span><span>${m.memName}</span><br>
      <span style="font-weight: bold;">연락처 : </span><span>${m.memPhone} </span><br>
        <span style="font-weight: bold;">예약 일자 : </span><span>${ o.ordDate }</span><br> 
      <span style="font-weight: bold;">인원 : </span><span>${ o.ordCount }</span><br> 
      <span style="font-weight: bold;">결제 방식 : </span><span id="paymethod">
		      <c:choose>
		      	<c:when test="${ o.ordPayWay eq 0 }">카드</c:when>
		      	<c:when test="${ o.ordPayWay eq 1 }">페이</c:when>
		      </c:choose>
	</span><br>  
	  <span style="font-weight: bold;">총 결제 금액 : </span><span id="price">${ o.ordPay }</span><br> 
      <div></div>
      
     	 <p>
           <button><a href="location.href='home.do'" class="btn btn-info btn-lg"></button>
                <span class="glyphicon glyphicon-home"></span> 
           </a>
         </p>  
      </div>
    </div>
    <script>
    // 가격에 천단위 ,(콤마)추가
	    $(document).ready(function(){
			var price = $('#price').text();
	        price = price.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	        $('#price').html(price);
	    });
	</script>
</body>
</html>
