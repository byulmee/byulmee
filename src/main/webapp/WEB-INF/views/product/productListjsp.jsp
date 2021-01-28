<%@ page import="com.kh.byulmee.product.model.vo.Product" %>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


    <%@ page import="java.sql.*" %>
    <%
    Product product = (Product)request.getAttribute("product");
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
</body>
</html>