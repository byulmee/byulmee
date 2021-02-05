<%@page import="com.kh.byulmee.activity.model.vo.Activity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제</title>
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

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>

<body onload="init();">   
     <div>
     	<input type="hidden" value="${ a.actNo }" id="acId" name="acId">
         <input type="hidden" value="${ m.memNo }" id="memNo" name="memNo">
         <input type="hidden" value="${ o.ordCount }" id="ordCount" name="ordCount">
           <input type="hidden" value="${ o.ordPay }" id="ordPay" name="ordPay">
         <h2 align="left" style="padding: 10px;">결제</h2>
         <div id="alldiv" style="width: 500px;">
         <div id=paymentmtd style="padding: 10px; width: 600px;">
    
         <span style="margin-right: 20px;">결제 수단 : </span>
         <input type="radio" name="pay_way" id="pay_way" value="card" checked="checked"> <span style="font-weight: bold;">카드 결제 </span>
         <input type="radio" name="pay_way" id="pay_way" value="trans"> <span style="font-weight: bold;">가상계좌(무통장입금) </span> 
         <input type="radio" name="pay_way" id="pay_way" value="phone"> <span style="font-weight: bold;">휴대폰 결제 </span> 
         <br>
        </div> 
            </div>             
             <br>
           <div style="margin-top: 5px;">   
          <span style="font-weight: bold;">주문자 동의: </span> <input type="checkbox" id="checkBoxYN1" /> <span style="font-weight: bold;">개인정보 제3자 제공 동의(필수)</span>
            	</div>           
             </div>         
         </div>
         
          <div id="virtualForm" style="width: 500px;">
            
            <div>
               <div style="width: 700px;">    

         <select name="cardKind" id="cardIdKind" class="form-control" style="width: 400px; display: inline;">
          <option value="default">입금 은행 선택</option>
             <option value="SH">신한카드  예금주:별난취미 계좌번호: 100-20-30-4000-50</option>
             <option value="BC">하나 BC  예금주:별난취미 계좌번호: 100-20-30-4000-50</option>
             <option value="HD">현대카드  예금주:별난취미 계좌번호: 100-20-30-4000-50</option>
             <option value="SS">삼성카드  예금주:별난취미 계좌번호: 100-20-30-4000-50</option>
             <option value="MG">MG새마을  예금주:별난취미 계좌번호: 100-20-30-4000-50</option>
            <option value="KB">KB국민  예금주:별난취미 계좌번호: 100-20-30-4000-50</option>
            <option value="LT">롯데카드  예금주:별난취미 계좌번호: 100-20-30-4000-50</option>
             <option value="NH">농협카드  예금주:별난취미 계좌번호: 100-20-30-4000-50</option>
             </select>
         
             <input style="background: #d3d3d3; width: 100px; height: 34px; margin-left: 10px;" type="text" value ="${a.actNo }" readonly="readonly">
		</div>            
            <div style="margin-top:10px;";>
               <span style="font-weight: bold;">가상 계좌 안내 :</span><span id="Account" style="color: red;"></span> 
              </div>
            <br/>
            <span style="color: #d3d3d3;">가상계좌는 주문 시 고객님께 발급되는 일회성 계좌번호 이므로 입금자명이 다르더라도 입금 확인이 가능합니다. </span>
            </div>
            
          <div style="padding: 10px;">    
          <span style="font-weight: bold;">주문자 동의: </span> <input type="checkbox" id="checkBoxYN2" /> <span style="font-weight: bold;">개인정보 제3자 제공 동의(필수)</span>            
            </div>
         </div>       
          <div id="phoneForm" style="width: 500px;">
           <div>             
         <br>       
             <br>
         <span style="font-weight: bold;"> 휴대폰 결제(수수료) 안내</span>
             <div style="margin-top: 10px;">
         <span style="color: #d3d3d3;">휴대폰 결제는 통신사와 결제 대행사의 정책 / 높은 수수료 / 늦은 정산 주기로 인해 50만원 이하 상품만 가능하며 결제하실 금액의 5%가 결제 수수료가 추가됩니다.</span>
            <br>
         <span style="color: #d3d3d3;">예) 판매 금액 50,000원 상품을 휴대폰 결제 할 경우 52,500원이 결제 됩니다 환불 시에는 수수료를 포함한 결제 금액이 환불됩니다.</span>         
         </div>         
          </div>
          <div style="padding: 10px;">    
          <span style="font-weight: bold;">주문자 동의: </span> <input type="checkbox" id="checkBoxYN3" /> <span style="font-weight: bold;">개인정보 제3자 제공 동의(필수)</span>            
            </div>
         </div>
      </div>  
        </div>
      </div>
          <div style="border: 2px solid gray; width: 500px;">
             
            
             <div style="margin-top: 20px;">
            <div style="margin-left: 15px;">
            
             <span style=" font-weight: bold; color: red; font-size: 25px;">최종 결제 금액 : </span>  <span style="float: right; margin-right: 50px;" id="resultPrice">${ a.actPrice } 원</span>
            </div>
            <br>
			<div style="margin-top: 50px;margin-left: 95px;width: 350px;">
      		<input type="checkbox" id="checkBoxYN4" /> <span style="font-weight: bold;"> 위 상품 정보 및 거래 조건을 확인하였으며, 구매 진행에 동의합니다.(필수)</span>
    	 </div>
     
             </div>
             
             </div>
             <div style="margin-top: 70px;" align="center">
              <button type="button" class="btn btn-primary"style=" font-size: 20px; margin-left: 25px;" id="payment">결제</button>
             <button type="button" onclick="history.back(-1);" class="btn btn-secondary"  style="font-size:20px;">취소</button>            
             </div>
             
</body>
<script>
function init(){
	IMP.init("imp26092291");
}

$(document).ready(function(){
	$('#payment').click(function(){
		var payway = $('#pay_way').prop("selected",true);
		alert(payway);
		
		//IMP.request_pay(param, callback) 호출
		IMP.request_pay({ // param
		  pg: "kakaopay",
		  pay_method: payway,
		  merchant_uid: "${ a.actNo }",
		  name: "${ a.actTitle }",
		  amount: 250,
		  buyer_email: "${ m.memEmail }",
		  buyer_name: "${ m.memName }",
		  buyer_tel: "${ m.memPhone }",
		  buyer_addr: "${ m.memBasicAddr } ${ m.memDetailAddr }",
		  buyer_postcode: "${ m.memPostcode }"
		}, function (rsp) { // callback
		  console.log("응답 :: " + JSON.stringify(rsp))
		  if (rsp.success) {
			  var acId = $('#acId').val();
				var memNo = $('#memNo').val();
				var ordCount = $('#ordCount').val();
				var ordPay = $('#ordPay').val()
				location.href = "payment-success.pt?acId=" + acId + "&memNo=" + memNo + '&ordCount=' + ordCount + '&ordPay=' + ordPay;
		  } else {
			  if(rsp.error_msg){
				alert(rsp.error_msg);
			  }else {
			  	alert("결제가 취소 되었습니다.");
			  }

			  return ;
		  }
		});
	});
});


</script>
</html>