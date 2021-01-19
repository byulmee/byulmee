<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" href="resources/css/common/cssReset.css">
    <link rel="stylesheet" href="resources/css/member/login.css">
    <script src="https://kit.fontawesome.com/34238d14b4.js" crossorigin="anonymous"></script>
</head>
<body>
	<c:import url="../common/gnb.jsp" />
	
    <form id="login" action="#" autocomplete="off">
        <h1 class="title">비밀번호 찾기</h1>
        <hr>
        <ul id="login-frame">
            <li id="find-opt">
				<div class="wrap">
					<input type="radio" name="findOpt" id="radio0" class="checkbox">
					<label for="radio0" class="input-label radio">휴대전화 인증</label>
					<input type="radio" name="findOpt" id="radio1" class="checkbox">
					<label for="radio1" class="input-label radio">이메일 인증</label>
				</div>
            </li>
            <li>
                <label>휴대전화</label>
                <span class="hint">"인증하기"를 눌러 확인해주세요.</span>
                <div class="item-with-btn">
                    <input type="text" name="phone" autocomplete="nofill" readonly>
                    <button class="confirm-btn">인증하기</button>
                </div>
                <div class="item-with-btn">
                    <input type="text" name="phone" autocomplete="nofill" readonly>
                    <button class="confirm-btn">확인</button>
                </div>
            </li>
            <li>
                <label>변경할 비밀번호 입력</label>
                <input type="password" name="pwd" required autocomplete="nofill">
                <span class="hint strong">비밀번호가 일치하지 않습니다.</span>
            </li>
            <li>
                <label>비밀번호 확인</label>
                <input type="password" name="pwd" required autocomplete="nofill">
            </li>
            <li>
                <button type="submit" class="submit-btn id">비밀번호 재설정</button>
            </li>
        </ul>
    </form>
    <script type="text/javascript" src="resources/js/member/findPwd.js"></script>
</body>
</html>