<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.kh.byulmee.member.model.vo.Member" %>
<% Member m = (Member)session.getAttribute("loginUser");
	System.out.println(m); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="keywords" content="Byulmee, 취미, 활동, 매칭, 플리마켓">
<meta name="description" content="세상의 별난 취미 다 모여라! 취미 매칭 플랫폼 별미">
<meta name="author" content="javaBom">
<meta name="application-name" content="별미">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>별난취미_별미</title>
<link rel="stylesheet" href="resources/css/common/cssReset.css">
<link rel="stylesheet" href="resources/css/common/main.css">
<script src="https://kit.fontawesome.com/34238d14b4.js" crossorigin="anonymous"></script>
</head>
<body>
    <!-- 배너 이미지가 있을 경우, #bam의 display:nonel;속성값 제거-->
    <section id="ban">
        <img class="ban-img" onerror="this.style.display='none'" src="#"  alt="배너 영역">
    </section>

    <nav id="gnb">
        <div id="gnb-menu">
            <img src="resources/images/common/logo.png" id="home-logo" alt="별난취미_별미" onclick="location.href='home.do'">
            <ul id="menu-list">
            <c:if test="${ empty sessionScope.loginUser }">
                <li onclick="location.href='loginView.me'">로그인</li>
            </c:if>
            <c:if test="${ !empty sessionScope.loginUser }">
                <li onclick="location.href='logout.me'">로그아웃</li>
                <li onclick="location.href='myPurView.me'">마이페이지</li>
            </c:if>
                <li onclick="location.href='QnAView.bo'">고객센터</li>
                <li><img src="resources/images/common/marketlogo.png" id="mk-logo" alt="별미마켓"></li>
            </ul>
        </div>

        <div id="gnb-cate">
            <h2><span class="strong">별난취미,</span> 뭐 없을까?</h2>
            <div id="searchBox">
                <input id="searchBar" name="search" type="text" placeholder="텃밭 가꾸기"><i class="fas fa-search"></i>
            </div>
            <ul id="cate">
                <li class="cate act">
                    <i class="fas fa-running"></i><br><span class="cate-name">액티비티</span>
                </li>
                <li class="cate liv">
                    <i class="fas fa-chair"></i><br><span class="cate-name">리빙</span>
                </li>
                <li class="cate bea">
                    <i class="fas fa-spray-can"></i><br><span class="cate-name">건강/미용</span>
                </li>
                <li class="cate hel">
                    <i class="fas fa-heartbeat"></i><br><span class="cate-name">힐링</span>
                </li>
                <li class="cate fod">
                    <i class="fas fa-utensils"></i><br><span class="cate-name">푸드</span>
                </li>
                <li class="cate cur">
                    <i class="fas fa-laptop"></i><br><span class="cate-name">커리어</span>
                </li>
            </ul>
        </div>
    </nav>

    <!-----------------------추천 영역=--------------------->
	    <div class="rec-top">
	        <div class="rec-title">이번주 핫한 별미</div>
	        <div class="rec-top-divider1">
	            <hr class="rec-top-divider2"></hr>
   	 		</div>
   	 	</div>
	
	    <div class="rec-list">
	        <ul class="list">
	            <li class="list-item item1">
	                <img class="list-thumb"src="resources/images/common/test.png" alt="">
	                <span>nickName</span>
	                <div class="list-cate">[카테고리]제목제목너무길어무길어</div>
	                <span class="list-price"><i class="fas fa-receipt"></i>50,000원</span>
	                <span class="list-social">⭐️4.9 9999개의 평가</span>
	            </li>
	            <li class="list-item item2">
	                <img class="list-thumb"src="resources/images/common/test.png" alt="">
	                <span>nickName</span>
	                <div class="list-cate">예쁜텃밭가꿔요첫텃밭
	                </div>
	                <span class="list-price"><i class="fas fa-receipt"></i>50,000원</span>
	                <span class="list-social">⭐️4.9 9999개의 평가</span>
	            </li>
	            <li class="list-item item3">
	                <img class="list-thumb"src="resources/images/common/test.png" alt="">
	                <span>nickName</span>
	                <div class="list-cate">[카테고리]제목제목</div>
	                <span class="list-price"><i class="fas fa-receipt"></i>50,000원</span>
	                <span class="list-social">⭐️4.9 9999개의 평가</span>
	            </li>
	            <li class="list-item item4">
	                <img class="list-thumb"src="resources/images/common/test.png" alt="">
	                <span>nickName</span>
	                <div class="list-cate">[카테고리]제목제목제목제목멪곰제곰제</div>
	                <span class="list-price"><i class="fas fa-receipt"></i>50,000원</span>
	                <span class="list-social">⭐️4.9 9999개의 평가</span>
	            </li>
	            <li class="list-item item5">
	                <img class="list-thumb"src="resources/images/common/test.png" alt="">
	                <span>nickName</span>
	                <div class="list-cate">[카테고리]제목제목</div>
	                <span class="list-price"><i class="fas fa-receipt"></i>50,000원</span>
	                <span class="list-social">⭐️4.9 9999개의 평가</span>
	            </li>
	        </ul>
	    </div>
	
		
	    <div class="rec-top">
	        <div class="rec-title">마감일 임박 별미</div>
	        <div class="rec-top-divider1">
	            <hr class="rec-top-divider2"></hr>
	        </div>
	    </div>
	
	    <div class="rec-list">
	        <ul class="list">
	            <li class="list-item item1">
	                <img class="list-thumb"src="resources/images/common/test.png" alt="">
	                <span>nickName</span>
	                <div class="list-cate">[카테고리]제목제목</div>
	                <span class="list-price"><i class="fas fa-receipt"></i>50,000원</span>
	                <span class="list-social">⭐4.9 9999개의 평가</span>
	            </li>
	            <li class="list-item item2">
	                <img class="list-thumb"src="resources/images/common/test.png" alt="">
	                <span>nickName</span>
	                <div class="list-cate">[카테고리]제목제목</div>
	                <span class="list-price"><i class="fas fa-receipt"></i>50,000원</span>
	                <span class="list-social">⭐️4.9 9999개의 평가</span>
	            </li>
	            <li class="list-item item3">
	                <img class="list-thumb"src="resources/images/common/test.png" alt="">
	                <span>nickName</span>
	                <div class="list-cate">[카테고리]제목제목</div>
	                <span class="list-price"><i class="fas fa-receipt"></i>50,000원</span>
	                <span class="list-social">⭐️4.9 9999개의 평가</span>
	            </li>
	            <li class="list-item item4">
	                <img class="list-thumb"src="resources/images/common/test.png" alt="">
	                <span>nickName</span>
	                <div class="list-cate">[카테고리]</div>
	                <span class="list-price"><i class="fas fa-receipt"></i>50,000원</span>
	                <span class="list-social">⭐️4.9 9999개의 평가</span>
	            </li>
	            <li class="list-item item5">
	                <img class="list-thumb"src="resources/images/common/test.png" alt="">
	                <span>nickName</span>
	                <div class="list-cate">[카테고리]제목제목</div>
	                <span class="list-price"><i class="fas fa-receipt"></i>50,000원</span>
	                <span class="list-social">⭐️4.9 9999개의 평가</span>
	            </li>
	        </ul>
	    </div>
	
	
	    <div class="rec-top">
	        <div class="rec-title">플리마켓 인기상품</div>
	        <div class="rec-top-divider1">
	            <hr class="rec-top-divider2"></hr>
	        </div>
	    </div>
	
	    <div class="rec-list last">
	        <ul class="list">
	            <li class="list-item item1">
	                <img class="list-thumb"src="resources/images/common/test.png" alt="">
	                <span>nickName</span>
	                <div class="list-cate">[카테고리]제목제목</div>
	                <span class="list-price"><i class="fas fa-receipt"></i>50,000원</span>
	                <span class="list-social">⭐️4.9 9999개의 평가</span>
	            </li>
	            <li class="list-item item2">
	                <img class="list-thumb"src="resources/images/common/test.png" alt="">
	                <span>nickName</span>
	                <div class="list-cate">[카테고리]제목제목</div>
	                <span class="list-price"><i class="fas fa-receipt"></i>50,000원</span>
	                <span class="list-social">⭐️4.9 9999개의 평가</span>
	            </li>
	            <li class="list-item item3">
	                <img class="list-thumb"src="resources/images/common/test.png" alt="">
	                <span>nickName</span>
	                <div class="list-cate">[카테고리]제목제목</div>
	                <span class="list-price"><i class="fas fa-receipt"></i>50,000원</span>
	                <span class="list-social">⭐️4.9 9999개의 평가</span>
	            </li>
	            <li class="list-item item4">
	                <img class="list-thumb"src="resources/images/common/test.png" alt="">
	                <span>nickName</span>
	                 <div class="list-cate">[카테고리]제목제목</div>
	                <span class="list-price"><i class="fas fa-receipt"></i>50,000원</span>
	                <span class="list-social">⭐️4.9 9999개의 평가</span>
	            </li>
	            <li class="list-item item5">
	                <img class="list-thumb"src="resources/images/common/test.png" alt="">
	                <span>nickName</span>
	                <div class="list-cate">[카테고리]제목제목</div>
	                <span class="list-price"><i class="fas fa-receipt"></i>50,000원</span>
	                <span class="list-social">⭐️4.9 9999개의 평가</span>
	            </li>
	        </ul>
	    </div>
	    
	    <c:import url="views/common/footer.jsp"/>
</body>
</html>