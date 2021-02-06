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
   

   #info{
      font-family: 'Gmarket Sans TTF';
   }
   
   .PayName {
      text-align: center;
      width: 500px;
      margin-left: auto;
      margin-right: auto;
   }
   .infoTable {
         width: 500px;
         
   }
   .tdName, .tdContent {
      text-align: left;
   }
   .tdName {
         width: 110px;
   }
   .tdContent {
         width: 250px;
   		font-family: 'Gmarket Sans TTF';
   }
   
   .PayName {
   	text-align: center;
   	width: 500px;
   	margin-left: auto;
   	margin-right: auto;
   }
   .infoTable {
   		width: 500px;
   		
   }
   .tdName, .tdContent {
   	text-align: left;
   }
   .tdName {
   		width: 110px;
   }
   .tdContent {
   		width: 250px;
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
	<c:import url="../common/gnb.jsp"/>
   <nav>
   <ul>
      <li style="color: orange;">주문/결제 ><strong> 주문완료 </strong></li>
      <li> 주문/결제 > </li>
      

   </ul>
</nav><br>
<hr>

 <span style="text-align: left; font-size: 30px;"><strong>주문 완료</strong></span><br><br>			
 
      
   	<div id="info" align="center" style="display: block;">
   		<h2 style=" color: purple;"> Byulmee를 이용해 주셔서 감사합니다</h2>
   		<img src="${ pageContext.servletContext.contextPath }/resources/images/board/Payment_sucess.PNG"><br>
   	<div style=" color: purple; display: inline-block;">
   		<span style="font-size: 20px; align="center"><strong>${ m.memName }고객님, 주문이 완료되었습니다.</strong></span><br><br>    			
		</div>	
			<!-- <p> 주문내역 확인은 배송 / 마이페이지의</p>
			<p>* 주문 / 배송조회에서 하실 수 있습니다. *</p> -->
    
    <div class="PayName">  
   <h4 >주문 정보</h4>    
  	<table class="infoTable">
  		<tr>
  			<td class="tdName">
  				사용자 이름
  			</td>
  			<td class="tdContent">
  				${m.memName}
  			</td>
  		</tr>
  		<tr>
  			<td class="tdName">
  				연락처
  			</td>
  			<td class="tdContent">
  				${m.memPhone}
  			</td>
  		</tr>
  		<tr>
  			<td class="tdName">
  				인원
  			</td>
  			<td class="tdContent">
  				${ o.ordCount }
  			</td>
  		</tr>
  		<tr>
  			<td class="tdName">
  				결제 방식
  			</td>
  			<td class="tdContent">
  				<c:choose>
		      	<c:when test="${ o.ordPayWay eq 0 }">카드</c:when>
		      	<c:when test="${ o.ordPayWay eq 1 }">페이</c:when>
		      </c:choose>
  			</td>
  		</tr>
  		<tr>
  			<td class="tdName">
  				활동명
  			</td>
  			<td class="tdContent">
  				${ a.actTitle }
  			</td>
  		</tr>
  		<tr>
  			<td class="tdName">
  				주문일자
  			</td>
  			<td class="tdContent">
  				${ o.ordDate }
  			</td>
  		</tr>
  		<tr>
  			<td class="tdName">
  				총 결제금액
  			</td>
  			<td class="tdContent">
  				${ o.ordPay }
  			</td>
  		</tr>
  	</table>

      </div>
     	 <p>

           <a href="#" class="btn btn-info btn-lg">
                <span class="glyphicon glyphicon-home"></span> 
           </a>
         </p>  
      </div>
    </div>

    <div class="btn" align="center"><button onclick="location.href='home.do'">완료</button></div>
</body>
</html>