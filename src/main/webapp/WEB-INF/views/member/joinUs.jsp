<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="resources/css/common/cssReset.css">
    <link rel="stylesheet" href="resources/css/member/joinUs.css">
    <script type="text/javascript" src="https://kit.fontawesome.com/34238d14b4.js" crossorigin="anonymous"></script>
   	<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js"></script>
   	<script type="text/javascript" src="resources/js/member/jquery.validate.min.js"></script>
   	<script type="text/javascript" src="resources/js/member/joinUs.js"></script>
    <script type="text/javascript" src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>

    <form id="join" action="joinUs.me" autocomplete="off" method="post"> 
        <h1 class="title">별미 회원가입</h1>
        <hr>
        <ul id="join-frame">
            <li>
                <label>아이디</label>
                <span class="hint">아이디는 최소 4자~20자 이내여야 하고,<br>영문자, 숫자, 특수문자(-, _)의 조합만 가능합니다.</span>
                    <input type="text" name="memId" autocomplete="off" required>
                    <span class="hint strong"></span>
            </li>
            <li>
                <label>비밀번호</label>
                <span class="hint">비밀번호는 8자~15자 이내여야 하고,<br>영문자, 특수문자, 숫자가 반드시 하나 이상 포함되어야 합니다.</span>
                <input type="password" name="memPwd" required autocomplete="nofill">
                <input type="password" name="pwdCheck"  required autocomplete="nofill">
            </li>
            <li>
                <label>이름</label>
                <input type="text" name="memName" autocomplete="my-name" required>
            </li>
            <li>
                <label>주소</label>
                <span class="hint">"주소 검색"을 눌러 주소를 등록해주세요.</span>
                <div class="item-with-addrBtn">
                    <input type="text" name="memPostcode" id="postcode" placeholder="우편번호" autocomplete="nofill">
                    <button type="button" id="searchAddr" onclick="getAddress();"><i class="far fa-map"></i>주소검색</button>
                </div>
                <input type="text" name="memBasicAddr" id="address" autocomplete="nofill" placeholder="주소(자동입력)" readonly>
                <input type="text" name="memDetailAddr" id="detailAddress" autocomplete="nofill" placeholder="상세 주소">
            </li>
            <li>
                <label>휴대전화</label>
                <span class="hint">연락처를 등록하려면 인증이 필요합니다.<br>"인증하기"를 눌러 확인해주세요.</span>
                <div class="item-with-btn">
                    <input type="text" name="memePhone" autocomplete="nofill">
                    <button type="button" class="confirm-btn">인증하기</button>
                </div>
            </li>
            <li>
                <label>닉네임</label>
                <input type="text" name="memNickname" autocomplete="nofill">
            </li>
            <li>
                <label>이메일</label>
                <input type="email" name="memEmail" autocomplete="off">
                <span class="hint strong">이미 사용 중인 이메일입니다.</span>
            </li>
            <li>
                <button type="submit" class="submit-btn">회원가입</button>
            </li>
        </ul>
    </form>
</body>
</html>