<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
    <link rel="stylesheet" href="resources/css/common/cssReset.css">
    <link rel="stylesheet" href="resources/css/member/login.css">
    <script src="https://kit.fontawesome.com/34238d14b4.js" crossorigin="anonymous"></script>
</head>
<body>
	<c:import url="../common/gnb.jsp"/>
	
    <form id="login" action="#" autocomplete="off">
        <h1 class="title">아이디 찾기</h1>
        <hr>
        <ul id="login-frame">
            <li id="find-opt">
                <div>
                    <div class="radio">
                        <input type="radio" id="findOpt1" name="findOpt" value="phone">
                        <label for="findOpt1">휴대전화</label>
                    </div>
                    <div class="radio">
                        <input type="radio" id="findOpt2" name="findOpt" value="email">
                        <label for="findOpt2">이메일</label>
                    </div>
                </div>
            </li>
            <li>
                <label>이름 입력</label>
                <input type="text" name="pwd" required autocomplete="nofill">
                <span class="hint strong">이름을 입력해주세요.</span>
            </li>
            <li>
                <label>휴대전화 번호 입력</label>
                <input type="text" name="pwd" required autocomplete="nofill">
            </li>
            <li>
                <label>이메일 입력</label>
                <input type="text" name="pwd" required autocomplete="nofill">
            </li>
            <li>
                <button type="submit" class="submit-btn id">아이디 찾기</button>
            </li>
        </ul>
    </form>
</body>
</html>