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

.radio {
	position: relative;
	display: inline;
	font-size: 0.9rem;
}

.radio input[type='radio'] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0
}

.radio input[type='radio']+label {
	display: inline-block;
	position: relative;
	cursor: pointer;
	padding-left: 1.4rem;
	margin-right: 0.8rem;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
}
/*  color: rgb(59, 59, 59);
    color: #747474; */
.radio input[type='radio']+label:before {
	content: '';
	position: absolute;
	left: 0;
	top: -3px;
	width: 1rem;
	height: 1rem;
	text-align: center;
	background: #747474;
	border-radius: 100%;
	background-color: #FF6833;
}

.radio input[type='radio']:checked+label:after {
	content: '';
	position: absolute;
	top: 0px;
	left: 3px;
	padding: 0;
	width: 10px;
	height: 10px;
	background: #ffffff;
	border-radius: 100%;
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
	font-size: 13px;
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
img {
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


</style>
</head>
<body>
	<c:import url="../common/gnb.jsp"/>
	<div class="outer">
	<form action="ainsert.wr" method="post" enctype="Multipart/form-data">
		<div class="MainLogoText">
			<p class="MainText">활동 등록</p>
			<input type="hidden" name="memId" value="${ loginUser.memId }">
		</div>
		<div class="InputName">
			<p class="inputName">필수 입력</p>
		</div>
		<div class="mainInput">
			<div class="radiogroup">
				<div class="radio">
					<input type="radio" name="activityGroup" value="activity" id="Group1">
					<label for="Group1">액티비티</label>
				</div>
				<div class="radio">
					<input type="radio" name="activityGroup" value="living" id="Group2">
					<label for="Group2">리빙</label> 
				</div>
				<div class="radio">
					<input type="radio" name="activityGroup" value="health" id="Group3">
					<label for="Group3">건강/미용</label>
				</div>
				<div class="radio">
					<input type="radio" name="activityGroup" value="healing" id="Group4">
					<label for="Group4">힐링</label>
				</div>
				<div class="radio">
					<input type="radio" name="activityGroup" value="food" id="Group5">
					<label for="Group5">푸드</label>
				</div>
				<div class="radio">
					<input type="radio" name="activityGroup" value="career" id="Group6">
					<label for="Group6">커리어</label>
				</div>
				<input type="hidden" name="actCategory" id="actCategory">
			</div>
			<script>
				$(document).ready(function(){
					$('input:radio[name=activityGroup]').on('change', function(){
						var category = $(this).attr('value');
						console.log(category);
						if(category == "activity"){
							$('#actCategory').val("0");
						} else if(category == "living"){
							$('#actCategory').val("1");
						} else if(category == "health"){
							$('#actCategory').val("2");
						} else if(category == "healing"){
							$('#actCategory').val("3");
						} else if(category == "food"){
							$('#actCategory').val("4");
						} else {
							$('#actCategory').val("5");
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
					제목&nbsp;&nbsp;<input type="text" name="actTitle" class="inputValue" id="inputTitle"><br> 
					연락처&nbsp;&nbsp;<input type="text" name="actPhone" class="inputValue" id="inputTitle"><br>
					활동비&nbsp;&nbsp;<input type="text" name="actPrice" class="inputValue"	id="inputTitle"><br> 
					활동기간&nbsp;&nbsp;<input	type="text" name="actStartday" class="inputTime" id="inputTitle" placeholder="2020.11.30 14:00"> -&nbsp;&nbsp;
					<input type="text" name="actEndday" class="inputTime" id="inputTitle" placeholder="2020.11.30 14:00"><br> 
					활동 장소&nbsp;&nbsp;<input type="text" name="actPlace" class="inputValue" id="inputTitle"><br>
					참여 가능 인원&nbsp;&nbsp;<input type="text" name="actPeople" class="inputValue" id="inputTitle"><br> 
					신청 마감일&nbsp;&nbsp;<input type="text" name="actRequestend" class="inputValue" id="inputTitle"><br> 
					관련 상품 링크&nbsp;&nbsp;<input type="text" name="actUrl" class="inputValue" id="inputTitle" placeholder="http://">
				</div>
			</div>
		</div>
		<div class="InputName">
			<p class="inputName">활동 이미지 등록</p>
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
			<textarea type="text" name="actContent" class="form-control" id="inputContent" style="height: 300px"></textarea>
		</div>
		<div class="InputName">
			<p class="inputName">구매 유의 사항 및 환불 규정</p>
		</div>
		<div class="TextArea">
			<textarea type="text" name="actGuide" class="form-control" id="inputContent" style="height: 150px"></textarea>
		</div>
		<div id="buttonArea">
			<button type="submit" id="insertBtn" class="btn btn mb-3">등록</button>
		</div>
		</form>
	</div>
</body>
</html>