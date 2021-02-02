'use strict';

var range = 60 * 5; //5분간 작동하는 타이머[시간 변경하려면 곱하는 수를 변경]
var counter; //카운터 실행을 제어하기 위한 변수

let opt_phone = document.getElementById('radio0');//휴대전화 인증 선택 버튼
let opt_email = document.getElementById('radio1');//이메일 인증 선택 버튼
let opt_title = document.getElementById('opt-title');//인증 연락처 input 타이틀 영역
let input_id = document.querySelector('input[name=memId]');//아이디 input 영역
let input_info = document.querySelector('input[name=memInfo]');//인증 연락처 input 영역
let	input_info_btn = document.querySelector('.send');//인증번호 발송 버튼
let input_val_code = document.querySelector('input[name=valCode]');//인증 번호 input 영역
let	input_val_code_btn = document.querySelector('.test');//인증 번호 검증 버튼
let	id_error = document.querySelector('label[for=memId]');//아이디 에러 안내 영역
let info_error = document.querySelector('label[for=memInfo]');//인증 연락처 에러 안내 영역
let valCode_error = document.querySelector('label[for=valCode]');//인증 검증 에러 안내 영역
let input_pwd = document.querySelector('input[name=pwd]');//새비밀번호 입력 input 영역
let input_pwdCheck = document.querySelector('input[name=pwdCheck]');//새비밀번호 확인 입력 input 영역
let pwd_error = document.querySelector('label[for=pwd]');//새비밀번호 에러 안내 영역
let pwdCheck_error = document.querySelector('label[for=pwdCheck]');//새비밀번호 확인 에러 안내 영역
let	submit_new_pwd_btn = document.querySelector('.reset');//제출 버튼
let val_code; //발송한 번호



//옵션 변경 시 페이지 초기화
opt_phone.addEventListener('click', function(){
	location.href='findPwdView.me';
});
opt_email.addEventListener('click', function(){
	location.href='findPwdWithEmailView.me';
});



//input의 값이 유효한지 검증
input_id.addEventListener('keyup', function(){
	if(input_id != '') {
		id_error.innerHTML = '';
	}
});
input_info.addEventListener('keyup', function(){
	let phoneReg = /^01[(?:0|1[6-9](\d{3,4})(\d{4})$/;
	let emailReg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
	
	if(opt_phone.checked && !phoneReg.test(input_info.value)) {
		info_error.innerHTML = '-를 포함하지 않은 휴대전화 번호만 입력 가능합니다.';
	} else if(opt_email.checked && !emailReg.test(input_info.value)) {
		info_error.innerHTML = '유효한 이메일 주소인지 확인해주세요.';
	} else {
		info_error.innerHTML = '';
	}
});



//"인증번호 발송" 버튼 클릭 이벤트 정의
input_info_btn.addEventListener('click', function(){
	
	//아이디 입력 값이 유효한지 체크
	if(input_id.value != '' && opt_phone.checked && input_info.value != '' && info_error.innerText == '') {
		//휴대전화로 인증번호 발송
		//화면 처리
		input_info.readOnly = true;
		document.querySelector('.info-input-box').style.backgroundColor = '#E4E5ED';
		input_info.style.backgroundColor = '#E4E5ED';
		input_info_btn.disabled = true;
		
		//인증발송과 확인
		sendCodeAndCheck('validatePhoneFindPwd.me');
		input_info_btn.disabled = true;
		
	} else if(input_id.value != '' && opt_email.checked && input_info.value != '' && info_error.innerText == ''){
		
		sendCodeAndCheck('validateEmail.me');
		input_info_btn.disabled = true;
		
	} else if(input_id.value == '') {
		id_error.innerHTML = '아이디를 입력해주세요.';
		input_id.focus();
		input_info_btn.disabled = false;
	} else if(info_error.innerText != '') {
		info_error.innerHTML = '입력한 값이 유효한지 다시 확인해주세요.';
		input_info.focus();
		input_info_btn.disabled = false;
	} else {
		info_error.innerHTML = '필수 입력 항목입니다.';
		input_info.focus();
		input_info_btn.disabled = false;
	}
});

/****** 인증코드 발송과 확인 ******/
async function sendCodeAndCheck(url) {
	
	//step1.존재하는 아이디인지 확인
	let checkIdRes = await fetch('checkId.me?memId='+input_id.value);
 	let idNotExisted = await checkIdRes.text();
	console.log(checkIdRes);
	if(idNotExisted != 'true') { //존재하는 아이디라면
	
		//step2아이디와 입력 정보를 대조하여 회원 조회
		let sendCodeRes = await fetch(url + '?memId=' + input_id.value + '&memInfo=' + input_info.value);
		let code = await sendCodeRes.json();
		
		if(code.status == 200) {
			//화면 처리
			input_id.readOnly = true;
			input_id.style.backgroundColor = '#E4E5ED';
			input_info.readOnly = true;
			document.querySelector('.info-input-box').style.backgroundColor = '#E4E5ED';
			input_info.style.backgroundColor = '#E4E5ED';
			input_info_btn.disabled = true;
			document.querySelector('.valCode-input-box').style.display = '';
			
			//전송받은 인증번호 저장
			val_code = code.code;
			
			//타이머 시작
			countDown();
			
			
		} else {
			info_error.innerHTML = code.code;
			input_info.focus();
			input_info_btn.disabled = false;
		}
	} else {
		id_error.innerHTML = '존재하지 않는 사용자입니다.';
		input_id.focus();
		input_info_btn.disabled = false;
	}
	
	//인증번호 검증
	input_val_code_btn.addEventListener('click', function(){
	
		if(input_val_code.value == val_code) { //검증 성공
			//카운터 종료
			clearInterval(counter);
			
			//UI 비활성화 처리
			valCode_error.innerText = '';
			document.querySelector('.valCode-input-box').style.backgroundColor = '#E4E5ED';
			input_val_code.style.backgroundColor = '#E4E5ED';
			input_val_code.readOnly = true;
			input_val_code_btn.disabled = true;
			document.getElementById('valCodeStatus').innerHTML = '<span style="color:blue; font-weight: 900;">인증되었습니다.</span>';
			
			//비밀번호 변경 입력 상자 활성화
			document.getElementById('input-pwd').style.display = '';
			document.getElementById('input-pwd-check').style.display = '';
		} else if(input_val_code.value == '' ||input_val_code.value === null) {
			valCode_error.innerText = '인증번호를 입력해주세요.';
		} else {
			valCode_error.innerText = '인증번호가 일치하지 않습니다.';
		}
	});
}	

//카운트 다운
function countDown() {
	counter = setInterval(timer, 1000);
}

//타이머 메소드
function timer() {
	let status_info = document.getElementById('valCodeStatus');
	let minute = range / 60;
 	minute = Math.floor(minute);
 	let second = range - (60 * minute);

	if(second < 10) {
		status_info.innerHTML = '발송된 인증 번호를 확인해주세요. <span style="color:blue; font-weight: 900;">[유효 시간 0' + minute + ':0' + second + ']</span>';
	} else {
		status_info.innerHTML = '발송된 인증 번호를 확인해주세요. <span style="color:blue; font-weight: 900;">[유효 시간 0' + minute + ':' + second + ']</span>';
	}
	
	if(range == 0) {
		//카운트 종료, 발송 코드 초기화
	    clearInterval(counter);
	    sysCode = 0;
	    
		//화면 초기화
		status_info.innerHTML = '';
		valCode_error.innerHTML = '';
		input_info.reaOnly = false;
		input_info.focus();
	}
	range--;
}

//비밀번호 유효성 검사
input_pwd.addEventListener('keyup',function(){
	
	if(input_pwd.value == '') {
		pwd_error.innerHTML = '필수 입력입니다.';
	} else if(!/^(?=.*[a-zA-Z])(?=.*\d)(?=.*[*:;\\"\\'\-_!@#$%^&~`₩+=\\(\\)/?\{\}\[\]])./g.test(input_pwd.value)) {
		pwd_error.innerHTML = '비밀번호는 최소 8자 이상이며 1자 이상의 영어, 숫자, 특수문자가 포함되어야 합니다.';
	} else {
		pwd_error.innerHTML = '';
	}
});

input_pwdCheck.addEventListener('keyup',function(){
	
	if(input_pwdCheck .value == '') {
		pwdCheck_error.innerHTML = '필수 입력입니다.';
	} else if(input_pwdCheck.value != input_pwd.value) {
		pwdCheck_error.innerHTML = '비밀번호가 일치하지 않습니다.';
	} else {
		pwdCheck_error.innerHTML = '';
	}
	
});

//비밀번호 변경 결과 리턴
async function resetPwd() {
	const init = {
		method: 'POST',
		headers: {'Content-Type':'application/json'},
		body: JSON.stringify({
			memId: input_id.value,
			memPwd: input_pwd.value
		})
	}

	let response = await fetch('resetPwd.me', init);
	
	let data = await response.text();
	
	
	if(data == 'success') {
		alert('비밀번호 변경에 성공했습니다.\n로그인 페이지로 이동합니다.');
		location.href='loginView.me';
	} else if(data == "user_not_found") {
		alert('일치하는 회원을 조회하지 못했습니다.');
	} else {
		alert('비밀번호 변경에 실패했습니다.\n잠시 후 다시 시도해주세요.');
	}
}


//비밀번호 재설정
submit_new_pwd_btn.addEventListener('click', function(){
	
	pwdCheck_error.innerText = '';
	
	if(input_id.value == '' || id_error.innerText != '') {
		input_id.blur();
		id_error.innerText = '아이디를 다시 확인해주세요.';
	} else if(input_info.value == '' || info_error.innerText != '') {
		input_info.blur();
		info_error.innerText = '입력값을 다시 확인해주세요.';
	} else if(input_val_code.value == '' || valCode_error.innerText != '') {
		input_val_code.blur();
		valCode_error.innerText = '인증번호를 다시 확인해주세요.';
	} else if(input_pwd.value == '' || pwd_error.innerText != '') {
		input_pwd.blur();
		pwd_error.innerText = '비밀번호를 다시 확인해주세요.';
	} else if(input_pwdCheck.value == '' || pwdCheck_error.innerText != '') {
		input_pwdCheck.blur();
		pwdCheck_error.innerText = '비밀번호를 다시 확인해주세요.';
	} else {
		pwdCheck_error.innerText = '';
		resetPwd();
	}
});