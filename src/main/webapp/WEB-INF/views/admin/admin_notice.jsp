<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/admin/admin_notice.css">
</head>
<!-- <script> -->
<!-- // $(document).ready(function(){ -->
	 
<!-- //     var select = $('.select-script select'); -->
<!-- //     select.change(function(){ -->
<!-- //          var select_name = $(this).children('option:selected').text(); -->
<!-- //         $(this).siblings("label").text(select_name); -->
<!-- //         console.log(select_name); -->
<!-- //     }); -->
 	
<!-- // }); -->
<!-- </script> -->
<body>
 	<header class="navbar">
		<span class="navbar_logo">
			<a onclick="location.href='home.do'"><img src="resources/images/admin/byulmee.PNG" alt="별미 로고" width="200"></a>
		</span>
		
		<span class="navbar_name">관리자 페이지
		
		</span>
	</header>
  	<div class="wrapper">
       		<ul>
				<li> <a onclick="location.href='adminMain.ad'" class="b1">매출관리</a>
				<li> <a onclick="location.href='adminMember.ad'" class="b2">회원관리</a>
				<li> <a onclick="location.href='adminNotice.ad'" class="b3">게시글관리</a>
				<li> <a onclick="location.href='adminBanner.ad'" class="b4">배너관리</a>
			</ul>
  	</div>
  	<div class="outer">
  		<div class="idlist">
  		<h1 align="center">공지사항</h1>
  		
  		<div class="pick">
		</div>
		
<!-- 		<div class="idlist"> -->
			<table id="idTable">
				<tr>
					<th align="center">No </th>
					<th align="center">제목 </th>
     				<th align="center">작성자 </th>
          			<th align="center">등록일</th>
           		</tr>
           	<c:forEach var="n" items="${ nlist }">
           		<tr class="notice">
           			<td align="center">${ n.notNo }</td>
                  	<td align="center">${ n.notTitle }</td>
                 	<td align="center">${ n.memId }</td>
                  	<td align="center">${ n.notDate }</td>
                 </tr>
            </c:forEach>
           	</table>
           	<br>
           	<div id="pagingArea" align="center">
				<!-- 이전 페이지로 -->
				<c:if test="${ pi.currentPage <= 1 }">
					<button class="btn btn-light" onclick="#" id="beforeBtn" disabled="disabled">&lt;</button>
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="adminNotice.ad">
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
						<c:url var="pagination" value="adminNotice.ad">
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
					<c:url var="after" value="adminNotice.ad">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url>
					<button class="btn btn-light" onclick="location.href='${ after }'" id="afterBtn">&gt;</button>
				</c:if>
			</div>	
           	
		</div>
		<br>
		<div class="idlist">
			<h2 align="center">Q&A</h2>
<!-- 		    <div class="select-box select-script"> -->
<!-- 			    <label for="selectbox" id="selectlabel"></label> -->
<!-- 	      		<select id="selectbox" name="searchCondition"> -->
<!--         						<option>배송</option> -->
<!-- 						        <option>환불/반품</option> -->
<!-- 						        <option>주문/결제</option> -->
<!-- 						        <option>상품 정보</option> -->
<!-- 						        <option>마이페이지</option> -->
<!-- 						        <option>기타</option> -->
<!-- 						        <option>신고</option> -->
<!-- 	      		</select> -->
	      	<br>
 <!--      		</div>
		<div class="idlist"> -->
			<table id="idTable">
				<tr>
					<th align="center">No. </th>
     				<th align="center">분류 </th>
          			<th align="center">내용</th>
          			<th align="center">작성자</th>
          			<th align="center">등록일</th>          			
           		</tr>
           		<c:forEach var="q" items="${ qlist }">
           		<tr class="QnA">
                  	<td align="center">${ q.cusqnaNo }</td>
					<td><c:choose>
						<c:when test="${ q.cusqnaCategory eq '0' }">배송</c:when>
						<c:when test="${ q.cusqnaCategory eq '1' }">환불/반품</c:when>
						<c:when test="${ q.cusqnaCategory eq '2' }">주문/결제</c:when>
						<c:when test="${ q.cusqnaCategory eq '3' }">상품정보</c:when>
						<c:when test="${ q.cusqnaCategory eq '4' }">마이페이지</c:when>
						<c:when test="${ q.cusqnaCategory eq '5' }">기타</c:when>
						<c:when test="${ q.cusqnaCategory eq '6' }">신고</c:when>
						</c:choose>
					</td>
                  	<td align="left">${ q.cusqnaContent  }</td>
                  	<td align="center">${ q.memId }</td>
                  	<td align="center">${ q.cusqnaDate }</td>
                 </tr>
                 </c:forEach>
           		
           	</table>	
		</div>
		  	<br>
		<div id="pagingArea" align="center">
				<!-- 이전 페이지로 -->
				<c:if test="${ pi2.currentPage <= 1 }">
					<button class="btn btn-light" onclick="#" id="beforeBtn" disabled="disabled">&lt;</button>
				</c:if>
				<c:if test="${ pi2.currentPage > 1 }">
					<c:url var="before" value="adminNotice.ad">
						<c:param name="page" value="${ pi2.currentPage - 1 }"/>
					</c:url>
					<button class="btn btn-light" onclick="${ before }" id="beforeBtn">&lt;</button>
				</c:if>
				
				<!-- 숫자 목록 버튼 -->
				<c:forEach var="b" begin="${ pi2.startPage }" end="${ pi2.endPage }">
					<c:if test="${ b eq pi2.currentPage }">
						<button class="btn btn-light" id="numBtn" class="text-reset" onclick="#"  disabled="disabled">${ b }</button>
					</c:if>
					
					<c:if test="${ b ne pi2.currentPage }">
						<c:url var="pagination" value="adminNotice.ad">
							<c:param name="page" value="${ b }"/>
						</c:url>
						<button class="btn btn-light" id="numBtn" class="text-reset" onclick="${ pagination }">${ b }</button>
					</c:if>
				</c:forEach>
				
				<!-- 다음 페이지로 -->
				<c:if test="${ pi2.currentPage >= pi2.maxPage }">
					<button class="btn btn-light" onclick="#" id="afterBtn" disabled="disabled">&gt;</button>
				</c:if>
				<c:if test="${ pi2.currentPage < pi2.maxPage }">
					<c:url var="after" value="adminNotice.ad">
						<c:param name="page" value="${ pi2.currentPage + 1 }"/>
					</c:url>
					<button class="btn btn-light" onclick="${ after }" id="afterBtn">&gt;</button>
				</c:if>
			</div>	 
			</div>		
		
  	</div>
  	</div>
	  	<script>
			$(function() {
				$('.notice').mouseenter(function(){
					$(this).css({'color': '#3B3A5A',  'font-weight':'bold', 'cursor': 'pointer'});
				}).mouseout(function(){
					$(this).css({'color': '#585858', 'font-weight':'normal'});
				}).click(function(){
					var notNo=$(this).children('td').eq(0).text();
					console.log(notNo);
					location.href='notDetail.bo?notNo=' + notNo + '&page=' + ${pi.currentPage};
				});
			});
		</script>
		
		<script>			
			$(function() {
				$('.QnA').mouseenter(function(){
					$(this).css({'color': '#3B3A5A',  'font-weight':'bold', 'cursor': 'pointer'});
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