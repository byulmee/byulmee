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
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
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

#serchFrame {
	float: right;
	font-size: 13px;
	font-weight: bold;
}

#searchValue {
	height: 30px;
	width: 160px;
	margin-bottom: 10px;
}

#listArea {
	width: 100%;
}

/* #noticeTable {
	height: 45px;
	width: 100%;
	text-align: center;
	
} */
thead {
	background-color: #F4F4F4;
}

tbody {
	min-height: 250px;
}

tr {
	text-align: center;
}

#pagingArea {
	text-align: center; 
}

#pagingArea > button {
	font-size: 10px;
}

#buttonArea > button {
	font-size: 12px;
}

th {
	font-size: 11px;
}

td {
	font-size: 11px;
}
.searchbtn{
	float: right; 
	background-color: #FF6833; 
	color: white;
	font-size: 11px;
	margin-left: 8px;
}

.select-script{margin-bottom: 10px; position:relative; width:217px; height:30px; line-height:30px; border:1px solid #606976; border-radius:4px; text-transform:uppercase; background:#fff;}
.select-script label{position:absolute; width:100%; font-size:.86em; color:#606976; top:0; left:0; padding:0 5%;}
.select-script label:after{content:'▼'; width:42px; height:30px; position:absolute; top:0; right:0; font-size:.76em; color:#fff; text-align:center; background:#FF6833; border-radius: 3px;}
.select-script select{width:100%; height:30px; opacity:0; filter:alpha(opacity=0); -ms-filter:alpha(opacity=0)/* IE 8 */;}
/*
td {
	background-color: white;
} */
/* background-color: #F4F4F4; */
</style>
<script>
$(document).ready(function(){
	 
    var select = $('.select-script select');
    select.change(function(){
         var select_name = $(this).children('option:selected').text();
        $(this).siblings("label").text(select_name);
        console.log(select_name);
    });
 	
});
</script>
</head>
<body>
	<c:import url="../common/gnb.jsp"/>
	<div id="mainFrame">
		<h2 id="mainName" style="font-weight: bold">고객센터</h2>
		<div id="serchFrame">
			<div class="select-box select-script">
  				<label for="selectbox" id="selectlabel">선택해 주세요</label>
				<select id="selectbox" title="선택 구분">
     					<option selected="selected">선택해 주세요</option>
     					<option>제목</option>
				        <option>카테고리</option>
				        <option>작성자</option>
				</select>
			</div>
			<input type="text" id="searchValue" name="serch" placeholder="입력해주세요">
			<button type="button" class="btn searchbtn" onclick="searchCusQna();">검색</button>
		</div>
		<br> <br> <br>
		<div id="noticeFrame">
			<table class="table table-hover" id="listArea">
				<thead>
					<tr>
						<th scope="col" class="text-center" width="5%">No</th>
						<th scope="col" class="text-center" width="10%">분류</th>
						<th scope="col" class="text-center" width="10%">조회수</th>
						<th scope="col" class="text-center" width="30%">제목</th>
						<th scope="col" class="text-center" width="10%">작성자</th>
						<th scope="col" class="text-center" width="10%">등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="q" items="${ list }">
						<tr class="QnAValue">
							<td>${ q.cusqnaNo }</td>
							<td><c:choose>
								<c:when test="${ q.cusqnaCategory eq '0' }">배송</c:when>
								<c:when test="${ q.cusqnaCategory eq '1' }">환불/반품</c:when>
								<c:when test="${ q.cusqnaCategory eq '2' }">주문/결제</c:when>
								<c:when test="${ q.cusqnaCategory eq '3' }">상품정보</c:when>
								<c:when test="${ q.cusqnaCategory eq '4' }">마이페이지</c:when>
								<c:when test="${ q.cusqnaCategory eq '5' }">기타</c:when>
								<c:when test="${ q.cusqnaCategory eq '6' }">신고</c:when>
							</c:choose></td>
							<td>${ q.cusqnaCount }</td>
							<td>${ q.cusqnaTitle }</td>
							<td>${ q.nickName }</td>
							<td>${ q.cusqnaDate }</td>
						<tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div id="buttonArea">	
			<button type="button" class="btn" style="float: right; background-color: #FF6833; color: white" onclick="location.href='QnAInsertView.bo'">질문 작성하기</button>	
		</div>
			<div id="pagingArea">
				<c:if test="${ searchValue eq null }">
					<c:set var="loc" value="QnAList.bo"/>
				</c:if>
				<c:if test="${ searchValue ne null }">
					<c:set var="loc" value="searchCusQna.bo"/>
				</c:if>
			
				<!-- 이전 페이지로 -->
				<c:if test="${ pi.currentPage <= 1 }">
					<button class="btn btn-light" onclick="#" id="beforeBtn" disabled="disabled">&lt;</button>
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="${ loc }">
						<c:if test="${ searchValue ne null }">
							<c:param name="searchCondition" value="${ searchCondition }"/>
							<c:param name="searchValue" value="${ searchValue }"/>
						</c:if>
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<button class="btn btn-light" onclick="location.href='${ before }'" id="beforeBtn">&lt;</button>
				</c:if>
				
				<!-- 숫자 목록 버튼 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<button class="btn btn-light" id="numBtn" class="text-reset" onclick="#"  disabled="disabled">${ p }</button>
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="${ loc }">
							<c:if test="${ searchValue ne null }">
								<c:param name="searchCondition" value="${ searchCondition }"/>
								<c:param name="searchValue" value="${ searchValue }"/>
							</c:if>
							<c:param name="page" value="${ p }"/>
						</c:url>
						<button class="btn btn-light" id="numBtn" class="text-reset" onclick="location.href='${ pagination }'">${ p }</button>
					</c:if>
				</c:forEach>
				
				<!-- 다음 페이지로 -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					<button class="btn btn-light" onclick="#" id="afterBtn" disabled="disabled">&gt;</button>
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="${ loc }">
						<c:if test="${ searchValue ne null }">
							<c:param name="searchCondition" value="${ searchCondition }"/>
							<c:param name="searchValue" value="${ searchValue }"/>
						</c:if>
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url>
					<button class="btn btn-light" onclick="location.href='${ after }'" id="afterBtn">&gt;</button>
				</c:if>
			</div>
	</div>
	<script>
		$(function() {
			$('.QnAValue').mouseenter(function(){
				$(this).css({'color': '#FF6833',  'font-weight':'bold', 'cursor': 'pointer'});
			}).mouseout(function(){
				$(this).css({'color': '#585858', 'font-weight':'normal'});
			}).click(function(){
				var cusqnaNo=$(this).children('td').eq(0).text();
				console.log(cusqnaNo);
				location.href='cusQnADetail.bo?cusqnaNo=' + cusqnaNo + '&page=' + ${pi.currentPage};
			});
		});

		function searchCusQna(){
			var searchValue = $("#searchValue").val();
			var searchCondition;
			var seCd = $("#selectlabel").text();
			if(seCd == "카테고리") {
				searchCondition = "category";
			} else if(seCd == "제목") {
				searchCondition = "title";
			} else {
				searchCondition = "writer";
			}

			
			console.log(searchCondition);
			console.log(searchValue);
 			if(searchCondition == "category"){
				if(searchValue == "배송"){
					location.href="searchCusQna.bo?searchValue="+ searchValue + "&searchCondition=" + searchCondition;
				} else if(searchValue == "환불/반품") {
					location.href="searchCusQna.bo?searchValue="+ searchValue + "&searchCondition=" + searchCondition;
				} else if(searchValue == "주문/결제") {
					location.href="searchCusQna.bo?searchValue="+ searchValue + "&searchCondition=" + searchCondition;
				} else if(searchValue == "상품정보") {
					location.href="searchCusQna.bo?searchValue="+ searchValue + "&searchCondition=" + searchCondition;
				} else if(searchValue == "마이페이지") {
					location.href="searchCusQna.bo?searchValue="+ searchValue + "&searchCondition=" + searchCondition;
				} else if(searchValue == "기타") {
					location.href="searchCusQna.bo?searchValue="+ searchValue + "&searchCondition=" + searchCondition;
				} else if(searchValue == "신고") {
					location.href="searchCusQna.bo?searchValue="+ searchValue + "&searchCondition=" + searchCondition;
				} else {
					alert("카테고리 검색어가 정확하지 않습니다.");
					$("#searchValue").focus();
					return false;
				}
			} else {
				location.href="searchCusQna.bo?searchValue="+ searchValue + "&searchCondition=" + searchCondition;
			}
		}
	</script>
</body>
</html>