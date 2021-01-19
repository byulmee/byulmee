<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        	<c:if test="${!empty sessionScope.oauthInfo}">
       			<li style="padding-top: 0;">
       				<p style="color: #FF6833; font-size: 0.8rem; margin: auto;">간편 로그인으로 최초 로그인 시 회원 가입이 필요합니다.</p>
        		</li>
        	</c:if>
            <li>
                <label>아이디</label>
                <span class="hint">아이디는 최소 4자~20자 이내여야 하고,<br>영문자, 숫자, 특수문자(-, _)의 조합만 가능합니다.</span>
                    <c:if test="${!empty sessionScope.oauthInfo}">
                    <c:set var="id" value="${oauthInfo.getMemId()}"/>
                    	<input type="text" name="memId" autocomplete="off" value="${oauthInfo.getMemId()}" readonly>
                    	<c:choose>
                    		<c:when test="${fn:contains(id, 'bmk')}">
                    			<input type="hidden" name="memLoginType" value="K">
                    		</c:when>
                    		<c:otherwise>
                    			<input type="hidden" name="memLoginType" value="O">
                    		</c:otherwise>
                    	</c:choose>
                    </c:if>
                    <c:if test="${empty sessionScope.oauthInfo}">
	                    <input type="text" name="memId" autocomplete="off" required>
	                    <input type="hidden" name="memLoginType" value="B">
                    </c:if>
            </li>
            <li>
                <label>비밀번호</label>
                <span class="hint">비밀번호는 8자~20자 이내여야 하고,<br>영문자, 특수문자, 숫자가 반드시 하나 이상 포함되어야 합니다.</span>
                <input type="password" name="memPwd" id="memPwd" required autocomplete="nofill">
                <input type="password" name="pwdCheck" id="pwdCheck" required autocomplete="nofill">
            </li>
            <li>
                <label>이름</label>
                <input type="text" name="memName" autocomplete="my-name" required>
            </li>
            <li>
                <label>주소</label>
                <span class="hint">"주소 검색"을 눌러 주소를 등록해주세요.</span>
                <div class="item-with-addrBtn">
                    <input type="text" name="memPostcode" id="postcode" placeholder="우편번호" autocomplete="nofill" readonly>
                    <button type="button" id="searchAddr" onclick="getAddress();"><i class="far fa-map"></i>주소검색</button>
                </div>
                <label id="postcode-error" class="error" for="postcode"></label>
                <input type="text" name="memBasicAddr" id="address" autocomplete="nofill" placeholder="주소(자동입력)" readonly>
                <input type="text" name="memDetailAddr" id="detailAddress" autocomplete="nofill" placeholder="상세 주소">
            </li>
            <li>
                <label>휴대전화</label>
                <span class="hint">휴대전화 인증이 필요합니다.<br>"인증하기"를 눌러 인증코드를 확인  입력해주세요.</span>
                <div class="item-with-btn">
                    <input type="text" name="memPhone" autocomplete="nofill">
                    <button type="button" class="sendCode">인증하기</button>
                </div>
                <div class="item-with-btn test" style="display: none;">
                    <input type="text" name="confirmCode" id="confirmCode" autocomplete="nofill">
                    <button type="button" class="confirm-btn">확인</button>
                </div>
                <label id="memPhone-error" class="error" for="memPhone"></label>
                <label id="memPhone-status-error" class="status hint" for="memPhone"></label>
                <label id="memPhone-status" class="status hint" for="memPhone"></label>
            </li>
            <li>
                <label>닉네임</label>
                <input type="text" name="memNickname" autocomplete="nofill">
            </li>
            <li>
                <label>이메일</label>
                <c:if test="${!empty sessionScope.oauthInfo}">
                	<input type="email" name="memEmail" value="${oauthInfo.getMemEmail()}">
                </c:if>
                 <c:if test="${empty sessionScope.oauthInfo}">
                	<input type="email" name="memEmail" autocomplete="off">
                </c:if>
            </li>
            <li>
                <button type="submit" class="submit-btn">회원가입</button>
            </li>
        </ul>
    </form>
  <script type="text/javascript" src="resources/js/member/joinUs.js"></script>
</body>
</html>