<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro&display=swap"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<style>
.outer {
	margin-top: 50px;
	margin-bottom: 50px;
	margin-left: auto;
	margin-right: auto;
	overflow: hidden;
	position: relative;
	width: 1000px;
	font-family: "G마켓 산스 TTF Medium";
}

.MainText {
	color: #585858;
	font-size: 20px;
	font-weight: bold;
}

.inputName {
	color: #585858;
	font-size: 16px;
}

.mainInput {
	border: 1px solid;
	height: 340px;
	border-color: #ECECEC;
	font-family: "G마켓 산스 TTF Medium";
}

.radiogroup {
	text-align: center;
	margin-top: 10px;
}

label {
	padding-left: 10px;
}

.checkbox[type=radio] {display:none;}

/* .radio {
	position: relative;
	display: inline;
	font-size: 0.9rem;
} */

label.input-label { 
  display: inline-block;
  vertical-align: middel;
  font-size: 0.9rem;
  cursor: pointer;
}

label.input-label::before {
	vertical-align: middle;
	display: inline-block;
	margin:0 5px;
	font-family: FontAwesome;
	font-size: 1.2rem;
	color: #E4E5ED;
	-webkit-transition: transform 0.2s ease-out, color 0.2s ease;
	-moz-transition: transform 0.2s ease-out, color 0.2s ease;
	-ms-transition: transform 0.2s ease-out, color 0.2s ease;
	-o-transition: transform 0.2s ease-out, color 0.2s ease;
	transition: transform 0.2s ease-out, color 0.2s ease;
	-webkit-transform: scale3d(0.8,0.8,1);
	-moz-transform: scale3d(0.8,0.8,1);
	-ms-transform: scale3d(0.8,0.8,1);
	-o-transform: scale3d(0.8,0.8,1);
	transform: scale3d(0.8,0.8,1);
}

label.input-label.radio::before {
	content: "\f1db";
}
input.checkbox + label.input-label:hover::before {
	-webkit-transform: scale3d(1,1,1);
	-moz-transform: scale3d(1,1,1);
	-ms-transform: scale3d(1,1,1);
	-o-transform: scale3d(1,1,1);
	transform: scale3d(1,1,1);
}

input.checkbox:checked + label.input-label::before {
  display: inline-block; 
  font-family: FontAwesome; 
  color:#FF6833;
  -webkit-transform: scale3d(1,1,1);
  -moz-transform: scale3d(1,1,1);
  -ms-transform: scale3d(1,1,1);
  -o-transform: scale3d(1,1,1);
  transform: scale3d(1,1,1);
}
input.checkbox:checked + label.input-label.radio::before {
    content:"\f192";
}


.thumbnailArea {
	width: 18%;

	float: left;
	text-align: left;
	margin-left: 10px;
}

.inputText {
	width: 80%;
	float: left;
	text-align: right;
	padding-left: 30px;
	font-size: 12px;
}

.inputText>input {
	margin-bottom: 5px;
	border: 1px solid;
	border-color: #ECECEC;
}

#thumbnail {
	border: 1px solid;
	width: 200px;
	height: 200px;
	border-color: #ECECEC;
}

#thumbnailbtn {
	background-color: #F3F4F8;
	color: #585858;
	width: 100px;
	height: 35px;
	margin-top: 5px;
	margin-left: 50px;
	outline: 0;
	border: 0;
	border-radius: 10px;
	font-size: 10px;
}

.inputValue {
	width: 650px;
}

.inputTime {
	width: 317px;
}
.InputName{
	margin-top: 20px;
}
.ImgArea {
	text-align:center;
}

.ImgArea > span {
	margin-right: 50px;
}

#contentImgArea1:hover, #contentImgArea2:hover, #contentImgArea3:hover, #contentImgArea4:hover {cursor:pointer;}
#contentImgArea1, #contentImgArea2, #contentImgArea3, #contentImgArea4 {
		width: 180px; height:190px; border:2px solid darkgray;
		text-align:center; display:table-cell; vertical-align:middle; display: inline-block;
}
#contentImg1, #contentImg2, #contentImg3, #contentImg4 {
	width: 175px; height: 180px;
}

#buttonArea {
	float: right;
}

#buttonArea > button {
	text-align: center;
	margin-top: 15px;
	margin-right: 10px;
	font-family: "G마켓 산스 TTF Medium";
	font-size: 13px;
	padding-top: 5px;
	width: 130px;
	height: 35px;
	outline: 0;
	border: 0;
	cursor: pointer;
	background: #FF6833;
	color: white;
	border-radius: 25px;
}

input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

</style>
</head>
<body>
	<c:import url="../common/gnb.jsp"/>
	<div class="outer">
	<form action="pinsert.wr" method="post" enctype="Multipart/form-data">
		<div class="MainLogoText">
			<p class="MainText">상품 등록</p>
			<input type="hidden" name="memId" value="${ loginUser.memId }">
		</div>
		<div class="InputName">
			<p class="inputName">필수 입력</p>
		</div>
		<div class="mainInput">
			<div class="radiogroup">
				<input type="radio" class="checkbox" name="productGroup" value="activity" id="Group1" checked="checked">
				<label for="Group1" class="input-label radio">액티비티</label>
				<input type="radio" class="checkbox" name="productGroup" value="living" id="Group2">
				<label for="Group2" class="input-label radio">리빙</label> 				
				<input type="radio" class="checkbox" name="productGroup" value="health" id="Group3">
				<label for="Group3" class="input-label radio">건강/미용</label>				
				<input type="radio" class="checkbox" name="productGroup" value="healing" id="Group4">
				<label for="Group4" class="input-label radio">힐링</label>	
				<input type="radio" class="checkbox" name="productGroup" value="food" id="Group5">
				<label for="Group5" class="input-label radio">푸드</label>
				<input type="radio" class="checkbox" name="productGroup" value="career" id="Group6">
				<label for="Group6" class="input-label radio">커리어</label>		
				<input type="hidden" name="proCategory" id="proCategory">
			</div>
			<script>
				$(document).ready(function(){
					var setCategory = $("input:radio[name=productGroup]:checked").val();
					if(setCategory == "activity"){
						$('#proCategory').val("0");
					} else if(setCategory == "living"){
						$('#proCategory').val("1");
					} else if(setCategory == "health"){
						$('#proCategory').val("2");
					} else if(setCategory == "healing"){
						$('#proCategory').val("3");
					} else if(setCategory == "food"){
						$('#proCategory').val("4");
					} else {
						$('#proCategory').val("5");
					}
					
					$('input:radio[name=productGroup]').on('change', function(){
						var category = $(this).attr('value');
						console.log(category);
						if(category == "activity"){
							$('#proCategory').val("0");
						} else if(category == "living"){
							$('#proCategory').val("1");
						} else if(category == "health"){
							$('#proCategory').val("2");
						} else if(category == "healing"){
							$('#proCategory').val("3");
						} else if(category == "food"){
							$('#proCategory').val("4");
						} else {
							$('#proCategory').val("5");
						}
					});
				});
			</script>
			<div class="inputGroup">
				<div class="thumbnailArea">
					<img id="thumbnail" name="thumbnail" src="${ pageContext.servletContext.contextPath }/resources/images/board/imgdefault.PNG">
					<button type="button" id="thumbnailbtn">썸네일 등록</button>
				</div>
				<div class="inputText">
					제목&nbsp;&nbsp;<input type="text" name="proTitle" class="inputValue" id="inputTitle"><br> 
					상품 가격&nbsp;&nbsp;<input type="number" name="proPrice" class="inputValue" id="inputTitle"><br> 
					배송비&nbsp;&nbsp;<input type="number" name="proCharge" class="inputValue" id="inputTitle"><br>
					상품 재고&nbsp;&nbsp;<input type="number" name="proStock" class="inputValue" id="inputTitle"><br>
					최대 구매 가능 수량&nbsp;&nbsp;<input type="number" name="proMaximum" class="inputValue" id="inputTitle"><br> 
					관련 활동 링크&nbsp;&nbsp;<input type="text" name="proUrl" class="inputValue" id="inputTitle" placeholder="http://">
				</div>
			</div>
		</div>
		<div class="InputName">
			<p class="inputName">상품 이미지 등록</p>
		</div>
			 
			 
			<div class="ImgArea">
				 <span id="contentImgArea1">
					<img id="contentImg1" name="contentImg1" src="${ pageContext.servletContext.contextPath }/resources/images/board/addImage.PNG"> 
				 </span>
				 <span id="contentImgArea2">
					<img id="contentImg2" name="contentImg2" src="${ pageContext.servletContext.contextPath }/resources/images/board/addImage.PNG"> 
				 </span>
				 <span id="contentImgArea3">
					<img id="contentImg3" name="contentImg3" src="${ pageContext.servletContext.contextPath }/resources/images/board/addImage.PNG"> 
				 </span>
				 <span id="contentImgArea4">
					<img id="contentImg4" name="contentImg4" src="${ pageContext.servletContext.contextPath }/resources/images/board/addImage.PNG"> 
				 </span>
				 <!-- 파일 업로드 하는 부분 -->
				<div id="fileArea">
					<input type="file" id="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this,1)">
					<input type="file" id="thumbnailImg2" multiple="multiple" name="thumbnailImg2" onchange="LoadImg(this,2)">
					<input type="file" id="thumbnailImg3" multiple="multiple" name="thumbnailImg3" onchange="LoadImg(this,3)">
					<input type="file" id="thumbnailImg4" multiple="multiple" name="thumbnailImg4" onchange="LoadImg(this,4)">
					<input type="file" id="thumbnailImg5" multiple="multiple" name="thumbnailImg5" onchange="LoadImg(this,5)">
				</div>
				
				<script>
						// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
						$(function(){
							$("#fileArea").hide();
							
							$("#contentImgArea1").click(function(){
								$("#thumbnailImg1").click();
							});
							$("#contentImgArea2").click(function(){
								$("#thumbnailImg2").click();
							});
							$("#contentImgArea3").click(function(){
								$("#thumbnailImg3").click();
							});
							$("#contentImgArea4").click(function(){
								$("#thumbnailImg4").click();
							});
							$("#thumbnailbtn").click(function(){
								$("#thumbnailImg5").click();
							});
						});
						
						// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
						function LoadImg(value, num){
							if(value.files && value.files[0]){
								var reader = new FileReader();
								
								reader.onload = function(e){								
									switch(num){
									case 1: 
										$("#contentImg1").attr("src", e.target.result);
										break;
									case 2:
										$("#contentImg2").attr("src", e.target.result);
										break;
									case 3: 
										$("#contentImg3").attr("src", e.target.result);
										break;
									case 4:
										$("#contentImg4").attr("src", e.target.result);
										break;
									case 5:
										$("#thumbnail").attr("src", e.target.result);
										break;
									}
								}
								
								reader.readAsDataURL(value.files[0]);
							}
						}
					</script>
		</div>
		<div class="InputName">
			<p class="inputName">본문 작성</p>
		</div>
		<div class="TextArea">
			<textarea type="text" name="proContent" class="form-control" id="inputContent" style="height: 300px"></textarea>
		</div>
		<div class="InputName">
			<p class="inputName">구매 유의 사항 및 환불 규정</p>
		</div>
		<div class="TextArea">
			<textarea type="text" name="proGuide" class="form-control" id="inputContent" style="height: 150px"></textarea>
		</div>
		<div id="buttonArea">
			<button type="submit" id="insertBtn" class="btn btn mb-3">등록</button>
		</div>
		</form>
	</div>
</body>
</html>