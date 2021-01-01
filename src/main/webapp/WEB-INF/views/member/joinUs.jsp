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
                <span class="hint">아이디는 최소 4자~15자 이내여야 하고,<br>영문자, 숫자, 특수문자(-, _)의 조합만 가능합니다.</span>
                    <input type="text" name="memId" autocomplete="off" required>
                    <span class="hint strong"></span>
            </li>
            <li>
                <label>비밀번호</label>
                <span class="hint">비밀번호는 8자~20자 이내여야 하고,<br>영문자, 특수문자, 숫자가 반드시 하나 이상 포함되어야 합니다.</span>
                <input type="text" name="memPwd" required autocomplete="nofill">
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
            </li>
            <li>
                <button type="submit" class="submit-btn">회원가입</button>
            </li>
        </ul>
    </form>
    
    <script>
    $(function(){
    	var value = prompt();
    	var test = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&-_&~`])[A-Za-z\d$@$!%*#?&]{8,}$/.test(value);
    	console.log(test);
    });
	    $.validator.addMethod("pwdCheck",  function( value, element ) {
	   	   return this.optional(element) || /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).$/.test(value);
	   	});
	    
	    $.validator.addMethod("korChracter",  function( value, element ) {
	   	   return this.optional(element) ||  /^[가-힣]*$/.test(value);
	   	});
	    
	    $.validator.addMethod("emailChek",  function( value, element ) {
	   	   return this.optional(element) ||  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i.test(value);
	   	});
	    
	    $('#join').validate({
	    	rules: {
	    		memId : {
	    			required : true,
	    			minlength : 4,
	    			maxlength : 15,
	    			remote: {
	    				url: 'checkId.me',
	    				data: { memId : function() { 
	    							return $('#memId').val();
	    						}
	    					}
	    			}
	    		},
	    	 	memPwd : {
	    	 		required : true,
	    			minlength : 8,
	    			maxlength : 20,
	    			pwdCheck: true
	    	 	},
	    	 	pwdCheck : {
	    	 		required : true,
	    	 		equalTo: "[name='memPwd']"
	    	 	},
	    	 	memName : {
	    	 		required : true,
	    	 		korChracter: true
	    	 	},
	    	 	memPostcode: {
	    	 		required : true
	    	 	},
	    	 	memBasicAddr: {
	    	 		required : true
	    	 	},
	    	 	memNickname : {
	    	 		required : true,
	    	 		remote : {
	    	 			url: 'checkNickname.me',
	    				data: { nickname : function() { 
	    							return $('input[name=memNickname]').val();
	    						}
	    					}
	    	 		}
	    	 	},
	    	 	memEmail : {
	    	 		required : true,
	    	 		emailChek: true,
	    	 		remote : {
	    	 			url: 'checkEmail.me',
	    				data: { email : function() { 
	    							return $('input[name=memEmail]').val();
	    						}
	    					}
	    	 		}
	    	 	}
	    	},
	    	
	    	messages: {
	    		memId : {
	    			required : "아이디는 필수 입력입니다.",
	    			minlength : "아이디는 4자 이상 20자 이하의 영문과 숫자 조합만 가능합니다.",
	    			maxlength : "아이디는 4자 이상 20자 이하의 영문과 숫자 조합만 가능합니다.",
	    			remote : "이미 사용 중인 Id입니다."
	    		},
	    	 	memPwd : {
	    	 		required : "비밀번호는 필수 입력입니다.",
	    			minlength : "비밀번호는 8자 이상이어야합니다.",
	    			maxlength : "비밀번호는 20자 이내여야합니다.",
	    			pwdCheck : "영문, 숫자, 특수문자가 1자 이상 포함되어야 합니다."
	    	 	},
	    	 	pwdCheck : {
	    	 		required : "비밀번호를 한 번 더 확인해주세요.",
	    	 		equalTo: "비밀번호가 일치하지 않습니다."
	    	 	},
	    	 	memName : {
	    	 		required : "이름은 필수 입력입니다.",
	    	 		korChracter : "유효한 한글 이름인지 확인해주세요."
	    	 	},
	    	 	memPostcode: {
	    	 		required : "우편번호는 필수 입력입니다."
	    	 	},
	    	 	memBasicAddr: {
	    	 		required : "상세주소는 필수 입력입니다."
	    	 	},
	    	 	memNickname : {
	    	 		required : "닉네임은 필수 입력입니다.",
	    	 		remote : "이미 사용 중인 닉네임입니다."
	    	 	},
	    	 	memEmail : {
	    	 		required : "이메일은 필수 입력입니다.",
	    	 		email : "유표한 이메일 주소인지 확인해주세요.",
	    	 		emailChek: "유표한 이메일 주소인지 확인해주세요.",
	    	 		remote : "이미 사용 중인 이메일 주소입니다."
	    	 	}
	    	}
	    });
    </script>

</body>
</html>