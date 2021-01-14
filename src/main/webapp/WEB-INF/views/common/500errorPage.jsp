<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>500 Error</title>
	<link rel="stylesheet" href="resources/css/common/cssReset.css">
	<link rel="stylesheet" href="resources/css/common/errorPage.css">
</head>
<body>
    <div class="wrapper">
        <h1>Ooops!</h1>
        	<p>서버 내부 오류가 발생했습니다.<br>오류가 지속되면 관리자에게 문의해주세요.</p>
        <div class="container">
            <button onclick="history.back()">이전 페이지 가기</button>
            <button onclick="location.href='home.do'">메인 페이지 가기</button>
        </div>
    </div>
</body>
</html>