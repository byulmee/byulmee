package com.kh.byulmee.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.byulmee.member.model.dto.KakaoProfile;
import com.kh.byulmee.member.model.dto.KakaoToken;
import com.kh.byulmee.member.model.exception.MemberException;
import com.kh.byulmee.member.model.service.MemberApiService;
import com.kh.byulmee.member.model.service.MemberService;
import com.kh.byulmee.member.model.vo.Member;

@SessionAttributes({"loginUser", "oauthInfo"})

@RestController
public class MemberRestApiController {

	//인증 관련 API 처리
		@Autowired
		private MemberService mService;
		
		//인증 API 관련
		@Autowired
		private MemberApiService mApiService;
		
		@Autowired
		private BCryptPasswordEncoder bcrypt;
		
		/******** by다혜: 휴대전화 인증 메세지 발송 ********/
		@RequestMapping(value="validatePhone.me", method=RequestMethod.POST)
		@ResponseBody
		public String validatePhone(@RequestParam("memInfo") String memPhone) {

			return mApiService.sendMmsRequest(memPhone);
		}
		
		/******** by다혜: 휴대전화 인증 메세지 발송 ********/
		@RequestMapping("validatePhoneFindPwd.me")
		@ResponseBody
		public String validatePhoneFinePwd(@RequestParam("memInfo") String memPhone, @RequestParam("memId") String memId) {
			
			Member member = new Member();
			member.setMemId(memId);
			member.setMemPhone(memPhone);
			
			String result = "";
			
			if(mService.CheckIdWithPhone(member) > 0 ) {
				result = mApiService.sendMmsRequest(memPhone);
			} else {
				String code = "아이디 혹은 이메일이 올바른지 다시 확인해주세요.";
				int status = 406;
				
				JSONObject json = new JSONObject();
				json.put("code", code);
				json.put("status", status);
				
				result = json.toJSONString();
			}
			
			return result;
		}
		
		
		/******** by다혜: 이메일 인증 메소드 ********/
		@RequestMapping(value = "validateEmail.me", produces = "application/json; charset=utf8")
		@ResponseBody
		public String validateEmail(@RequestParam("memInfo") String memEmail, @RequestParam("memId") String memId) {
			
			Member member = new Member();
			member.setMemId(memId);
			member.setMemEmail(memEmail);
			
			String code = "";
			int status = 0;

			if(mService.CheckIdWithEmail(member) > 0 ) {
				
				code = mApiService.getEmailCode(member);
				status = 200;
			} else {
				code = "아이디 혹은 이메일이 올바른지 다시 확인해주세요.";
				status = 406;
			}
			
			JSONObject json = new JSONObject();
			json.put("code", code);
			json.put("status", status);
			
			String result = json.toJSONString();
			
			return result;
		}
		
		
		/******** by다혜: 간편 로그인 메소드 ********/
		/*	
		 *  모든 간편 로그인은 최초 로그인 시 반드시 회원 가입 필요
		 *  회원가입을 진행하지 않으면 로그인 불가
		 */	
		
		/* by다혜: kakao 간편 로그인 */
		@RequestMapping(value = "/kakao")
		public ModelAndView kakaoAuth(String code, HttpServletRequest req, HttpServletResponse resp, Model model, ModelAndView mv) {
			//카카오 토큰을 받은 후 이용자 정보 획득
			KakaoToken kakaoToken = mApiService.getKakaoToken(code);
			KakaoProfile kakaoProfile = mApiService.getKakaoUser(kakaoToken);
			
			//별미에서 사용할 카카오 간편 로그인 아이디 생성 후 해당 아이디로 회원가입했는지 확인
			String id = "bmk001" + kakaoProfile.getId();
			Member m = new Member();
			boolean isFirstVisit = mService.checkId(id) < 1 ? true : false;
			
			if(isFirstVisit) {
				//최초 방문일 경우 회원가입 페이지로 이동
				m.setMemId(id);
				m.setMemEmail(kakaoProfile.getKakao_account().getEmail());
				m.setMemLoginType("K");
				
				model.addAttribute("oauthInfo", m);
				mv.setViewName("member/joinUs");
			} else {
				//이미 가입된 상태라면 로그인 세션 추가한 후 메인으로 redirect
				m = mService.selectMember(id);
				
				if(m == null) {
					throw new MemberException("로그인에 실패하였습니다.");
				}
				
				model.addAttribute("loginUser", m);
				mv.setViewName("redirect:home.do");
			}
			return mv;
		}
		
		/* by다혜: facebook 간편 로그인 */
		@RequestMapping(value = "fb.me", method={ RequestMethod.GET, RequestMethod.POST })
		public ModelAndView facebookAuth(HttpServletResponse response, Model model) {
		 
		      	//String result = mApiService.getFacebookToken();
		      
		      	//System.out.println(result);

			return null;
		}
}
