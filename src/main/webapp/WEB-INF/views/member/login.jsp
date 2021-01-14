<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>별미 로그인하기</title>
    <link rel="stylesheet" href="resources/css/common/cssReset.css">
    <link rel="stylesheet" href="resources/css/member/login.css">
    <script src="https://kit.fontawesome.com/34238d14b4.js" crossorigin="anonymous"></script>
    <script src="resources/js/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
</head>
<body>
	<c:import url="../common/gnb.jsp"/>
	
    <form id="login" action="login.me" method="post" autocomplete="off">
        <h1 class="title">별미 방문을 환영합니다!</h1>
        <hr>
        <ul id="login-frame">
            <li>
                <label>아이디</label>
                <input type="text" name="memId" autocomplete="off" required>
                <span class="hint strong"></span>
            </li>
            <li>
                <label>비밀번호</label>
                <input type="password" name="memPwd" required autocomplete="nofill">
                <span class="hint strong"></span>
            </li>
            <li id="find-section">
                <div>
                    <span class="btn" onclick="location.href='findIdView.me'">아이디 찾기</span> ￨ <span class="btn"  onclick="location.href='findPwdView.me'">비밀번호 찾기</span>
                </div>
            </li>
            <li>
                <button type="submit" class="submit-btn">로그인</button>
                <button type="button" class="submit-btn kakao"><i class="fas fa-comment"></i>카카오로 시작하기</button>
                <button type="button" class="submit-btn fb"><i class="fab fa-facebook" onclick="location.href='#'"></i>페이스북으로 시작하기</button>
            </li>
            <li>
                <span id="joinUs" onclick="location.href='joinUsView.me'">별미 회원이 아니신가요?</span>
            </li>
        </ul>
    </form>
    <script type="text/javascript">
	    history.pushState(null, null, location.href);
	    window.onpopstate = function () {
	        history.go(1);
		};
		$('button.kakao').click(function(){
			<c:set var="kClientId">
		    	<spring:eval expression="@keys['k.clientId']"/>
		    </c:set>
		    <c:set var="kRedirectUri">
	    		<spring:eval expression="@keys['k.redirectUri']"/>
	   		</c:set>
			
			const id = '<c:out value="${kClientId}"/>';
			const redirectUri = '<c:out value="${kRedirectUri}"/>';
			const requestUrl = 'https://kauth.kakao.com/oauth/authorize?client_id=' + id + '&redirect_uri='+ redirectUri + '&response_type=code';
			
			location.href=requestUrl;
		});
    </script>
</body>
</html>