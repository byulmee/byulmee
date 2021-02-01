<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
#contentImg1, #contentImg2, #contentImg3, #contentImg4 {
	width: 175px; height: 180px;
}

#buttonArea {
	float: right;
}

#insertBtn {
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


#insertBtn:hover {
	background: #ECECEC;
	color: #585858;
}

 #cancelBtn {
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
	background: #ECECEC;
	color: #585858;
	border-radius: 25px;
 }

#cancelBtn:hover {
	background: #FF6833;
	color: white;
}

#unableBtn, #ableBtn {
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
	<form action="aupdate.wr" method="post" enctype="Multipart/form-data">
		<div class="MainLogoText">
			<p class="MainText">활동 등록</p>
			<input type="hidden" name="memId" value="${ loginUser.memId }">
			<input type="hidden" name="actNo" value="${ activity.actNo }">
			<input type="hidden" name="page" value="${ page }">
		</div>
		<div class="InputName">
			<p class="inputName">필수 입력</p>
		</div>
		<div class="mainInput">
			<div class="radiogroup">
				<input type="radio" class="checkbox" name="activityGroup" value="activity" id="Group1"> 
				<label for="Group1" class="input-label radio">액티비티</label>
				<input type="radio" class="checkbox" name="activityGroup" value="living" id="Group2">
				<label for="Group2" class="input-label radio">리빙</label> 				
				<input type="radio" class="checkbox" name="activityGroup" value="health" id="Group3">
				<label for="Group3" class="input-label radio">건강/미용</label>				
				<input type="radio" class="checkbox" name="activityGroup" value="healing" id="Group4">
				<label for="Group4" class="input-label radio">힐링</label>	
				<input type="radio" class="checkbox" name="activityGroup" value="food" id="Group5">
				<label for="Group5" class="input-label radio">푸드</label>
				<input type="radio" class="checkbox" name="activityGroup" value="career" id="Group6">
				<label for="Group6" class="input-label radio">커리어</label>		
				<input type="hidden" name="actCategory" id="actCategory" value="${ activity.actCategory }">
			</div>
			<script>
				$(document).ready(function(){
					var setCategory = $('#actCategory').val();
					if(setCategory == "0"){
						$('#Group1').prop("checked", true);
					} else if(setCategory == "1"){
						$('#Group2').prop("checked", true);
					} else if(setCategory == "2"){
						$('#Group3').prop("checked", true);
					} else if(setCategory == "3"){
						$('#Group4').prop("checked", true);
					} else if(setCategory == "4"){
						$('#Group5').prop("checked", true);
					} else {
						$('#Group6').prop("checked", true);
					}
					
					
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
				<c:forEach var="i" items="${ ilist }" >
					<c:if test="${ i.imgLevel eq '0' }">
						<img id="thumbnail" name="thumbnail" src="${ pageContext.servletContext.contextPath }/resources/auploadFiles/${ i.imgName }">
					</c:if>
				</c:forEach>
					<button type="button" id="thumbnailbtn">썸네일 등록</button>
				</div>
				<div class="inputText">
					제목&nbsp;&nbsp;<input type="text" name="actTitle" class="inputValue" id="inputTitle" value="${ activity.actTitle }"><br> 
					연락처&nbsp;&nbsp;<input type="text" name="actPhone" class="inputValue" id="inputTitle" value="${ activity.actPhone }"><br>
					활동비&nbsp;&nbsp;<input type="number" name="actPrice" class="inputValue"	id="inputTitle" value="${ activity.actPrice }"><br> 
					활동기간&nbsp;&nbsp;<input	type="text" name="actStartday" class="inputTime" id="inputTitle" placeholder="2020-11-30" value="${ activity.actStartday }"> -&nbsp;&nbsp;
					<input type="text" name="actEndday" class="inputTime" id="inputTitle" placeholder="2020-11-30" value="${ activity.actEndday }"><br> 
					활동 장소&nbsp;&nbsp;<input type="text" name="actPlace" class="inputValue" id="inputTitle" value="${ activity.actPlace }"><br>
					참여 가능 인원&nbsp;&nbsp;<input type="number" name="actPeople" class="inputValue" id="inputTitle" value="${ activity.actPeople }"><br> 
					신청 마감일&nbsp;&nbsp;<input type="text" name="actRequestend" class="inputValue" id="inputTitle" value="${ activity.actRequestend }"><br> 
					관련 상품 링크&nbsp;&nbsp;<input type="text" name="actUrl" class="inputValue" id="inputTitle" placeholder="http://" value="${ activity.actUrl }">
				</div>
			</div>
		</div>
		<div class="InputName">
			<p class="inputName">활동 이미지 등록</p>
		</div>
			<div class="ImgArea">
				 <span id="contentImgArea1">
				 <c:forEach var="i" items="${ ilist }">
				 	<c:if test="${ i.imgLevel eq '1' }">
				 		<img id="contentImg1" name="contentImg1" src="${ pageContext.servletContext.contextPath }/resources/auploadFiles/${ i.imgName }">
				 	</c:if>
				 </c:forEach>		 
				 </span>
				 <span id="contentImgArea2">
				 <c:forEach var="i" items="${ ilist }">
				 	<c:if test="${ i.imgLevel eq '2' }">
				 		<img id="contentImg2" name="contentImg2" src="${ pageContext.servletContext.contextPath }/resources/auploadFiles/${ i.imgName }">
				 	</c:if>
				 </c:forEach> 
				 </span>
				 <span id="contentImgArea3">
				 <c:forEach var="i" items="${ ilist }">
				 	<c:if test="${ i.imgLevel eq '3' }">
				 		<img id="contentImg3" name="contentImg3" src="${ pageContext.servletContext.contextPath }/resources/auploadFiles/${ i.imgName }">
				 	</c:if>
				 </c:forEach> 
				 </span>
				 <span id="contentImgArea4">
				 <c:forEach var="i" items="${ ilist }">
				 	<c:if test="${ i.imgLevel eq '4' }">
				 		<img id="contentImg4" name="contentImg4" src="${ pageContext.servletContext.contextPath }/resources/auploadFiles/${ i.imgName }">
				 	</c:if>
				 </c:forEach> 
				 </span>
				 <!-- 파일 업로드 하는 부분 -->
				<div id="fileArea">
					<input type="file" id="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this,1)">
					<input type="file" id="thumbnailImg2" multiple="multiple" name="thumbnailImg2" onchange="LoadImg(this,2)">
					<input type="file" id="thumbnailImg3" multiple="multiple" name="thumbnailImg3" onchange="LoadImg(this,3)">
					<input type="file" id="thumbnailImg4" multiple="multiple" name="thumbnailImg4" onchange="LoadImg(this,4)">
					<input type="file" id="thumbnailImg5" multiple="multiple" name="thumbnailImg5" onchange="LoadImg(this,5)">
				</div>
				
				<c:forEach var="i" items="${ ilist }">
					<c:choose>
						<c:when test="${ i.imgLevel eq '0' }"><input type="hidden" name="imgName1" id="imgName1" value="${ i.imgName }"></c:when>	
						<c:when test="${ i.imgLevel eq '1' }"><input type="hidden" name="imgName2" id="imgName2" value="${ i.imgName }"></c:when>	
						<c:when test="${ i.imgLevel eq '2' }"><input type="hidden" name="imgName3" id="imgName3" value="${ i.imgName }"></c:when>	
						<c:when test="${ i.imgLevel eq '3' }"><input type="hidden" name="imgName4" id="imgName4" value="${ i.imgName }"></c:when>	
						<c:when test="${ i.imgLevel eq '4' }"><input type="hidden" name="imgName5" id="imgName5" value="${ i.imgName }"></c:when>					
					</c:choose>
				</c:forEach>
				
				
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
			<textarea type="text" name="actContent" class="form-control" id="inputContent" style="height: 300px">${ activity.actContent }</textarea>
		</div>
		<div class="InputName">
			<p class="inputName">구매 유의 사항 및 환불 규정</p>
		</div>
		<div class="TextArea">
			<textarea type="text" name="actGuide" class="form-control" id="inputContent" style="height: 150px">${ activity.actGuide }</textarea>
		</div>
		<div id="buttonArea">
			<button type="button" id="cancelBtn" class="btn btn mb-3">삭제</button>
			<button type="button" id="unableBtn" class="btn btn mb-3" onclick="location.href='actunable.wr?actNo=${ activity.actNo }&page=${ page }'" style="<c:if test="${ activity.actStatus eq 'Y' }">background: #ECECEC; color: #585858</c:if>
					<c:if test="${ activity.actStatus eq 'N' }">background: #FF6833; color: white</c:if>">비활성</button>
			<button type="button" id="ableBtn" class="btn btn mb-3" onclick="location.href='actable.wr?actNo=${ activity.actNo }&page=${ page }'" style="<c:if test="${ activity.actStatus eq 'Y' }">background: #FF6833; color: white</c:if>
					<c:if test="${ activity.actStatus eq 'N' }">background: #ECECEC; color: #585858</c:if>">활성</button>
			<button type="submit" id="insertBtn" class="btn btn mb-3">수정하기</button>
		</div>
		</form>
	</div>
	<script>
		$(function (){
			$('#cancelBtn').click(function(){
				var imgName1 = $("#imgName1").val();
				var imgName2 = $("#imgName2").val();
				var imgName3 = $("#imgName3").val();
				var imgName4 = $("#imgName4").val();
				var imgName5 = $("#imgName5").val();

				var chk = confirm("정말 삭제하시겠습니까?");
				if(chk) {
					location.href="delActivity.wr?actNo=${ activity.actNo }&page=${ page }" + "&imgName1=" + imgName1+ "&imgName2=" + imgName2+ "&imgName3=" + imgName3 + "&imgName4=" + imgName4+ "&imgName5=" + imgName5;
				}
			});
		});
	</script>
</body>
</html>