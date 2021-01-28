<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.byulmee.activity.model.dao.ActivityDAO"%>
<%@page import="com.kh.byulmee.activity.model.vo.Activity"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


    <%@ page import="java.sql.*" %>
    <%
    Activity activity = (Activity)request.getAttribute("activity");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'GmarketSansBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}


body{
	width: 1050px;
	margin: 0 auto;
	font-family: 'GmarketSansMedium';
}
	}
nav ul li {
	display: inline;	
	border-right: 1px solid pink;
	padding: 0px 5px;
	
	float: right;
}
nav ul li a:hover {
	color: black;
}

h4{
	color: orange;
}

#image:hover{transform: perspective(300px) translateZ(100px);}

#price{color: black;}

ul { 
  list-style: none;
  margin: 0;
  padding: 0;
} 

header, footer, nav, section, article, hgroup, figure {
  display: block; 
}
legend {
  display: none;
}
a {
  color: #808080;
  text-decoration: none;
}
a:hover{
  color: #e51837;
}
p {
  margin: 0 0 1em;
  font-size: 8px;
}

a img {
  border: 0;
  outline: 0;
}
#star{
	color: orange;
}

</style>
<body>
 
	<c:import url="../common/gnb.jsp"/>

<%--			
<nav>
	<ul>
		<li><a href=""><strong>로그인</strong></a></li>
		<li><a href=""><strong>마이페이지</strong></a></li>
		<li><a href=""><strong>고객센터</strong></a></li>
		<li id=""><a href=""><strong>별미마켓</strong></a></li>
	</ul>
</nav>
	<h1><strong>Byulmee</strong></h1>
	<form class="Serach">
				<input class="form-control mr-sm-2" type="search" placeholder="텃밭 가꾸기"
					aria-label="Search" id="Serach">
				<button onClick="search()"
					class="btn btn-primary" type="button">검색</button>
	</form>	
	--%>
	
	<div class=" "style="margin-left: 480px; font-size: 20px; font-weight: bold;">
	<span style="display: inline-block; text-align: center; color:orange;">별</span>난취<span style="color: orange;">미</span> 리스트
	</div>
	<br>
	
	<table>
					<tr>
						<th style = "background-color:#eeeeee; text-align:center;" width="830px;"></th>
						<th style = "background-color:#eeeeee; text-align:center;" width="530px;"></th>
						<th style = "background-color: orange; text-align:center;" width="300px;"></th>					
						<th style = "background-color:#eeeeee; text-align:center;" width="480px;"></th>
					</tr>			
	</table>
	
	<div id="searchArea" align="right">
		<select id="searchCondition" name="searchCondition">
			<option value="">인기순</option>
			<option value=""><a href="http://www.naver.com">최신순</a></option>
			<option value="">가격순</option>
			<option value="">리뷰순</option>
		</select>
	</div>
	<%
		ActivityDAO activityDAO = new ActivityDAO();
	
	%>
	 
		<div id="pattern" class="pattern"  onclick="location.href='activityDetail.ac?acId=1">
		
			<c:forEach items="${ list }" var="val" varStatus = "status">
				<ul>
				<c:if test="${status.index mod 5 eq 0}">
			    </c:if>			    	
			        <li style="float: left;">
			            <a href="#" class="inner">
			                <div class="image" style="width:180px;">
			                    <img src="${ pageContext.servletContext.contextPath }/resources/images/activity/텃밭.PNG"id="image"alt="텃밭" style="size: 20%;" />
			                    
			                </div>
			               <div class="li-text" onclick="location.href='activityDetail.ac?acId=1">
			                    <p>${val.memId }<br>
			                    [${val.actCategory}]${val.actTitle }<br>
			                    ${val.actPlace }<br>
			                    ${val.actStartday }~<br>${val.actEndday }<br>
			                     <img src="${ pageContext.servletContext.contextPath }" id="" alt="*"/><strong id="price">${val.actPrice }원</strong><br>
			                     
			                    <img src="./images/F_Star.PNG" id="" alt=""/><p id="star">****4.8 1891개의 평가</p>
			                </div>
			            </a>
			        </li>
			    <c:if test="${(status.index + 1) mod 5 eq 0}">
			    	</ul>
			    </c:if>
		    </c:forEach>
		
		
		<!-- 
		<c:forEach items="${ list }" var="val">
			<c:if test="${ !empty list }">
				${val.actNo }
				${val.memId }
				${val.actPhone }
			
			</c:if>
		</c:forEach>
	 -->
          
 



			
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
<%-- 				<c:forEach items="${ list }" var="val"> --%>
<!-- 			      <br> -->
<!-- 			      <br> -->
<!-- 			      <br> -->
<!-- 			      <br> -->
<%-- 			   </c:forEach> --%>
<%-- 			   <c:if test="${ empty list }"> --%>
<%-- 			      ${ "데이터가 존재하지 않습니다. "} --%>
<%-- 			   </c:if> --%>
			   
<%-- 	<c:choose> --%>
<%-- 		<c:when test="${ empty list }"> --%>
<%-- 			${ "데이터가 존재하지 않습니다. "} --%>
<%-- 		</c:when> --%>
<%-- 		<c:otherwise> --%>
<%-- 			<c:forEach items="${ list }" var="list"> --%>
<%-- 				<c:if test="${ !empty loginUser }"> --%>
<%-- 				<c:out value="${list.memId }"></c:out><br> --%>
<%-- 				<c:out value="${list.actTitle }"></c:out><br> --%>
<%-- 				<c:out value="${list.actPrice }"></c:out><br>								 --%>
<%-- 				</c:if> --%>
<%-- 			</c:forEach> --%>
<%-- 		</c:otherwise> --%>
<%-- 	</c:choose> --%>
	
	<c:import url="../common/footer.jsp"/><br><Br>
	

</body>
</html>