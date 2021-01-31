<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@300&display=swap" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js"></script>
</head>
<style>
BODY {
 	font-family: 'GmarketSansTTFMedium'; 
}
.navbar_name{
  color: white;
  font-size: 20px;
  padding: 20px 30px;
}
.navbar {
  display: flex;
  justify-content:inherit;
  background-color: #3B3A5A;
  align-items: center;
  height: 80px;
  width: 1770px;
}
.navbar_logo {
	margin-left: 30px;
	color: white;
}
.wrapper {
  	display: flex;  
/*   	position: relative;     */
 	position: fixed;  

 	width: 200px; 
	height: 440px;
	background-color: #f5f5f5;
	padding: 30px 0;

}
/* .wrapper .sidebar{
	position: fixed;
 	width: 200px; 
	height: 100%;
	background-color: #f5f5f5;
	padding: 30px 0;
	
} */
.wrapper ul li{
		padding: 30px;
		border-bottom: 2px solid rgba(0,0,0,0.05);
		border-top: 2px solid rgba(225,225,225,0.05);
		list-style: none;
 		padding-left: 15px;  
		
	}
.wrapper 	ul li a{
	color : black;
	dispalay: block;
	text-decoration: none;
	font-size:18px;
	
}
.wrapper li a:active{
 color: #3B3A5A;
 font-weight: bold
 }
.outer {
   position:relative;
  left: 435px;
  margin-right: 435px;
  width: 900px;
  height: 1000px;
  margin-top:50px;
  margin-bottom:50px;
	
/*      background-color:red;  */
	}
.outer .search{
 /* background-color:pink */;
  margin-left:center;
}
.outer .search .searchArea{
/* background-color: #f5f5f5; */
}
.outer .search .searchArea .nickname{  
  padding-left: 15px;
}
.find{
  margin-top: 20px;
  margin-left: 815px;
  find2-background-color: #3B3A5A;
	font-size: 15px;
	color: white;
}
.find .find2{
	background-color: #3B3A5A;
	font-size: 15px;
	color: white;
}
.idlist{
	margin-top: 100px; margin-bottom: 50px;
}	
 #idTable{text-align:center; margin: auto; width: 900px;
		border-collapse: collapse; 
}
 #idTable th{background-color: #f5f5f5;}
 #idTable td{border-bottom: 1px solid lightgray;}
 td,th {
 	padding: 10px; 
 	}
</style>

<script>
	$(function() {
		$("button[name=memLevel]").on("click", function() {
			let level = $(this).data("level") == "1" ? 0 : 1 ;
			let memberId = $(this).data("id");
			let button = $(this);

			$.post("/byulmee/api/admin/level/update", "memberId=" + memberId + "&level=" + level, function(res) {
				button.text(level).data("level", level);
			});
		});
		
		$("button[name=memStatus]").on("click", function() {
			let status = $(this).data("status") == "Y" ? "N" : "Y";
			let memberId = $(this).data("id");
			let button = $(this);

			$.post("/byulmee/api/admin/status/update", "memberId=" + memberId + "&status=" + status, function(res) {
				button.text(status).data("status", status);
			});
		});
});
</script>
<body>
 	 <header class="navbar">
		<span class="navbar_logo">
			<a onclick="location.href='home.do'"><img src="resources/images/admin/byulmee.PNG" alt="별미 로고" width="200" ></a>
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
  		<h2 align="center">회원검색</h2>
  		<div class="search">
  		
  			<div class="searchArea" align="center"> 
      			<label>아이디</label>
    			<input id="searchValue" type="search">
    			<label class="nickname">닉네임</label>
    			<input id="searchValue" type="search">  
    		</div>
		</div>
		<div class="find">
			<button id="find2">검색하기</button>
		</div>
		<div class="idlist">
			<h2 align="center">회원 전체 목록</h2>
			<table id="idTable">
				<tr>
					<th align="left"><input type="checkbox"/> 회원 번호 </th>
     				<th align="left">아이디 </th>
          			<th align="left">이름</th>
           			<th align="left">닉네임</th>
          			<th align="center">구분</th>
           			<th align="left">연락처</th>
          	 		<th align="left">기념일</th>
           			<th align="center">관리</th>
       			</tr>
       			
       			<c:forEach items="${ list }" var="m" >
       				<c:if test="list == null">
       				</c:if>
       			<tr>
                  <td align="left"><input type="checkbox"/> ${m.memNo }</td>
                  <td align="left">${m.memId }</td>
                  <td align="left">${m.memName }</td>
                  <td align="left">${m.memNickname }</td>
                  <td align="center">
					  <button type="button" name="memLevel" data-level="${m.memLevel}" data-id="${m.memId}">${m.memLevel }</button>
				  </td>
                  <td align="left">${m.memPhone }</td>
                  <td align="left">${m.memDate }</td>
                  <td align="center">
					  <button type="button" name="memStatus" data-status="${m.memStatus}" data-id="${m.memId}">${m.memStatus }</button>
				  </td>
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
					<c:url var="before" value="adminMember.ad">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<button class="btn btn-light" onclick="${ before }" id="beforeBtn">&lt;</button>
				</c:if>
				
				<!-- 숫자 목록 버튼 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<button class="btn btn-light" id="numBtn" class="text-reset" onclick="#"  disabled="disabled">${ p }</button>
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="adminMember.ad">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<button class="btn btn-light" id="numBtn" class="text-reset" onclick="${ pagination }">${ p }</button>
					</c:if>
				</c:forEach>
				
				<!-- 다음 페이지로 -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					<button class="btn btn-light" onclick="#" id="afterBtn" disabled="disabled">&gt;</button>
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="adminMember.ad">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url>
					<button class="btn btn-light" onclick="${ after }" id="afterBtn">&gt;</button>
				</c:if>
			</div>	
<!-- 		 <div id="" class="" align="center""> -->
<!--         	<button class="" id="" onclick=""><</button> -->
<!--          	<button class="" id="" onclick="">1</button> -->
<!--          	<button class="" id="" onclick="">2</button> -->
<!--         	<button class="" id="" onclick="">3</button> -->
<!--          	<button class="" id="" onclick="">...</button> -->
<!--          	<button class="" id="" onclick="">38</button> -->
<!--          	<button class="" id="" onclick="">></button> -->
<!--      	</div> -->
	</div>
  	</div>
  	  	

</body>
</html>