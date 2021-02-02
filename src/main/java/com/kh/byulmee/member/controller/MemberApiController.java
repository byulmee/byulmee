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

@SessionAttributes("loginUser")

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
		System.out.println(memId);
		System.out.println(mService.checkId(memId) == 0 ? true : false);
		
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
	
		String storedPwd =  m.getMemPwd();
		
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
		
		return mService.resetPwd(member);
	}
}