'use strict';

window.onload = function() {
	document.getElementById("join").reset();
}
    	
/**** 주소 가져오기 ****/
function getAddress() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("detailAddress").value = extraAddr;
            
            } else {
                document.getElementById("detailAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("postcode").value = data.zonecode;
            document.getElementById("postcode").style.backgroundColor = "#E4E5EC";
            document.getElementById("address").value = addr;
            document.getElementById("address").style.backgroundColor = "#E4E5EC";
            document.getElementById("postcode").value
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
        }
    }).open();
}


/******* by.다혜: 휴대전화 인증 ******/
var range = 60 * 5; //5분간 작동하는 타이머[시간 변경하려면 곱하는 수를 변경]
var counter; //카운터 실행을 제어하기 위한 변수
var sysCode; //발송된 인증코드
var userCode; //사용자가 입력한 인증코드
var numbers = []; //발송했던 인증번호를 저장하기 위한 배열
var requestStatus; //sms 발송 상태 정의
var memLoginType = $('input[name=memLoginType]').val(); //맴버 회원가입 유형(ex 별미 직접 가입 or 간편로그인)을 판단하기 위한 변수

$('.sendCode').on('click', function(){
	
	if($('input[name=memPhone]').val() !== "" && $('input[name=memPhone]').hasClass("error") === false) {
	
		//별미에 직접 회원 가입할 경우, 중복된 휴대폰 번호인지 먼저 검증
		if(memLoginType == 'B') {
			$.ajax({
				type: "POST",
				url: 'checkPhone.me',
				data: {'memPhone':function(){
				            		return $('input[name=memPhone]').val();		
				          		}
				    	  },
				success: function(data) {
					if(data == false) {
						$('#memPhone-error').css('display','block').text('이미 가입된 번호입니다.');
						return false;
					} else {
						sendCodeAndCheck();
					}
				}
			});
		} else {
			sendCodeAndCheck();
		}
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

//문자 인증 요청 전송 후 발송한 정보 가져오기
function sendCodeAndCheck() {
   $.ajax({
      type: "POST",
      url: 'validatePhone.me',
      dataType: 'json',
      data: {'memInfo':function(){
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
}

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