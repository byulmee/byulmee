<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<style>
.outer {
	margin-top: 50px;
	margin-bottom: 50px;
	margin-left: auto;
	margin-right: auto;
	overflow: hidden;
	position: relative;
	width: 800px;
	font-family: "G마켓 산스 TTF Medium";
}

.MainText {
	color: #585858;
	font-size: 20px;
	font-weight: bold;
}

#TableArea {
	border: 1px solid; 
}

tr > .mainTitle {
	
	margin-top: 15px;
}

tr > .secondTitle {
	font-size: 9px;
}

.buttonArea {
	float: right;
}
</style>
</head>
<body>
	<c:import url="../common/gnb.jsp"/>
	<div class="outer">
		<div class="MainLogoText">
			<p class="MainText">공지사항</p>
		</div>
		<div class="table table-responsive" id="TableArea">
			<table class="table">
				<tr>
					<th class="mainTitle">${ notice.notTitle }</th>
				</tr>
				<tr>
					<th class="secondTitle">${ notice.notDate }<br>${ notice.nickName } 작성</th>
				</tr>
				<tr>
					<% pageContext.setAttribute("newLineChar", "\r\n"); %>
					<td>${ fn:replace(notice.notContent, newLineChar, "<br>") }</td>
				</tr>
			</table>
		</div>
		<div class="buttonArea">
		<c:if test="${ loginUser.memId eq 'admin' }">
			<button type="button" id="deleteBtn" class="btn btn mb-3" style="background-color: #ECECEC; color: #585858">삭제</button>
			<button type="button" id="updateBtn" class="btn btn mb-3" onclick="location.href='notUpdateForm.bo?notNo=${ notice.notNo }&page=${ page }'"  style="background-color: #FF6833; color: white">수정</button>
		</c:if>
			<button type="button" id="listBtn" class="btn btn mb-3" style="background-color: #FF6833; color: white" onclick="location.href='noticeListView.bo?page=${ page }'">목록으로</button>
		</div>
	</div>
	<script>
		$(function(){
			$('#deleteBtn').click(function(){
				var chk = confirm("정말 삭제하시겠습니까?");
				if(chk){
					location.href="notDelete.bo?notNo=${ notice.notNo }&page=${ page }";
				}
			});
		});
	</script>
</body>
</html>