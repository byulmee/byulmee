<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    	<input type="text" name="memId" autocomplete="off" value="${oauthInfo.getMemId()}" readonly>
                    </c:if>
                    <c:if test="${empty sessionScope.oauthInfo}">
	                    <input type="text" name="memId" autocomplete="off" required>
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
    
  <script>
    /******* by.다혜: 휴대전화 인증 ******/
    var range = 60 * 5; //5분간 작동하는 타이머[시간 변경하려면 곱하는 수를 변경]
    var counter; //카운터 실행을 제어하기 위한 변수
    var sysCode; //발송된 인증코드
    var userCode; //사용자가 입력한 인증코드
    var numbers = []; //발송했던 인증번호를 저장하기 위한 배열
    var requestStatus; //sms 발송 상태 정의

    $('.sendCode').on('click', function(){

      if($('input[name=memPhone]').val() !== "" && $('input[name=memPhone]').hasClass("error") === false) {

        //문자 인증 요청 전송 후 발송한 정보 가져오기
        $.ajax({
          type: "POST",
          url: 'validatePhone.me',
          dataType: 'json',
          data: {'memPhone':function(){
                  return $('input[name=memPhone]').val();		
                }
               },
          success: function(data) {

            //발송한 랜덤 코드와 수신 상태 받아오기
            requestStatus = data['status'];
            sysCode = data['code'];

            //이미 전송한 적이 있는 번호인지 검증 후 중복되었을 경우 재전송 요청
            let isDuplicated = sysCodeDuplicateCheck();

            if(!isDuplicated) {
              numbers.push(sysCode);
            } else {
              requestStatus = "500";
            }

            //성공적으로 sms 전송한 경우
            if(requestStatus == '202') {
              //인증하기 재전송 못하도록 화면 처리
              $('.sendCode').attr('disabled','disabled').css('backgroundColor', '#E4E5ED');
              $('input[name=memPhone]').attr('readonly', 'true').addClass('disable-bg');
              $('.item-with-btn:first').addClass('disable-bg');

              //카운트 다운과 인증 코드 입력창 노출 & 재전송 버튼을 누를 경우를 대비해 알림글 초기화
              clearInterval(counter);
              $('#memPhone-status').html('');
              $('.test').show();

              //카운트 다운
              function countDown() {
                counter = setInterval(timer, 1000);
              }
              countDown();
            } else {
              $('#memPhone-error').html('인증번호 발송에 실패했습니다.<br>잠시후 다시 시도해주세요.');
            } 
          }
        });
      } else {
        $('#memPhone-error').text('유효한 전화번호인지 확인해주세요.');
      }
    });

    //인증코드 확인하기
    $('.confirm-btn').on('click', function(){
      userCode = $('input[name=confirmCode]').val();

      if(userCode == sysCode){
        $('.test').removeClass('strong').addClass('disable-bg');
        $('#confirmCode').css('backgroundColor', '#E4E5ED').attr('readonly', 'true');
        $('.confirm-btn').attr('disabled','disabled').css('backgroundColor', '#E4E5ED');
        $('#memPhone-status-error').hide();
        clearInterval(counter);
        $('#memPhone-status').html('<span style="color:blue;">인증되었습니다.');
      } else {
        $('#memPhone-status-error').html('<span style="color:red;">인증번호를 다시 확인해주세요.');
        $('.test').addClass('strong');
      }
    });

    //인증코드 중복 확인
    function sysCodeDuplicateCheck() {
      let isDuplicated = false;

      for(var i in numbers) {

        if(number[i] == sysCode) {
          isDuplicated = true;
          break;
        }
      }

      return isDuplicated;
    }

    //타이머
    function timer() {
      let minute = range / 60;
      minute = Math.floor(minute);

      let second = range - (60 * minute);

      if(second < 10) {
        $('#memPhone-status').html('발송된 인증 번호를 확인해주세요. <span style="color:blue; font-weight: 900;">[유효 시간 0' + minute + ':0' + second + ']</span>');
      } else {
        $('#memPhone-status').html('발송된 인증 번호를 확인해주세요. <span style="color:blue; font-weight: 900;">[유효 시간 0' + minute + ':' + second + ']</span>');
      }

      if(range == 0) {
        //카운트 종료, 발송 코드 초기화
        clearInterval(counter);
        sysCode = 0;
        //화면 초기화
        $('input[name=memPhone]').removeClass('disable-bg');
        $('.item-with-btn:first').removeClass('disable-bg');
        $('.sendCode').addClass('disable-bg');
        $('#memPhone-status').html("");
        $('.test').css('display', 'none');
        $('#memPhone-status-error').html('<span style="color:red;">인증번호를 다시 전송해주세요.</span>');
      }

      range--;
    }		
	
    $.validator.addMethod("checkPwd", function(value, element) {
        return this.optional(element) || /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[*:;\\"\\'\-_!@#$%^&~`₩+=\\(\\)/?\{\}\[\]])./g.test(value);
    },"영문자, 숫자, 특수문자가 반드시 1자 이상 포함되어있어야 합니다.");

    $.validator.addMethod("idCheck",  function( value, element ) {
         return this.optional(element) || /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[-_])(?=.{4,})/g.test(value);
    });

    $.validator.addMethod("idCheck",  function( value, element ) {
       return this.optional(element) || /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*\\(\\)-_+])(?=.{8,})/g.test(value);
    });

    $.validator.addMethod("pwdCheck",  function( value, element ) {
       return this.optional(element) || /^.(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).$/.test(value);
    });

    $.validator.addMethod("phoneCheck",  function( value, element ) {
     return this.optional(element) || /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/.test(value);
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
          required: true,
          minlength: 4,
          maxlength: 20,
          remote: {
            url: 'checkId.me',
            data: { memId : function() { 
                  return $('input[name=memId]').val();
                }
              }
          }
        },
        memPwd : {
          required: true,
          minlength: 8,
          maxlength: 20,
          checkPwd: true
        },
        pwdCheck : {
          required: true,
          equalTo: "[name='memPwd']"
        },
        memName : {
          required : true,
          korChracter: true
        },
        memPostcode: {
          required: true
        },
        memBasicAddr: {
          required: true
        },
        memPhone : {
          required: true,
          maxlength: 20,
          number: true,
          phoneCheck: true
        },
        memNickname: {
          required: true,
          maxlength: 25,
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
          required: "아이디는 필수 입력입니다.",
          minlength: "아이디는 4자 이상 20자 이하의 영문과 숫자 조합만 가능합니다.",
          maxlength: "아이디는 4자 이상 20자 이하의 영문과 숫자 조합만 가능합니다.",
          remote: "이미 사용 중인 Id입니다."
        },
        memPwd : {
          required: "비밀번호는 필수 입력입니다.",
          minlength: "비밀번호는 8자 이상이어야합니다.",
          maxlength: "비밀번호는 20자 이내여야합니다.",
        },
        pwdCheck : {
          required: "비밀번호를 한 번 더 확인해주세요.",
          equalTo: "비밀번호가 일치하지 않습니다."
        },
        memName : {
          required: "이름은 필수 입력입니다.",
          korChracter: "유효한 한글 이름인지 확인해주세요."
        },
        memPostcode: {
          required: "우편번호는 필수 입력입니다."
        },
        memBasicAddr: {
          required: "주소는 필수 입력입니다."
        },
        memPhone : {
          required: "전화번호는 필수 입력입니다.",
          maxlength: "유효한 전화번호인지 확인해주세요.",
          number: "-를 제외한 숫자만 입력해주세요.",
          phoneCheck: "유효한 전화번호인지 확인해주세요."
        },
        memNickname: {
          required: "닉네임은 필수 입력입니다.",
          remote: "이미 사용 중인 닉네임입니다."
        },
        memEmail : {
          required: "이메일은 필수 입력입니다.",
          email: "유표한 이메일 주소인지 확인해주세요.",
          emailChek: "유표한 이메일 주소인지 확인해주세요.",
          remote: "이미 사용 중인 이메일 주소입니다."
        }
      }
    });
	    
    //제출 전 휴대전화 인증 코드를 제대로 인증하였는지 확인
    $('form').on('submit', function(event){
      var phone_btn_status1 = $('.sendCode').prop('disabled');
      var phone_btn_status2 = $('.confirm-btn').prop('disabled');

      if(phone_btn_status1 == false || phone_btn_status2 == false ) {
        event.preventDefault();
        $('.item-with-btn:first').focus();

      }
    });
  </script>
</body>
</html>