package com.kh.byulmee.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.byulmee.member.model.dto.KakaoProfile;
import com.kh.byulmee.member.model.dto.KakaoToken;
import com.kh.byulmee.member.model.exception.MemberException;
import com.kh.byulmee.member.model.service.MemberApiService;
import com.kh.byulmee.member.model.service.MemberService;
import com.kh.byulmee.member.model.vo.Member;

@SessionAttributes({"loginUser", "oauthInfo", "phoneValidator"})

/* by다혜: 회원 등록, 인증 처리 컨트롤러 */
@Controller
public class MemberApiController {
	
	//회원 정보 관리
	@Autowired
	private MemberService mService;
	
	//인증 API 관련
	@Autowired
	private MemberApiService mApiService;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	
	/******** by다혜: 회원가입 메소드 ********/
	@RequestMapping(value="joinUs.me", method = RequestMethod.POST)
	public String joinUs(@ModelAttribute Member memberInfo, Model model, HttpServletRequest request) {
		
		String encodedPwd = bcrypt.encode(memberInfo.getMemPwd());
		memberInfo.setMemPwd(encodedPwd);
		
		int result = mService.insertMember(memberInfo);
		
		if(result > 0) {
			HttpSession session = request.getSession();
			
			if(session.getAttribute("oauthInfo") != null) {
				session.invalidate();
				
				Member loginUser = mService.selectMember(memberInfo.getMemId());
				model.addAttribute("loginUser", loginUser);
				return "redirect:home.do";
			}
			
			return "redirect:loginView.me";
		} else {
			throw new MemberException();
		}
	}
	
	
	/******** by다혜: 회원정보 중복 검사 메소드 ********/
	@RequestMapping("checkId.me")
	@ResponseBody
	public boolean checkId(@RequestParam("memId") String memId, HttpServletResponse response) {
		
		return mService.checkId(memId) == 0 ? true : false;
	}
	
	@RequestMapping("checkNickname.me")
	@ResponseBody
	public boolean checkNickname(@RequestParam("nickname") String nickname, HttpServletResponse response) {
		
		return mService.checkNickname(nickname) < 1 ? true : false;
	}
	
	@RequestMapping("checkPhone.me")
	@ResponseBody
	public boolean checkPhone(@RequestParam("memPhone") String memPhone, HttpServletResponse response) {
		
		return mService.checkPhone(memPhone) < 1 ? true : false;
	}
	
	@RequestMapping("checkEmail.me")
	@ResponseBody
	public boolean checkEmail(@RequestParam("email") String email, HttpServletResponse response) {
		
		return mService.checkEmail(email) < 1 ? true : false;
	}
	
	
	/******** by다혜: 로그인&아웃 메소드 ********/
	@RequestMapping(value = "login.me", method = RequestMethod.POST)
	public String login(@RequestParam("memId") String memId, @RequestParam("memPwd")String pwdInput, Model model) {
		
		Member m = mService.selectMember(memId);
		
		if(m == null) {
			model.addAttribute("msg", "존재하지 않는 아이디입니다.");
			model.addAttribute("url", "loginView.me");
			return "../common/alert";
		}
	
		System.out.println(m);
		String storedPwd =  m.getMemPwd();
		
		System.out.println(m.getMemPwd());
		System.out.println(storedPwd);
		
		if(bcrypt.matches(pwdInput, storedPwd)) {
			model.addAttribute("loginUser", m);
			return "redirect:home.do";
		} else {
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
			model.addAttribute("url", "loginView.me");
			return "../common/alert";
		}
	}
	
	@RequestMapping("logout.me")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:home.do";
	}
	
	
	/******** by다혜: 휴대전화 인증 메세지 발송 ********/
	@RequestMapping(value="validatePhone.me", method=RequestMethod.POST)
	@ResponseBody
	public String validatePhone(@RequestParam("memPhone") String memPhone, HttpServletResponse response) {

		return mApiService.sendMmsRequest(memPhone);
	}
	
	
	/******** by다혜: 이메일 인증 메소드 ********/
	@RequestMapping(value = "validateEmail.me", produces = "application/json; charset=utf8")
	@ResponseBody
	public String validateEmail(@RequestParam("memInfo") String memEmail, @RequestParam("memId") String memId) {
		String code = "";
		int status = 0;
		Member member = new Member();
		member.setMemId(memId);
		member.setMemEmail(memEmail);

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


	
	/******** by다혜: ID 찾기 메소드 ********/
	@RequestMapping(value = "findIdWithPhone.me", method = RequestMethod.POST)
	@ResponseBody
	public String findIdWithPhone(@RequestBody String data) {
		
		return mService.findIdWithPhone(data);
	}

	@RequestMapping(value = "findIdWithEmail.me", method = RequestMethod.POST)
	@ResponseBody
	public String findIdWithEmail(@RequestBody String data) {
		
		return mService.findIdWithEmail(data);
	}
	
	
	/******** by다혜: 비밀번호 변경 메소드 ********/
	@RequestMapping(value="resetPwd.me", method = RequestMethod.POST)
	@ResponseBody
	public String resetPwd(@RequestBody Member member) {
		
		String memPwd= member.getMemPwd();
		String encodedPwd = bcrypt.encode(memPwd);
		member.setMemPwd(encodedPwd);
		
		
		System.out.println(member.getMemId() + ", " + encodedPwd);
		
		System.out.println(mService.resetPwd(member));
		
		return mService.resetPwd(member);
	}
}