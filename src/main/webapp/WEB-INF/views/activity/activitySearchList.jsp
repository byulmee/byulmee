<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>별미_활동 검색 결과</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro&display=swap"
	  rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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

.show-keyword {
	margin: 80px;
	color: #676D71;
	text-align: left;
	margin: 30px auto;
	margin-top: 80px;
}

.show-keyword span{
	color: #FF6933;
}

.star-ul {
	margin: auto;
	margin-top: 30px;
	margin-bottom: 100px;
	width: 100%;
	display: flex;
	flex-direction: row;
	overflow: hidden;
	overflow-x: scroll;
}

.division {
	border-bottom: 1px solid silver;
	padding: 5px 0;
}

.star-li {
	width: 160px;
	height: 185px;
	margin-right: 30px;
	text-align: center;
	color: #464646;
}

.star-li span {
	margin-top: 5px;
}

.star-img-frame {
	width: 160px;
	height: 160px;
	border-radius: 70%;
	overflow: hidden;
}

.star-img-frame img{
	width: 100%;
	height: auto;
}

.result-not-found {
	margin: 50px auto;
	line-height: 50vh;
	height: 50vh;
}

.outer .result-not-found {
	text-align: center;
}

.sear-star-title {
	font-size: 1.2rem;
	padding: 10px 0;
	text-align: left;
	margin: auto;
	margin-top: 50px;
	color: #FFA500
}

.star-li {
	cursor: pointer;
	display: flex;
	flex-direction: column;
	align-item: space-around;
}
</style>
<body>
	
   <c:import url="../common/gnb.jsp" />

	<div class="outer">
		<div class="show-keyword">
			💬<span>"${keyword}"</span>에 대한 검색 결과 (${ (fn:length(starList)) +  (fn:length(actList))} 건)
		</div>
   
   	<!-- 검색 결과 1개 이상 존재 -->
	<c:if test="${fn:length(starList) > 0 }">
		<div class="sear-star-title">스타의 작업실 방문하기</div>
		<div class="division"></div>
		<ul class="star-ul">
			<c:forEach items="${ starList }" var="star">
				<li class="star-li">
					<input type="hidden" name="memId" value="${ star.memId }">
					<input type="hidden" name="memNo" value="${ star.memNo }">
					<c:if test="${fn:length(starImgList) > 0 }">
						<c:forEach var="i" items="${ starImgList }">
					         <c:choose>
					         	<c:when test="${ i.imgRefno eq star.memNo }">
						        	<div class="star-img-frame">
						        		<img src="${ pageContext.servletContext.contextPath }/resources/piUploadFiles/${ i.imgName }">
					         		</div>
					         	</c:when>
					    		<c:otherwise>
					    			<div class="star-img-frame">
										<img src="${ pageContext.servletContext.contextPath }/resources/images/myPage/basic.png">
									</div>
								</c:otherwise>
							</c:choose>
					    </c:forEach>
					</c:if>
					<span>${ star.memNickname }</span>
				</li>	
			</c:forEach>
		</ul>
	</c:if>
	
	<!-- 검색 결과 1개 이상 존재할  -->
	<c:if test="${fn:length(actList) > 0}">
		
		<div class="listMain" style="font-size: 20px; font-weight: bold;">
			<span style="color: orange;">활동 바로가기</span>
		</div>
	   	<div class="division"></div>
	
		<div id="searchArea" align="right">
		   <select id="searchCondition" name="searchCondition">
		      <option value="popularity">인기순</option>
		      <option value="newest" onclick="location.href='alist.ac?acId=1'">최신순</option>
		      <option value="price">가격순</option>
		      <option value="review">리뷰순</option>
		   </select>
		</div>
	
		<br>
	
		<c:forEach items="${ actList }" varStatus="status" var="val">
			<div class="rec-list" style="display: inline-block;">
				<ul class="list" style="list-style: none;">
					<c:if test="${status.index mod 5 eq 0}"> <!--  한 줄에 5개 리스트 생성 -->
		    			<li class="list-item item1" onclick="location.href='activityDetail.ac?acId=${val.actNo}'">
		      				<div class="img-frame">
								<img class="img-frame-con" src="${ pageContext.servletContext.contextPath }/resources/auploadFiles/${ val.image.imgName }" alt="${ val.actTitle }" width="210px;">
							</div> 
							<span>${val.memId}</span>
							<div class="list-cate">[
								<c:choose>
								  <c:when test="${ val.actCategory eq '0' }">액티비티</c:when>	
								  <c:when test="${ val.actCategory eq '1' }">리빙</c:when>
								  <c:when test="${ val.actCategory eq '2' }">건강/미용</c:when>
								  <c:when test="${ val.actCategory eq '3' }">힐링</c:when>
								  <c:when test="${ val.actCategory eq '4' }">푸드</c:when>
								  <c:when test="${ val.actCategory eq '5' }">커리어</c:when>					
								</c:choose>]&nbsp;${ val.actTitle }</div>
		    				<span class="list-price"><i class="fas fa-receipt"></i>${val.actPrice}원</span><br>
		    				<span class="list-social">⭐️${ val.actRating } ${ val.actReviewCnt }개의 평가</span>
						</li>
					</c:if>
					
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
						<!-- [이전] -->
						<c:if test="${ pi.currentPage <= 1 }">[이전] &nbsp;</c:if>
						<c:if test="${ pi.currentPage > 1 }">
						   <c:url var="before" value="alist.ac">
						      <c:param name="page" value="${ pi.currentPage - 1 }" />
						   </c:url>
						   <a href="${ before }">[이전]</a> &nbsp;
						</c:if> 
						<!-- 페이지 -->
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
			                	<font color="red" size="4"><b>[${ p }]</b></font>
			                </c:if>
			                
							<c:if test="${ p ne pi.currentPage }">
								<c:url var="pagination" value="alist.ac">
								   <c:param name="page" value="${ p }" />
								</c:url>
								<a href="${ pagination }">${ p }</a> &nbsp;
							</c:if>
						</c:forEach>
						<!-- [다음] -->
						<c:if test="${ pi.currentPage >= pi.maxPage }">[다음]</c:if>
						<c:if test="${ pi.currentPage < pi.maxPage }">
		                  <c:url var="after" value="alist.ac">
		                     <c:param name="page" value="${ pi.currentPage + 1 }" />
		                  </c:url>
		                  <a href="${ after }">[다음]</a>
		               </c:if>
		            </td>
		         </tr>
		      </table>
		   </div>
	   </c:if>
	   
		<!-- 검색 결과 1개 이상 존재할  -->
		<c:if test="${(fn:length(actList) <= 0) && (fn:length(starList) <= 0)}">
			<div class="result-not-found">검색 결과가 없습니다.</div>
		</c:if>
	</div>
	
	<c:import url="../common/footer.jsp" />
	<script>
		$('.star-ul').on('click','li', function(event){
			console.log(event.currentTarget);
			event.preventDefault();
			
			let memId = event.currentTarget.childNodes[1].value;
			let memNo = event.currentTarget.childNodes[3].value;
			
			const loginUser = '${ sessionScope.loginUser }';
			console.log(loginUser);
			if(loginUser !== '') {
				location.href='acWorkRoomMain.wr?memId='+ memId +'&memNo=' + memNo;
			} else {
				alert('로그인 후에 이용할 수 있습니다.');
				location.href='loginView.me';
			}
		});
	</script>
</body>
</html>