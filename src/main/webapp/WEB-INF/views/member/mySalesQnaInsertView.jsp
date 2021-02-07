<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
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

#activityTitle{
	font-size: 20px;
	line-height: 170%;
}
</style>
</head>
<body>
	<c:import url="../common/gnb.jsp"/>
	<div id="mainFrame" style="padding-left: 10%; padding-right: 10%;">
		<h2 align="center" style="padding-top: 15px; font-weight: bold">활동 문의 등록</h2>
		<hr>
		<form action="salesQnaInsert.me" method="post">
			<div class="form-group row">
				<label for="inputTitle" class="col-sm-2 col-form-label"><strong>제목</strong></label>
				<input type="hidden" name="memId" value="${ loginUser.memId }">
				<input type="hidden" name="starId" value="${ ac.memId }">
				<div class="col-sm-10">
					<input type="text" name="salqnaTitle" class="form-control"
						id="inputTitle">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputTitle" class="col-sm-2 col-form-label"><strong>활동</strong></label>
				<div class="col-sm-10" id="activityTitle">
					<span>[${ ac.actTitle }]</span>
					<input type="hidden" name="acId" value="${ ac.actNo }">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputContent" class="col-sm-2 col-form-label"><strong>내용</strong></label>
				<div class="col-sm-10">
					<textarea type="text" name="salqnaContent" class="form-control"
						id="inputContent" style="height: 400px"></textarea>
				</div>
			</div>
			<div id="buttonArea">
			<button type="submit" id="insertBtn" class="btn btn mb-3" style="background-color: #FF6833; color: white">등록</button>
			<button type="button" id="cancelBtn" class="btn btn mb-3" style="background-color: #EFEFEF; color: #5A5A5A" onclick="history.back()">취소</button>
			</div>
		</form>
	</div>

</body>
</html>