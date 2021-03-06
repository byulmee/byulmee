<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- <link
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
	crossorigin="anonymous"></script> -->
</head>
<style>
@font-face {
   font-family: 'GmarketSansMedium';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
      format('woff');
   font-weight: normal;
   font-style: normal;
}

@font-face {
   font-family: 'GmarketSansBold';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff')
      format('woff');
   font-weight: normal;
   font-style: normal;
}

body {
   margin: 0 auto;
   font-family: 'GmarketSansMedium';
}

.outer {
   width: 1280px;
   min-height: auto;
   text-align:center; 
   position:relative; 
   margin:0 auto;
}

.listMain{
   margin-top: 50px;
}
 .list-cate {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        font-size: 0.8rem;
        padding: 0.2rem 0;
    }
</style>
<body>

   <c:import url="../common/gnbTypeB.jsp" />

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
 	
         <c:forEach items="${ list }" varStatus="status" var="val">
      <div class="rec-list" style="display: inline-block;">
            <ul class="list" style="list-style: none;">
            	<c:if test="${status.index mod 5 eq 0}">
			    </c:if>
               <li class="list-item item1"  onclick="location.href='productDetail.pd?pdId=${val.proNo }'">
                  <div class="img-frame">
                  <c:forEach var="i" items="${ ilist }">
							<c:if test="${ val.proNo eq i.imgRefno and i.imgLevel eq '0'}">
								<img class="img" src="${ pageContext.servletContext.contextPath }/resources/auploadFiles/${ i.imgName }" alt="zz" width="210px;">
							</c:if>
						</c:forEach>
          
                  </div> <span>${val.memId }</span>
                  <div class="list-cate">[<c:choose>
							<c:when test="${ val.proCategory eq '0' }">액티비티</c:when>	
							<c:when test="${ val.proCategory eq '1' }">리빙</c:when>
							<c:when test="${ val.proCategory eq '2' }">건강/미용</c:when>
							<c:when test="${ val.proCategory eq '3' }">힐링</c:when>
							<c:when test="${ val.proCategory eq '4' }">푸드</c:when>
							<c:when test="${ val.proCategory eq '5' }">커리어</c:when>					
						</c:choose>]&nbsp;${val.proTitle }</div>
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
                     <c:url var="before" value="plist.pd">
                        <c:param name="page" value="${ pi.currentPage - 1 }" />
                     </c:url>
                     <a href="${ before }">[이전]</a> &nbsp;
            </c:if> <!-- 페이지 --> <c:forEach var="p" begin="${ pi.startPage }"
                     end="${ pi.endPage }">
                     <c:if test="${ p eq pi.currentPage }">
                        <font color="red" size="4"><b>[${ p }]</b></font>
                     </c:if>

                     <c:if test="${ p ne pi.currentPage }">
                        <c:url var="pagination" value="plist.pd">
                           <c:param name="page" value="${ p }" />
                        </c:url>
                        <a href="${ pagination }">${ p }</a> &nbsp;
               </c:if>
                  </c:forEach> <!-- [다음] --> <c:if test="${ pi.currentPage >= pi.maxPage }">
               [다음]
            </c:if> <c:if test="${ pi.currentPage < pi.maxPage }">
                     <c:url var="after" value="plist.pd">
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