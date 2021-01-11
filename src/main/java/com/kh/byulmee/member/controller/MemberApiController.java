package com.kh.byulmee.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.byulmee.member.model.dto.KakaoProfile;
import com.kh.byulmee.member.model.dto.KakaoToken;
import com.kh.byulmee.member.model.exception.MemberException;
import com.kh.byulmee.member.model.service.MemberApiService;
import com.kh.byulmee.member.model.service.MemberService;
import com.kh.byulmee.member.model.vo.Member;

@SessionAttributes({"loginUser", "oauthInfo"})

/* by다혜: 회원 등록, 인증 처리 컨트롤러 */
@Controller
public class MemberApiController {
	
	@Autowired
	private MemberService mService;
	
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
		boolean result = mService.checkId(memId) == 0 ? true : false;
		
		return result;
	}
	
	@RequestMapping("checkNickname.me")
	@ResponseBody
	public boolean checkNickname(@RequestParam("nickname") String nickname, HttpServletResponse response) {
		boolean result = mService.checkNickname(nickname) < 1 ? true : false;
		
		return result;
	}
	
	@RequestMapping("checkEmail.me")
	@ResponseBody
	public boolean checkEmail(@RequestParam("email") String email, HttpServletResponse response) {
		boolean result = mService.checkEmail(email) < 1 ? true : false;
		
		return result;
	}
	
	
	/******** by다혜: 로그인&아웃 메소드 ********/
	@RequestMapping(value = "login.me", method = RequestMethod.POST)
	public String login(@RequestParam("memId") String memId, @RequestParam("memPwd")String memPwd, Model model) {
		
		Member m = mService.selectMember(memId);
		
		if(m == null) {
			model.addAttribute("msg", "존재하지 않는 아이디입니다.");
			model.addAttribute("url", "loginView.me");
			return "../common/alert";
		}
		
		if(bcrypt.matches(memPwd, m.getMemPwd())) {
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
	
	
	/******** by다혜: 간편 로그인 메소드 ********/
	/*	
	 *  모든 간편 로그인은 최초 로그인 시 반드시 회원 가입 필요
	 */
	
	/* by다혜: kakao 간편 로그인 */
	@RequestMapping(value = "/kakao")
	public ModelAndView kakaoAuth(String code, HttpServletRequest req, HttpServletResponse resp, Model model, ModelAndView mv) {
		KakaoToken kakaoToken = mApiService.getKakaoToken(code);
		KakaoProfile kakaoProfile = mApiService.getKakaoUser(kakaoToken);
		
		//별미에서 사용할 카카오 간편 로그인 아이디 생성 후 아이디가 있는지 조회
		String id = "bmk001" + kakaoProfile.getId();
		Member m = new Member();
		boolean isFirstVisit = mService.checkId(id) < 1 ? true : false;
		
		if(isFirstVisit) {
			m.setMemId(id);
			m.setMemEmail(kakaoProfile.getKakao_account().getEmail());
			model.addAttribute("oauthInfo", m);
			mv.setViewName("member/joinUs");
		} else {
			m = mService.selectMember(id);
			
			if(m == null) {
				throw new MemberException("로그인에 실패하였습니다.");
			}
			
			mv.setViewName("redirect:home.do");
			model.addAttribute("loginUser", m);
		}
		return mv;
	}
}