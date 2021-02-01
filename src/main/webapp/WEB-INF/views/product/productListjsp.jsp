<%@page import="com.kh.byulmee.product.model.vo.Product"%>
<%@page import="com.kh.byulmee.product.model.dao.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
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
	
	
	float: right;
}
nav ul li a:hover {
	color: black;
}

h4{
	color: orange;
}

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
   #tb tr td{padding: 5px;}
   #buttonTab{border-left: hidden; border-right: hidden;}
   
   
</style>
<body>
 
	
   <c:import url="../common/gnb.jsp" />

   <div class="outer">
      <div class="listMain" style="font-size: 20px; font-weight: bold;">
         <span style="color: orange;">별</span>난취<span style="color: orange;">미</span> 리스트
      </div>
      <br>
      <table>
         <tr>
            <th style="background-color: #eeeeee;"
               width="490px;"></th>
            <th style="background-color: orange;"
               width="300px;"></th>
            <th style="background-color: #eeeeee;"
               width="490px;"></th>
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
      <br>
      <%
      ProductDAO productDAO = new ProductDAO();   
   %>
 	
         <c:forEach items="${ list }" varStatus="status" var="val">
      <div class="rec-list" style="display: inline-block;">
            <ul class="list" style="list-style: none;">
            	<c:if test="${status.index mod 5 eq 0}">
			    </c:if>
               <li class="list-item item1" onclick="location.href='productDetail.ac?pdId=${val.proNo }'">
                  <div class="img-frame">
                     <img class="list-thumb" src="resources/images/common/test.png"
                        alt="zz" width="210px;">
                  </div> <span>${val.memId }</span>
                  <div class="list-cate">[${val.proCategory }]&nbsp;${val.proTitle }</div>
                  <span class="list-price"><i class="fas fa-receipt"></i>${val.proPrice }원</span><br>
                  <span class="list-social">⭐️4.9 9999개의 평가</span>
               </li>
               <c:if test="${(status.index + 1) mod 5 eq 0}">
            </ul>
            </c:if>
    	  </div>
         </c:forEach>
		<br><br>
		



      <!-- 페이징 처리 -->
      <div id="paging" align="center">
         <table>
            <tr height="20" id="buttonTab">
               <td>
                  <!-- [이전] --> <c:if test="${ pi.currentPage <= 1 }">
               [이전] &nbsp;
            </c:if> <c:if test="${ pi.currentPage > 1 }">
                     <c:url var="before" value="plist.ac">
                        <c:param name="page" value="${ pi.currentPage - 1 }" />
                     </c:url>
                     <a href="${ before }">[이전]</a> &nbsp;
            </c:if> <!-- 페이지 --> <c:forEach var="p" begin="${ pi.startPage }"
                     end="${ pi.endPage }">
                     <c:if test="${ p eq pi.currentPage }">
                        <font color="red" size="4"><b>[${ p }]</b></font>
                     </c:if>

                     <c:if test="${ p ne pi.currentPage }">
                        <c:url var="pagination" value="plist.ac">
                           <c:param name="page" value="${ p }" />
                        </c:url>
                        <a href="${ pagination }">${ p }</a> &nbsp;
               </c:if>
                  </c:forEach> <!-- [다음] --> <c:if test="${ pi.currentPage >= pi.maxPage }">
               [다음]
            </c:if> <c:if test="${ pi.currentPage < pi.maxPage }">
                     <c:url var="after" value="plist.ac">
                        <c:param name="page" value="${ pi.currentPage + 1 }" />
                     </c:url>
                     <a href="${ after }">[다음]</a>
                  </c:if>
               </td>
            </tr>
         </table>
      </div>
   </div>



   <c:import url="../common/footer.jsp" />
   <br>
   <br>

	

</body>
</html>