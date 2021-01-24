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
</head>
<body>
	<c:import url="../common/gnb.jsp"/>
	
    <form id="login" action="#" autocomplete="off" style="position: reletive">
        <h1 class="title">아이디 찾기</h1>
        <hr>
        <ul id="login-frame">
            <li id="find-opt">
				<div class="wrap">
					<input type="radio" name="findOpt" id="radio0" class="checkbox">
					<label for="radio0" class="input-label radio">휴대폰번호</label>
					<input type="radio" name="findOpt" id="radio1" class="checkbox">
					<label for="radio1" class="input-label radio">이메일</label>
				</div>
            </li>
            <li>
                <label for="name">이름 입력</label>
                <input type="text" name="memName" required autocomplete="off">
                <span id="memName-error" class="hint strong"></span>
            </li>
            <li id="opt-input-area">
                <label for="memInfo" class="opt-input-title">휴대전화 번호 입력</label>
                <input type="text" name="memInfo" class="memPhone" required autocomplete="off">
                <span id="memInfo-error" class="hint strong"></span>
            </li>
            <li>
                <button type="button" class="submit-btn id">아이디 찾기</button>
            </li>
        </ul>
    </form>
    
    <div id="my_modal" style="display: none;">
    	<p class="modal-message"></p>
	    <a class="modal_close_btn" style="display: block; text-align:right; padding-top: 1rem; cursor: pointer;">닫기</a>
	</div>
	<script type="text/javascript" src="resources/js/member/findId.js"></script>
</body>
</html>