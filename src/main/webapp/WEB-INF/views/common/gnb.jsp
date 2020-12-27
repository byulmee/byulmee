<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="keywords" content="Byulmee, 취미, 활동, 매칭, 플리마켓">
<meta name="description" content="세상의 별난 취미 다 모여라! 취미 매칭 플랫폼 별미">
<meta name="author" content="javaBom">
<meta name="application-name" content="별미">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>별난취미_별미</title>
<link rel="stylesheet" href="resources/css/common/cssReset.css">
<link rel="stylesheet" href="resources/css/common/gnb.css">
<script src="https://kit.fontawesome.com/34238d14b4.js" crossorigin="anonymous"></script>
</head>
<body>
    <nav id="gnb">
        <div id="gnb-menu">
            <div id="gnb-menu-box">
                <img src="resources/images/common/logo.png" id="home-logo" alt="byulmee logo" onclick="location.href='home.do'">
                <form id="searchBox">
                    <div>
                        <i class="fas fa-search"></i>
                    </div>
                    <input id="searchBar" name="search" type="text" placeholder="텃밭 가꾸기" onsubmit="location.href='search.bo'">
                </form>
            </div>
            <ul id="menu-list">
            	<c:if test="${ empty sessionScope.loginUser }">
            		<li class="menu-list-item" onclick="location.href='loginView.me'">로그인</li>
            	</c:if>
            	<c:if test="${ !empty sessionScope.loginUser }">
                	<li class="menu-list-item" onclick="location.href='logout.me'">로그아웃</li>
               		<li clss="menu-list-item" onclick="location.href='#">마이페이지</li>
                </c:if>
                <li class="menu-list-item" onclick="location.href='#">고객센터</li>
                <li class="menu-list-item" onclick="location.href='#"><img src="resources/images/common/marketlogo.png" id="mk-logo" alt="market logo"></li>
            </ul>
        </div>
        <div id="gnb-cate">
            <ul id="cate">
                <li class="cate act" onclick="location.href='#">액티비티</li>
                <li class="cate liv" onclick="location.href='#">리빙</li>
                <li class="cate bea" onclick="location.href='#">건강/미용</li>
                <li class="cate hel" onclick="location.href='#">힐링</li>
                <li class="cate fod" onclick="location.href='#">푸드</li>
                <li class="cate cur" onclick="location.href='#">커리어</li>
            </ul>
        </div>
    </nav>
</body>
</html>