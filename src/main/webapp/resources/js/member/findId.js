

/*** by:다혜, XMLHttpRequest를 사용하여 Ajax 구현하기 ***/
let opt_phone = document.querySelector('#radio0');
let opt_email = document.querySelector('#radio1');
let memName = document.querySelector('input[name=memName]');
let memInfo = document.querySelector('input[name=memInfo]');
let memPhone = document.querySelector('.memPhone');
let memEmail = document.querySelector('.memEmail');
let submit_btn = document.querySelector('.submit-btn');
let memName_error = document.querySelector('#memName-error');
let memInfo_error = document.querySelector('#memInfo-error');
let modal_box = document.querySelector('#my_modal');
let opt_input_title = document.querySelector('.opt-input-title');
let httpRequest = null;
let result_id = null;
let checkVal;
		
window.onload = function() {
	//페이지 접근 시 휴대전화로 찾기가 디폴트로 선택된 상태
	opt_phone.checked = true;
}


//찾기 옵션 선택에 따라 UI 변경
opt_phone.addEventListener('click', function() {
	memName.value='';
	memInfo.value='';
	memInfo_error.innerHTML = '';
	memInfo.className = 'memPhone';
	opt_input_title.innerHTML = "휴대전화 번호 입력";
});

opt_email.addEventListener("click", function() {
	memName.value='';
	memInfo.value='';
	memInfo_error.innerHTML = '';
	memInfo.className = 'memEmail';
	opt_input_title.innerHTML = "이메일 주소 입력";
});


//입력 값에 이상이 없는지 검사
memName.addEventListener('keyup', function() {
	let name = memName.value;
	
	if(name == null || name == ''|| /[가-힣]/.test(name) == false) {
		memName_error.innerHTML = '유효한 이름을 입력했는지 다시 확인해주세요.';
	} else {
		memName_error.innerHTML = '';
	}
});

memInfo.addEventListener('keyup', function() {
	let inputText = memInfo.value;
	
	if(memInfo.classList.contains('memPhone')) {
		if(inputText === null || inputText == '' || !/^01[(?:0|1[6-9](\d{3,4})(\d{4})$/.test(inputText)) {
			memInfo_error.innerHTML = '유효한 전화번호를 입력했는지 다시 확인해주세요.<br>전화번호는 -를 제외하고 작성해주세요.';
		} else {
			memInfo_error.innerHTML = '';
		}
	} else if(memInfo.classList.contains('memEmail')) {
		if(inputText === null || inputText == '' || !/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i.test(inputText)) {
			memInfo_error.innerHTML = '유효한 이메일을 입력했는지 다시 확인해주세요.';
		} else {
			memInfo_error.innerHTML = '';
		}
	}
});

	
//아이디 찾기 버튼 클릭하면 입력값이 정상인지 확인한 후, XMLHttpRequest 생성하여 요청 전송
submit_btn.addEventListener("click", function() {
	let instantData = {};
	
	if(memName.value !== '' && memInfo.value !== '' && memName_error.innerText === '' && memInfo_error.innerText === '') {
	
		instantData.memName = memName.value;
		instantData.memInfo = memInfo.value;
		
		if(opt_phone.checked == true) {
			sendRequest('POST', 'findIdWithPhone.me', true, instantData);
		} else {
			sendRequest('POST', 'findIdWithEmail.me', true, instantData);
		}
	} else {
		alert('입력한 정보가 올바른지 다시 한번 확인해주세요.');
		return false;
	}
	
	httpRequest.onload = function(){ //요청에 대한 응답을받으면
		result_id = callback(); //응답 받은 ID를 불러옴
		
		modal('my_modal');
		
		if(result_id != '') {
			document.querySelector('.modal-message').innerHTML = '회원님의 아이디는 <span style="color: #FF6833;">' + result_id + '</span> 입니다.';
		} else {
			document.querySelector('.modal-message').innerText = '존재하지 않는 회원입니다.';
		}
	}
});


/******************  Javascript로 Ajax 구현하기위한 메소드  *******************/
//1. XMLHttpRequest 객체 생성
//2. open(method선택, url입력, true=비동기/false=동기) : 요청을 초기화하는 메서드
//3. content-Type 설정
//4. send(파라미터로 보낼 값) : 요청 전송, get방식인데 파라미터가 없다면 비워도 됨 / post 방식 어떤 데이터도 전송 가능 단 서버에서 파싱하기 좋은 JSON이나 SOAP 형식으로 보내는 것이 좋음
 function sendRequest(method, url, isSync, data) {
	httpRequest = new XMLHttpRequest();
	
	httpRequest.open(method, url, isSync);
	httpRequest.setRequestHeader('Content-Type', 'application/json');
	httpRequest.send(JSON.stringify(data));
}
	
//서버 응답 처리하기
// httpRequest.onload 또는 httpRequest.onreadyStateChange()방식이 있음
// callback()은 onload 시 처리할 내용을 정의한 사용자 함수임
//	* 응답 status 확인
//		200:정상, 304:응답이 이전 응답 내용과 동일함, 404: 페이지를 찾을 수 없음, 500:서버 내부 오류
//	* responseXML: xml 타입으로 데이터를 받음
//	* responseText: text 형식으로 데이터를 받음
function callback() {
	if (httpRequest.readyState === httpRequest.DONE) { //요청이 완료되면
	
		if(httpRequest.status === 200 || httpRequest.status === 201) { //응답 상태가 정상일 때
			let result = httpRequest.responseText;
			//ie: JSON 지원 안하는 버전에서 파싱eval("("+xmlhttp.responseText+")");
			return result;
		}
	}
}


//모달창을 조작하는 메소드
function modal(id) {
    var zIndex = 0;
    var modal = document.getElementById(id);
    
    document.getElementById(id).display = 'block';
    
    //모달창 뒤의 배경색 레이어
    var bg = document.createElement('div');
    bg.setStyle({
        position: 'fixed',
        zIndex: zIndex + 1,
        left: '0px',
        top: '0px',
        width: '100%',
        height: '100%',
        overflow: 'auto',
        backgroundColor: 'rgba(0,0,0,0.3)'
    });
    document.body.append(bg);

    //모달창 닫기
    modal.querySelector('.modal_close_btn').addEventListener('click', function() {
        bg.remove();
        modal.style.display = 'none';
    });
	
    //모달창
    modal.setStyle({
        position: 'fixed',
        display: 'block',
        backgroundColor: 'white',
        padding: '1.8rem 1.5rem',
        boxShadow: '0 4px 8px 0 rgba(0, 0, 0), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',
        zIndex: zIndex + 2,
        top: '50%',
        left: '50%',
        transform: 'translate(-50%, -50%)',
        msTransform: 'translate(-50%, -50%)',
        webkitTransform: 'translate(-50%, -50%)'
    });
}

// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
Element.prototype.setStyle = function(styles) {
    for (var k in styles) this.style[k] = styles[k];
    return this;
};