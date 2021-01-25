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
	
    <form id="login" autocomplete="off">
        <h1 class="title">비밀번호 찾기</h1>
        <hr>
        <ul id="login-frame">
            <li id="find-opt">
				<div class="wrap">
					<input type="radio" name="findOpt" id="radio0" class="checkbox">
					<label for="radio0" class="input-label radio">휴대전화 인증</label>
					<input type="radio" name="findOpt" id="radio1" class="checkbox" checked>
					<label for="radio1" class="input-label radio">이메일 인증</label>
				</div>
            </li>
            <li>
                <label>아이디 입력</label>
                <input type="text" name="memId" autocomplete="off">
                <label for="memId" class="hint strong"></label>
            </li>
            <li>
                <label id="opt-title">이메일 주소</label>
                <span class="hint">"인증번호 발송"을 눌러 인증번호를 확인해주세요.</span>
                <div class="item-with-btn info-input-box">
                    <input type="text" name="memInfo" autocomplete="off">
                    <button type="button" class="confirm-btn send">인증번호 발송</button>
                </div>
                <label for="memInfo" class="hint strong"></label>
                <div class="item-with-btn valCode-input-box" style="display:none;">
                    <input type="text" name="valCode" autocomplete="off">
                    <button type="button" class="confirm-btn test">인증하기</button>
                </div>
                <span id="valCodeStatus" class="hint"></span>
                <label for="valCode" class="hint strong"></label>
            </li>
            <li id="input-pwd" style="display:none;">
                <label>새 비밀번호 입력</label>
                <input type="password" name="pwd" autocomplete="nofill">
                <label for="pwd" class="hint strong"></label>
            </li>
            <li id="input-pwd-check" style="display:none;">
                <label>비밀번호 확인</label>
                <input type="password" name="pwdCheck" autocomplete="nofill">
            	<label for="pwdCheck" class="hint strong"></label>
            </li>
            <li>
                <button type="button" class="submit-btn reset">비밀번호 재설정</button>
            </li>
        </ul>
    </form>
    <script type="text/javascript" src="resources/js/member/findPwd.js"></script>
</body>
</html>