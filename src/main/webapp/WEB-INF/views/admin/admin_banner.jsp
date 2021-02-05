<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/admin/admin_banner.css">
<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js"></script>
</head>
<script>
	$(function() {
		$("button[name=banOpen]").on("click", function() {
			let open = $(this).data("open") == "Y" ? "N" : "Y";
			let bannerNo = $(this).data("id");
			let button = $(this);

			$.post("/api/admin/open/update", "bannerNo=" + bannerNo + "&open=" + open, function(res) {
				button.text(open).data("open", open);
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
  		<div class="baDiv">
  		<form action="BannerInsert.ad" method="post" enctype="Multipart/form-data">
		<table id="baTable">
			<tr>
				<th align="left">베너 이미지 업로드 : <input type="file" name="updateBan" class="banner" > </th>
  			</tr>
  			<tr>
  				<td class="batd1"> alt : <input type="text" name="altBan" required align="left" style="width:230px;"> 
  				  &nbsp; url : <input type="url" name="banUrl" style="width:300px;"/>
  				   <br><br> 배경색 : <input type="text" name="banBgc" style="width:200px;"/>
  				</td>
  			</tr>
  			<tr>
  				<td class="batd2" align="right">
  				<input type="submit" value="등록"> &nbsp;
  				</td>
  			</tr>
  		</table>
  		</form>
  		</div>
  		
  		<div class="delete">
  			<button>선택 삭제</button>
  		</div>
  		<div class="idlist">
			<table id="idTable">
				<tr>
					<th align="left">배너 번호 </th>
     				<th align="left">alt </th>
          			<th align="left">이미지명</th>
           			<th align="center">노출 여부</th>
           		</tr>
	           	<c:forEach var="b" items="${ list }">
	           		<tr>
	                  <td align="left"><input type="checkbox"/>${ b.banNo }</td>
	                  <td align="left">${ b.banAlt }</td>
	                  <td align="left"><a href="#" class="banner1">${ b.banName }</a></td>
	                  <td align="center">
	                  <button type="button" name="banOpen" data-open="${b.banOpen}" data-id="${b.banNo}">${b.banOpen }</button>
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
					<c:url var="before" value="adminBanner.ad">
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
						<c:url var="pagination" value="adminBanner.ad">
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
					<c:url var="after" value="adminBanner.ad">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url>
					<button class="btn btn-light" onclick="location.href='${ after }'" id="afterBtn">&gt;</button>
				</c:if>
			</div>
         </div>
  	</div>
</body>
</html>