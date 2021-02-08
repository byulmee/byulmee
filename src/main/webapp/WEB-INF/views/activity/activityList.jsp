<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link
   href="https://fonts.googleapis.com/css?family=Source+Sans+Pro&display=swap"
   rel="stylesheet" />
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

ul, li {
	cursor: pointer;
	list-style: none;
    padding-left: 0px;
}

body {
	padding: 0;
	margin: 0;
	font-family: 'GmarketSansMedium';
}

div {
	box-sizing: border-box;
}

.outer {
   max-width: 1050px;
   min-width: 750px;
   width: 80%;
   margin: 0 auto;
}

.listMain{
   margin-top: 80px;
}

.list {
	width: 150px;
	text-align: inline;
	margin-right: 15px;
}

.list .img-frame {
	whidth: 100%;
	height: 155px;
}

.img-frame img {
	width: auto;
	height: 100%;
}

.list-item {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	width: 100%;
	margin 20px;
}

.list-item:last-child {
	margin-right: 0;
}

.img-frame-con{
	width: 100%;
	height: 100%;
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
            <option value="popularity" class="popularity">인기순</option>
            <option value="newest">최신순</option>
            <option value="price">가격순</option>
            <option value="review">리뷰순</option>
         </select>
      </div>
      
      <br>
    
        <c:forEach items="${ list }" varStatus="status" var="val">
         <div class="rec-list" style="display: inline-block;">
            <ul class="list" style="list-style: none;">
               <c:if test="${status.index mod 5 eq 0}">
             </c:if>
               <li class="list-item item1" onclick="location.href='activityDetail.ac?acId=${val.actNo }'">
                  <div class="img-frame">
                  <c:forEach var="i" items="${ ilist }">
                     <c:if test="${ val.actNo eq i.imgRefno and i.imgLevel eq '0'}">
                        <img class="img" src="${ pageContext.servletContext.contextPath }/resources/auploadFiles/${ i.imgName }" alt="이미지" width="210px;">
                     </c:if>
                  </c:forEach>          
                  </div> 
                  <span>[${val.actReviewCnt }] ${val.memId }</span>
                  <div class="list-cate">[<c:choose>
                     <c:when test="${ val.actCategory eq '0' }">액티비티</c:when>   
                     <c:when test="${ val.actCategory eq '1' }">리빙</c:when>
                     <c:when test="${ val.actCategory eq '2' }">건강/미용</c:when>
                     <c:when test="${ val.actCategory eq '3' }">힐링</c:when>
                     <c:when test="${ val.actCategory eq '4' }">푸드</c:when>
                     <c:when test="${ val.actCategory eq '5' }">커리어</c:when>               
                  </c:choose>]&nbsp;${val.actTitle }</div>
                  <span class="list-price"><i class="fas fa-receipt"></i>${val.actPrice }원</span><br>
                  <span class="list-social">${val.actRating }</span>
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
            </c:if> 
            <c:if test="${ pi.currentPage > 1 }">
                     <c:url var="before" value="alist.ac">
                        <c:param name="actCategory" value="${ actCategory }"/>
                        <c:param name="page" value="${ pi.currentPage - 1 }" />
                     </c:url>
                     <a href="${ before }">[이전]</a> &nbsp;
            </c:if> <!-- 페이지 --> <c:forEach var="p" begin="${ pi.startPage }"
                     end="${ pi.endPage }">
                     <c:if test="${ p eq pi.currentPage }">
                        <font color="red" size="4"><b>[${ p }]</b></font>
                     </c:if>
                     <c:if test="${ p ne pi.currentPage }">
                        <c:url var="pagination" value="alist.ac">
                        <c:param name="actCategory" value="${ actCategory }"/>
                           <c:param name="page" value="${ p }" />
                        </c:url>
                        <a href="${ pagination }">${ p }</a> &nbsp;
               </c:if>
                  </c:forEach> <!-- [다음] --> <c:if test="${ pi.currentPage >= pi.maxPage }">
               [다음]
            </c:if> <c:if test="${ pi.currentPage < pi.maxPage }">
                     <c:url var="after" value="alist.ac">
                     <c:param name="actCategory" value="${ actCategory }"/>
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
   
   <script>
   $(document).ready(function(){
      $('#searchArea option:checked').click(function(){
         
         })
         
      });
      /*  var text = $("#searchArea option:checked").text();
         if(text == ){
            location.href='alistarray.ac';
            }
         
 */
      
   </script>
</body>
   
   
</html>