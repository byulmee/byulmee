<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>404 Error</title>
	<link rel="stylesheet" href="resources/css/common/cssReset.css">
	<link rel="stylesheet" href="resources/css/common/errorPage.css">
</head>
<body>
    <div class="wrapper">
        <h1>Ooops!</h1>
        <c:if test="${ message eq null }">
        	<p>삭제되거나 없는 페이지입니다.<br>유효한 링크인지 다시 확인해주세요.</p>
        </c:if>
        <c:if test="${ message ne null }">
        	<p>${message}</p>
        </c:if>
        <div class="container">
            <button onclick="history.back()">이전 페이지 가기</button>
            <button onclick="location.href='home.do'">메인 페이지 가기</button>
        </div>
    </div>
</body>
</html>