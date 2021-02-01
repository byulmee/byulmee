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
	min-height: 650px;
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

.category {
	font-size: 9px;
}

.textArea {
	height: 300px;
}
.
.answerArea {
	height: 100px;
}

.answerName {
	font-size: 12px;
	padding-top: 15px;
	padding-left: 15px;
	font-weight: bold;
}
.answerText {
	font-size: 13px;
	font-weight: bold;
	padding-top: 10px;
	padding-left: 15px;
	min-height: 150px;
}

.ReplyArea {
	float: right;
	margin-right: 20px;
	margin-top: 20px;
}

#repUpdateBtn {
	background-color: #FF6833; 
	color: white;
	margin-left: 8px;
	margin-right: 15px;
	font-size: 13px;
}

#repDelBtn {
	background-color: #EFEFEF; 
	color: #5A5A5A;
	font-size: 11px;
} 

.replybtn {
	float: right;
	margin-top: 10px;
}

.table-active {
	height: 50px;
	padding-top: 15px;
	padding-left: 15px;
	font-weight: bold;
}
</style>
</head>
<body>
	<c:import url="../common/gnb.jsp"/>
	<div class="outer">
		<div class="MainLogoText">
			<p class="MainText">Q&A</p>
		</div>
		<div class="table table-responsive" id="TableArea">
			<table class="table">
				<tr>
					<th class="category">분류 > <c:choose>
								<c:when test="${ customerqna.cusqnaCategory eq '0' }">배송</c:when>
								<c:when test="${ customerqna.cusqnaCategory eq '1' }">환불/반품</c:when>
								<c:when test="${ customerqna.cusqnaCategory eq '2' }">주문/결제</c:when>
								<c:when test="${ customerqna.cusqnaCategory eq '3' }">상품 정보</c:when>
								<c:when test="${ customerqna.cusqnaCategory eq '4' }">마이페이지</c:when>
								<c:when test="${ customerqna.cusqnaCategory eq '5' }">기타</c:when>
								<c:when test="${ customerqna.cusqnaCategory eq '6' }">신고</c:when>
							</c:choose></th>
				</tr>
				<tr>
					<th class="mainTitle">${ customerqna.cusqnaTitle }</th>
				</tr>
				<tr>
					<th class="secondTitle">${ customerqna.cusqnaDate }<br>${ customerqna.nickName } 작성</th>
				</tr>
				<tr class="textArea">
					<% pageContext.setAttribute("newLineChar", "\r\n"); %>
					<td>${ fn:replace(customerqna.cusqnaContent, newLineChar, "<br>") }</td>
				</tr>
			</table>
			<c:if test="${ empty reply }">
			<div class="answerArea">
				<c:if test="${ loginUser.memId eq 'admin' }">
					<div class="form-group">
						<label for="inputContent" class="col-sm-2 col-form-label"><strong>답변</strong></label>
						<div class="col-sm-10">
							<textarea name="repContent" class="form-control" id="repContent" style="height: 200px; width: 765px"></textarea>
						</div>
						<div class="ReplyArea">
							<button type="button" id="insertBtn" class="btn btn mb-3" style="background-color: #FF6833; color: white">답변등록</button>
						</div>
						
					</div>
				</c:if>
			</div>	
			</c:if>
			<c:if test="${ !empty reply }">
			<div class="answerArea" id="answerArea">
					<div class="table-active">답변</div>
					<input type="hidden" id="reRepNo" value="${reply.repNo }">
					<div class="answerName">${ reply.nickName }<br>${ reply.repDate }</div>
					<hr>
					<div class="answerText" id="answerText">${ reply.repContent }</span></div>
					<input type="hidden" id="reRepContent" value="${reply.repContent }">
					<c:if test="${ loginUser.memId eq 'admin' }">
					<hr>
					<div class="replybtn">
						<!-- <button type="button" id="repDelBtn" class="btn btn mb-3">삭제</button> -->
						<button type="submit" id="repUpdateBtn" class="btn btn mb-3" data-toggle='modal' data-target='#modifyModal'>수정</button>
					</div>	
					</c:if>
			</div>
			</c:if>
			<div class="modal fade" id="modifyModal" role="dialog">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h4 class="modal-title">답글 수정</h4>
		            </div>
		            <div class="modal-body">
		                <input type="hidden" id="moRepNo" name="repNo">
		                <input type="hidden" id="moRepRefno" name="repRefno">
		              
		                <div class="form-group">
		                    <label for="repContent">댓글 내용</label>
		                    <textArea class="form-control" id="moRepContent" name="repContent" placeholder="댓글 내용을 입력해주세요" style="height: 200px; width: 470px"></textArea>
		                </div>
		            </div>
		            <div class="modal-footer">
		                <button type="button" class="btn pull-left" data-dismiss="modal" style="background-color: #EFEFEF; color: #5A5A5A">닫기</button>
		                <button type="button" class="btn modalDelBtn" style="background-color: #EFEFEF; color: #5A5A5A">삭제</button>
		                <button type="button" class="btn modalModBtn" style="background-color: #FF6833; color: white">수정</button>
		            </div>
		        </div>
		    </div>
		</div>
		</div>
		<div class="buttonArea">
			<c:if test="${ loginUser.memId eq customerqna.memId }">
				<button type="button" id="delBtn" class="btn btn mb-3" style="background-color: #EFEFEF; color: #5A5A5A">삭제</button>
				<button type="button" id="updateBtn" class="btn btn mb-3" style="background-color: #FF6833; color: white" onclick="location.href='cusUpdateForm.bo?cusqnaNo=${ customerqna.cusqnaNo }&page=${ page }'">수정</button>
			</c:if>
			<button type="button" id="listBtn" class="btn btn mb-3" style="background-color: #FF6833; color: white" onclick="location.href='QnAView.bo?page=${ page }'">목록으로</button>
		</div>
	</div>
	<script>

		$(document).ready(function(){
			var Content = $('#answerText').text();
			console.log(Content);
			Content = Content.replace(/(?:\r\n|\r|\n)/g, '<br>');
			$('#answerText').html(Content);
		});
	
		$('#insertBtn').click(function(){
			var memId = 'admin';
			var repContent = $('#repContent').val();
			var repRefno = ${ customerqna.cusqnaNo };

			$.ajax({
				url: 'repInsert.bo',
				data: {memId:memId, repContent:repContent, repRefno:repRefno},
				success: function(data){
					if(data == 'success'){
						window.location.reload();
					}
				}
			});
		});

		$('#repUpdateBtn').on("click", function(){
			var repContent = $('#reRepContent').val();
			var repNo = $('#reRepNo').val();
			var repRefno = ${ customerqna.cusqnaNo };
			console.log(repContent);
			console.log(repNo);
			
			$("#moRepNo").val(repNo); 
			$("#moRepContent").val(repContent); 
			$("#moRepRefno").val(repRefno); 
			
		});

		$('.modalModBtn').on("click", function(){
			var repNo = $('#moRepNo').val();
			var repRefno = $('#moRepRefno').val();
			var repContent = $('#moRepContent').val();

			console.log(repContent);
			
			$.ajax({
			 	url: 'updateCusReply.bo',
				data: {repNo:repNo, repRefno:repRefno, repContent:repContent},
				success: function(data){
					console.log(data);
					if(data == 'success') {
						alert("답글 수정 완료");
						$("#modifyModal").modal("hide");
						window.location.reload();
						//location.href="cusQnADetail.bo?cusqnaNo=${ customerqna.cusqnaNo }&page=${ page }";
					}
				} 
			}); 
		});

		$('.modalDelBtn').on("click", function(){
			var chk = confirm("정말 삭제하시겠습니까?");
			var repNo = $('#moRepNo').val();
			if(chk){
				$.ajax({
					url: 'delCusReply.bo',
					data: {repNo:repNo},
					success: function(data){
						alert("답글 삭제 완료");
						$("#modifyModal").modal("hide");
						window.location.reload();
					}
				});
			}
		});

		$(function(){
			$('#delBtn').click(function(){
				var chk = confirm("정말 삭제하시겠습니까?");
				if(chk){
					location.href="deleteCusQna.bo?cusqnaNo=${ customerqna.cusqnaNo }&page=${ page }";
				}
			});
		});
	</script>
</body>
</html>