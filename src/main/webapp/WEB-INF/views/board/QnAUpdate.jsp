<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link
   href="https://fonts.googleapis.com/css?family=Source+Sans+Pro&display=swap"
   rel="stylesheet" />
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
   crossorigin="anonymous">
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
   integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
   crossorigin="anonymous"></script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
   integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
   crossorigin="anonymous"></script>

<style>
#mainFrame {
   margin-top: 50px;
   margin-bottom: 50px;
   margin-left: auto;
   margin-right: auto;
   overflow: hidden;
   position: relative;
   width: 1000px;
   font-family: "G마켓 산스 TTF Medium";
   
}

#buttonArea {
   text-align: center;
}

.select-script{position:relative; width:200px; height:40px; line-height:40px; border:1px solid #606976; border-radius:4px; text-transform:uppercase; background:#fff;}
.select-script label{position:absolute; width:100%; font-size:.86em; color:#606976; top:0; left:0; padding:0 5%;}
.select-script label:after{content:'▼'; width:42px; height:40px; position:absolute; top:0; right:0; font-size:.76em; color:#fff; text-align:center; background:#606976; border-radius: 3px;}
.select-script select{width:100%; height:40px; opacity:0; filter:alpha(opacity=0); -ms-filter:alpha(opacity=0)/* IE 8 */;}
</style>
<script>
$(document).ready(function(){
   //카테고리 초기 세팅
   var setCategory = $('#cusqnaCategory').val();
   if(setCategory == "0"){
      $("label[for='selectbox']").text("배송");
   } else if(setCategory == "1"){
      $("label[for='selectbox']").text("환불/반품");
   } else if(setCategory == "2"){
      $("label[for='selectbox']").text("주문/결제");
   } else if(setCategory == "3"){
      $("label[for='selectbox']").text("상품 정보");
   } else if(setCategory == "4"){
      $("label[for='selectbox']").text("마이페이지");
   } else if(setCategory == "5"){
      $("label[for='selectbox']").text("기타");
   } else {
      $("label[for='selectbox']").text("신고");
   }
   //카테고리 변경시 
    var select = $('.select-script select');
    select.change(function(){
         var select_name = $(this).children('option:selected').text();
        $(this).siblings("label").text(select_name);
        console.log(select_name);
        if(select_name == "배송"){
         $('#cusqnaCategory').val("0");
        } else if(select_name == "환불/반품") {
           $('#cusqnaCategory').val("1");
        } else if(select_name == "주문/결제") {
           $('#cusqnaCategory').val("2");
        } else if(select_name == "상품정보") {
           $('#cusqnaCategory').val("3");
        } else if(select_name == "마이페이지") {
           $('#cusqnaCategory').val("4");
        } else if(select_name == "기타") {
           $('#cusqnaCategory').val("5");
        } else {
           $('#cusqnaCategory').val("6");
        } 
    });
    
});
</script>
</head>
<body>
	<c:import url="../common/gnb.jsp"/>
	<div id="mainFrame" style="padding-left: 10%; padding-right: 10%;">
		<h2 align="center" style="padding-top: 15px; font-weight: bold">QnA 수정</h2>
		<hr>
		<form action="cusUpdate.bo" method="post">
			<div class="form-group row">
				<input type="hidden" name="cusqnaNo" value="${ customer.cusqnaNo }">
				<input type="hidden" name="page" value="${ page }">
				<input type="hidden" name="from" value="${ from }">
				<input type="hidden" name="cusqnaCategory" id="cusqnaCategory" value="${ customer.cusqnaCategory }">
				<label for="inputTitle" class="col-sm-2 col-form-label"><strong>제목</strong></label>
				<div class="col-sm-10">
					<input type="text" name="cusqnaTitle" class="form-control"
						id="inputTitle" value="${ customer.cusqnaTitle }">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputTitle" class="col-sm-2 col-form-label"><strong>분류</strong></label>
				<div class="col-sm-10">
					<div class="select-box select-script">
    					<label for="selectbox" id="selectlabel">선택해 주세요</label>
    						<select id="selectbox" title="선택 구분">
        						<option selected="selected">선택해 주세요</option>
        						<option>배송</option>
						        <option>환불/반품</option>
						        <option>주문/결제</option>
						        <option>상품정보</option>
						        <option>마이페이지</option>
						        <option>기타</option>
						        <option>신고</option>
						    </select>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label for="inputContent" class="col-sm-2 col-form-label"><strong>내용</strong></label>
				<div class="col-sm-10">
					<textarea type="text" name="cusqnaContent" class="form-control"
						id="inputContent" style="height: 400px">${ customer.cusqnaContent }</textarea>
				</div>
			</div>
			<div id="buttonArea">
				<button type="submit" id="insertBtn" class="btn btn mb-3" style="background-color: #FF6833; color: white">수정</button>
				<button type="button" id="cancelBtn" class="btn btn mb-3" style="background-color: #EFEFEF; color: #5A5A5A" onclick="location.href='cusQnADetail.bo?cusqnaNo=${ customer.cusqnaNo }&page=${ page }&from=${ from }'">취소</button>
			</div>
		</form>
	</div>

</body>
</html>