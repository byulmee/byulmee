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
   .wrapTable {
   		width: 1050px;
   		text-align: center;
   		margin-left: auto;
   		margin-right: auto;
   }
   .wrapTd {
   		width: 1050px;
   		text-align: center;
   		margin-left: auto;
   		margin-right: auto;
   }
   .totalDiv {
   		margin-left: auto;
   		margin-right: auto;
   }
   #alldiv{
   		margin-left: auto;
   		margin-right: auto;
   }
</style>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>

<body onload="init();">
		<input type="hidden" value="${ a.actNo }" id="acId" name="acId">
		<input type="hidden" value="${ m.memNo }" id="memNo" name="memNo">
		<input type="hidden" value="${ o.ordCount }" id="ordCount" name="ordCount">
		<input type="hidden" value="${ a.actPrice * o.ordCount }" id="ordPay" name="ordPay">
		
		<table class="wrapTable">
			<tr>
				<td class="wrapTd">
					<div id="alldiv" style="width: 500px;">
						<div id=paymentmtd style="padding: 10px; width: 600px;">
							<h2 align="left" style="padding: 10px;">결제</h2>
			
							<span style="margin-right: 20px;">결제 수단 : </span> <input
								type="radio" name="pay_way" id="pay_way" value="card"
								checked="checked"> <span style="font-weight: bold;">카드
								결제 </span> <br>
						</div>
					</div>
					<br>

					<div class="totalDiv" style="border: 2px solid gray; width: 600px;">
						<span style="font-weight: bold; color: red; font-size: 25px;">최종
							결제 금액 : </span> <span style="float: right; margin-right: 150px;"
							id="resultPrice">${ a.actPrice * o.ordCount } 원</span> <br> <input
							type="checkbox" id="checkBoxYN4" /> <span
							style="font-weight: bold;"> 위 상품 정보 및 거래 조건을 확인하였으며, 구매 진행에
							동의합니다.(필수)</span>
					</div>
				</td>
			</tr>
		</table>
		<div style="margin-top: 70px;" align="center">
			<button type="button" class="btn btn-primary"
				style="font-size: 20px; margin-left: 25px;" id="payment">결제</button>
			<button type="button" onclick="history.back(-1);"
				class="btn btn-secondary" style="font-size: 20px;">취소</button>
		</div>
</body>
<script>
	function init() {
		IMP.init("imp26092291");
	}

	$(document).ready(function() {
		
		$('#payment').click(function() {
			var chk = document.getElementById('checkBoxYN4').checked;
			
			if(!chk){
	            alert('구매 진행 동의에 체크해 주세요.');
	            return false;
	        }
			var payway = $('#pay_way').prop(
					"selected", true);
			alert(payway);

			//IMP.request_pay(param, callback) 호출
			IMP.request_pay(
				{ // param
					pg : "kakaopay",
					pay_method : payway,
					merchant_uid : "${ a.actNo }" + new Date().getTime(),
					name : "${ a.actTitle }",
					amount : 250,
					buyer_email : "${ m.memEmail }",
					buyer_name : "${ m.memName }",
					buyer_tel : "${ m.memPhone }",
					buyer_addr : "${ m.memBasicAddr } ${ m.memDetailAddr }",
					buyer_postcode : "${ m.memPostcode }"
				},
			function(rsp) { // callback
				console.log("응답 :: "+ JSON.stringify(rsp))
				if (rsp.success) {
					var acId = $('#acId').val();
					var memNo = $('#memNo').val();
					var ordCount = $('#ordCount').val();
					var ordPay = $('#ordPay').val()
					location.href = "payment-success.pt?acId=" + acId + "&memNo=" + memNo + '&ordCount=' + ordCount + '&ordPay=' + ordPay;
				} else {
					if (rsp.error_msg) {
						alert(rsp.error_msg);
					} else {
						alert("결제가 취소 되었습니다.");
					}
					return;
				}
			});
		});
	});
</script>
</html>