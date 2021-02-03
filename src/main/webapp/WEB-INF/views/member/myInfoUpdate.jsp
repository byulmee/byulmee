<!--
	메인컬러 - #FF6833
	메인폰트 - font-family: "Gmarket Sans TTF";
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/member/jquery.validate.min.js"></script>
<style>
	body {
		margin: 0;
		overflow:scroll
	}
	
	.outer {
		margin-top: 50px;
		margin-bottom: 50px;
		margin-left: auto;
		margin-right: auto;
		overflow: hidden;
		position: relative;
		width: 1000px;
		font-family: "Gmarket Sans TTF";
	}

/* 사이드 메뉴 */
	.sideMenu {
		position: absolute;
		top: 0px;
		left: 0px;
		bottom: 0px;
		width: 200px;
		background: #F4F4F4;
	}
	.profile {
		padding: 25px 25px 23px 25px;
	}
	.profileDiv {
		position: relative;
		margin-left: auto;
		margin-right: auto;
		width: 146px;
		height: 146px;
		border-radius: 90%;
		overflow: hidden;
		border: 2px solid gray;
		background: black;
	}
	.profileImg {
		position: absolute;
	    margin: auto;
	    width: 146px;
	    height: auto;
	    left: -100%;
	    right: -100%;
	    top: -100%;
	    bottom: -100%;
	}
	.nickname {
		margin: 0;
		padding-top: 10px;
		text-align: center;
		font-size: 14px;
	}
	.sideMenuList {
		text-align: center;
	}
	.sideMenuUl {
		list-style: none;
		margin: 0px;
		padding: 0px;
		position: relative;
	}
	.sideMenuUl > li ul.myinfoDropdown {
		list-style: none;
		display: none;
		position: absolute;
		top: 0px;
		left: 200px;
		background: #F4F4F4;
		border: 1px solid #DCDCDC;
	}
	.sideMenuUl > li ul.purDropdown {
		list-style: none;
		display: none;
		position: absolute;
		top: 50px;
		left: 200px;
		background: #F4F4F4;
		border: 1px solid #DCDCDC;
	}
	.sideMenuUl > li ul.favDropdown {
		list-style: none;
		display: none;
		position: absolute;
		top: 100px;
		left: 200px;
		background: #F4F4F4;
		border: 1px solid #DCDCDC;
	}
	.sideMenuUl > li ul.qnaDropdown {
		list-style: none;
		display: none;
		position: absolute;
		top: 150px;
		left: 200px;
		background: #F4F4F4;
		border: 1px solid #DCDCDC;
		z-index: 1;
	}
	.sideMenuUl > li ul.reviewDropdown {
		list-style: none;
		display: none;
		position: absolute;
		top: 200px;
		left: 200px;
		background: #F4F4F4;
		border: 1px solid #DCDCDC;
		z-index: 1;
	}
	.sideMenuUl > li:hover ul.myinfoDropdown,
	.sideMenuUl > li:hover ul.purDropdown,
	.sideMenuUl > li:hover ul.favDropdown,
	.sideMenuUl > li:hover ul.qnaDropdown,
	.sideMenuUl > li:hover ul.reviewDropdown {
		display: block;
	}
	.sideMenuUl > li ul.myinfoDropdown > li
	.sideMenuUl > li ul.purDropdown > li,
	.sideMenuUl > li ul.favDropdown > li,
	.sideMenuUl > li ul.qnaDropdown > li,
	.sideMenuUl > li ul.reviewDropdown > li {
		display: inline-block;
		text-align: center;
	}
	.sideMenuBtn {
		font-family: "Gmarket Sans TTF";
		font-size: 18px;
		padding-top: 5px;
		width: 200px;
		height: 50px;
		outline: 0;
		border: 0;
		background: none;
		cursor: pointer;
	}
	.sideMenuBtn:hover {
		background: #FF6833;
		color: white;
	}
	#selectedBtn {
		background: #FF6833;
		color: white;
		cursor: pointer;
	}
	
/* 컨텐츠 */
	.content {
		min-height: 550px;
		margin-left: 250px;
		text-align: center;
		border-top: 2px solid #FF6833;
		border-bottom: 2px solid #FF6833;
	}
	.button {
		width: 80px;
		height: 27px;
		padding-top: 3px;
		border: 1px solid #C4C4C4;
		background: white;
		font-family: "Gmarket Sans TTF";
		cursor:pointer;
		outline: 0;
	}
	.button:hover {
		background: #FF6833;
		color: white;
		cursor: pointer;
	}
	ul li {
		list-style-type: none;
	}
	.tab-box {
		width: 750px;
	}
	.tab-box ul {
		height: 40px;
	}
	.tab-box li {
		float: left;
		width: 25%;
		height: 40px;
		line-height: 40px; /* 중앙정렬 */
		text-align: center;
		font-size: 18px;
		background: #FF6833;
		color: rgba(255, 255, 255, 0.5);
		cursor: pointer;
	}
	.tab-box li:hover {
		background: #FF6833;
		color: rgba(255, 255, 255, 1);
		cursor: pointer;
	}
	.tab-box li.selected {
		color: white;
		background: #FF6833;
	}
	#title {
		font-size: 22px;
		margin: 0px;
		padding: 25px 25px 20px 25px;
	}
	table {
		width: 750px;
		border-collapse: collapse;
	}
	table td {
		border-top: 2px solid #F4F4F4;
		border-bottom: 2px solid #F4F4F4;
	}
	table tr:last-child td {
		border: 0;
	}
	.colNameTd {
		padding-left: 70px;
		text-align: left;
		width: 80px;
		height: 50px;
	}
	.alert_gray {
		font-size: 14px;
		color: #C4C4C4;
	}
	.alert_orange {
		font-size: 14px;
		color: #FF6833;
	}
	.colContentTd {
		font-size: 14px;
		text-align: left;
		width: 420px;
	}
	.colContentTd_btn {
		height: 45px;
		padding: 5px;
		vertical-align: middle;
		text-align: center;
	}
	.input {
		outline: 0;
		border: 1px solid #9F9F9F;
		height: 23px;
		width: 250px;	
	}
	#postcode {
		outline: 0;
		border: 1px solid #9F9F9F;
		height: 23px;
		width: 60px;
		background: #F4F4F4;
		margin-top: 10px;
	}
	#basicAddr {
		outline: 0;
		border: 1px solid #9F9F9F;
		height: 23px;
		width: 400px;
		background: #F4F4F4;
	}
	#detailAddr {
		outline: 0;
		border: 1px solid #9F9F9F;
		height: 23px;
		width: 400px;
		margin-bottom: 10px;
	}
	label.error {
		padding-left: 5px;
		font-family: 'GmarketSansLight';
		font-weight: bold;
		color: rgb(59, 59, 59);
		font-size: 0.8rem;
		padding-bottom: 0.4rem;
		line-height: 0.9rem;
		color: #FF6833;
	}
	#phone-error {
		position: absolute;
		top: 351px;
		left: 788px;
	}
	input.error {
		border: 1px solid #FF6833;
	}
</style>
</head>
<body>
	<c:import url="../common/gnb.jsp"/>
	
	<div class="outer">
		<!-- 사이드 메뉴 -->
		<div class="sideMenu">
	    	<div class="profile">
    			<div class="profileDiv">
					<c:if test="${ empty img }">
						<img class="profileImg" name="profileImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/basic.png">
    				</c:if>
    				<c:if test="${ !empty img }">
    					<c:if test="${ img.imgStatus == 'Y' }">
							<img class="profileImg" name="profileImg" src="${ pageContext.servletContext.contextPath }/resources/piUploadFiles/${ img.imgName }">
	    				</c:if>
	    				<c:if test="${ img.imgStatus == 'N' }">
							<img class="profileImg" name="profileImg" src="${ pageContext.servletContext.contextPath }/resources/images/myPage/basic.png">
	    				</c:if>
    				</c:if>
    			</div>
				<p class="nickname"> <c:out value="${ loginUser.memName } 님"/> </p>
				<p class="nickname"> <c:out value="(${ loginUser.memNickname })"/> </p>
			</div>
			<div class="sideMenuList">
				<ul class="sideMenuUl">
					<li>
						<button onclick="location.href='myPageMainView.me'" class="sideMenuBtn" id="selectedBtn">개인정보 관리</button>
						<ul class="myinfoDropdown">
							<li>
								<button onclick="location.href='myInfoPwdCheckView.me'" class="sideMenuBtn" id="selectedBtn">개인정보 변경</button>
							</li>
							<li>
								<button onclick="location.href='myPwdUpdateView.me'" class="sideMenuBtn">비밀번호 변경</button>
							</li>
							<li>
								<button onclick="location.href='profileImageUpdateView.me'" class="sideMenuBtn">프로필사진 변경</button>
							</li>
							<li>
								<button onclick="location.href='memberDeleteView.me'" class="sideMenuBtn">회원 탈퇴</button>
							</li>
						</ul>
					</li>
					<li>
						<button class="sideMenuBtn" style="cursor: default;">구매내역</button>
						<ul class="purDropdown">
							<li>
								<button onclick="location.href='myPurActView.me'" class="sideMenuBtn">신청한 활동</button>
							</li>
							<li>
								<button onclick="location.href='myPurProView.me'" class="sideMenuBtn">구매한 상품</button>
							</li>
						</ul>
					</li>
					<li>
						<button class="sideMenuBtn" style="cursor: default;">찜 목록</button>
						<ul class="favDropdown">
							<li>
								<button onclick="location.href='myFavActView.me'" class="sideMenuBtn">찜한 활동</button>
							</li>
							<li>
								<button onclick="location.href='myFavProView.me'" class="sideMenuBtn">찜한 상품</button>
							</li>
							<li>
								<button onclick="location.href='myFavStarView.me'" class="sideMenuBtn">찜한 스타</button>
							</li>
						</ul>
					</li>
					<li>
						<button class="sideMenuBtn" style="cursor: default;">문의 목록</button>
						<ul class="qnaDropdown">
							<li>
								<button onclick="location.href=''" class="sideMenuBtn">고객 문의</button>
							</li>
							<li>
								<button onclick="location.href=''" class="sideMenuBtn">활동 문의</button>
							</li>
							<li>
								<button onclick="location.href=''" class="sideMenuBtn">상품 문의</button>
							</li>
						</ul>
					</li>
					<li>
						<button class="sideMenuBtn" style="cursor: default;">후기 목록</button>
						<ul class="reviewDropdown">
							<li>
								<button onclick="location.href='myRevActListView.me'" class="sideMenuBtn">활동 후기</button>
							</li>
							<li>
								<button onclick="location.href='myRevProListView.me'" class="sideMenuBtn">상품 후기</button>
							</li>
						</ul>
					</li>
					<li>
						<c:if test="${ loginUser.memLevel == 0 }">
		            		<button class="sideMenuBtn">스타 신청</button>
		            	</c:if>
		            	<c:if test="${ loginUser.memLevel == 1 }">
		            		<button onclick="location.href='wookroomView.wr'" class="sideMenuBtn">작업실</button>
		            	</c:if>
					</li>
				</ul>
			</div>
		</div>
		<div class="content">
			<div class="tab-box">
				<ul>
					<li onclick="location.href='myInfoPwdCheckView.me'" class="selected">개인정보 변경</li>
					<li onclick="location.href='myPwdUpdateView.me'">비밀번호 변경</li>
					<li onclick="location.href='profileImageUpdateView.me'">프로필사진 변경</li>
					<li onclick="location.href='memberDeleteView.me'">회원 탈퇴</li>
				</ul>
			</div>
			<form id="join" action="myInfoUpdate.me" method="post">
				<p id="title">개인정보 변경</p>
				<table>
					<tr>
						<td class="colNameTd">
							아이디
						</td>
						<td class="colContentTd">
							${ loginUser.memId }
							<input type="hidden" name="memId" id="id" value="${ loginUser.memId }">
						</td>
					</tr>
					<tr>
						<td class="colNameTd">
							이름
						</td>
						<td class="colContentTd">
							<input type="text" name="memName" id="name" class="input" value="<c:out value="${ loginUser.memName }"/>">
						</td>
					</tr>
					<tr>
						<td class="colNameTd">
							닉네임
						</td>
						<td class="colContentTd">
							<input type="text" name="memNickname" id="nickname" class="input" value="<c:out value="${ loginUser.memNickname }"/>">
							<a class="alert_gray"></a>
						</td>
					</tr>
					<tr>
						<td class="colNameTd">
							이메일
						</td>
						<td class="colContentTd">
							<input type="text" name="memEmail" id="email" class="input" value="<c:out value="${ loginUser.memEmail }"/>">
							<a class="alert_orange"></a>
						</td>
					</tr>
					<tr>
						<td class="colNameTd">
							휴대전화
						</td>
						<td class="colContentTd">
							<input type="text" name="memPhone" id="phone" class="input" value="<c:out value="${ loginUser.memPhone }"/>">
							<button class="button" onclick="">인증</button>
						</td>
					</tr>
					<tr>
						<td rowspan="3" class="colNameTd">
							주소
						</td>
						<td class="colContentTd" style="border:0">
							우편번호&nbsp;&nbsp;&nbsp;<input type="text" name="memPostcode" id="postcode" placeholder="우편번호" value="<c:out value="${ loginUser.memPostcode }"/>" readonly>
							<button type="button" class="button" onclick="address()">검색</button>
						</td>
					</tr>
					<tr>
						<td class="colContentTd" style="border:0">
							기본주소&nbsp;&nbsp;&nbsp;<input type="text" name="memBasicAddr" id="basicAddr" placeholder="기본주소" value="<c:out value="${ loginUser.memBasicAddr }"/>" readonly>
						</td>
					<tr>
						<td class="colContentTd" style="border:0">
							상세주소&nbsp;&nbsp;&nbsp;<input type="text" name="memDetailAddr" id="detailAddr" placeholder="상세주소" value="<c:out value="${ loginUser.memDetailAddr }"/>">
						</td>
					</tr>
					<tr>
						<td colspan="2" class="colContentTd_btn">
							<button type="button" class="button" onclick="location.href='myPageMainView.me'">취소</button>
							<button type="submit" class="button">확인</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<c:import url="../common/footer.jsp"/>
	
	<script>
	    function address() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
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
	                    document.getElementById("detailAddr").value = extraAddr;
	                
	                } else {
	                    document.getElementById("detailAddr").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById("postcode").value = data.zonecode;
					document.getElementById("basicAddr").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("detailAddr").focus();
	            }
	        }).open();
	    }
	</script>

	<script>
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
			rules : {
				memId : {
					required : true,
					minlength : 4,
					maxlength : 20,
					remote : {
						url : 'checkId.me',
						data : {
							memId : function() {
								return $('input[name=memId]').val();
							}
						}
					}
				},
				memPwd : {
					required : true,
					minlength : 8,
					maxlength : 20,
					checkPwd : true
				},
				pwdCheck : {
					required : true,
					equalTo : "[name='memPwd']"
				},
				memName : {
					required : true,
					korChracter : true
				},
				memPostcode : {
					required : true
				},
				memBasicAddr : {
					required : true
				},
				memPhone : {
					required : true,
					maxlength : 20,
					number : true,
					phoneCheck : true
				},
				memNickname : {
					required : true,
					maxlength : 8,
					remote : {
						url : 'checkChangeNickname.me',
						data : {
							nickname : function() {
								return $('input[name=memNickname]').val();
							}
						}
					}
				},
				memEmail : {
					required : true,
					emailChek : true,
					remote : {
						url : 'checkChangeEmail.me',
						data : {
							email : function() {
								return $('input[name=memEmail]').val();
							}
						}
					}
				}
			},
			messages : {
				memId : {
					required : "아이디는 필수 입력입니다.",
					minlength : "아이디는 4자 이상 20자 이하의 영문과 숫자 조합만 가능합니다.",
					maxlength : "아이디는 4자 이상 20자 이하의 영문과 숫자 조합만 가능합니다.",
					remote : "이미 사용 중인 Id입니다."
				},
				memPwd : {
					required : "비밀번호는 필수 입력입니다.",
					minlength : "비밀번호는 8자 이상이어야 합니다.",
					maxlength : "비밀번호는 20자 이내여야 합니다.",
				},
				pwdCheck : {
					required : "비밀번호를 한 번 더 확인해주세요.",
					equalTo : "비밀번호가 일치하지 않습니다."
				},
				memName : {
					required : "이름은 필수 입력입니다.",
					korChracter : "유효한 한글 이름인지 확인해주세요."
				},
				memPostcode : {
					required : "우편번호는 필수 입력입니다."
				},
				memBasicAddr : {
					required : "주소는 필수 입력입니다."
				},
				memPhone : {
					required : "전화번호는 필수 입력입니다.",
					maxlength : "유효한 전화번호인지 확인해주세요.",
					number : "-를 제외한 숫자만 입력해주세요.",
					phoneCheck : "유효한 전화번호인지 확인해주세요."
				},
				memNickname : {
					required : "닉네임은 필수 입력입니다.",
					maxlength : "닉네임은 8자 이내여야 합니다.",
					remote : "이미 사용 중인 닉네임입니다."
				},
				memEmail : {
					required : "이메일은 필수 입력입니다.",
					email : "유효한 이메일 주소인지 확인해주세요.",
					emailChek : "유효한 이메일 주소인지 확인해주세요.",
					remote : "이미 사용 중인 이메일 주소입니다."
				}
			}
		});
	</script>
</body>
</html>