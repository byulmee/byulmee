package com.kh.byulmee.member.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.byulmee.member.model.dto.KakaoProfile;
import com.kh.byulmee.member.model.dto.KakaoToken;
import com.kh.byulmee.member.model.exception.MemberException;
import com.kh.byulmee.member.model.service.MemberService;
import com.kh.byulmee.member.model.vo.Member;


@SessionAttributes("loginUser")

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@Value("#{oauthInfo['grantType']}")
	private String grantType;
	
	@Value("#{oauthInfo['clientId']}")
	private String clientId;
	
	@Value("#{oauthInfo['redirectUri']}")
	private String redirectUri;
	
	@RequestMapping("loginView.me")
	public String loginView() {
		return "login";
	}
	
	@RequestMapping("joinUsView.me")
	public String joinUsView(HttpSession session, SessionStatus status) {
		
		if(session.getAttribute("oauthInfo") != null) {
			status.setComplete();
		}
		return "joinUs";
	}
	
	@RequestMapping("findIdView.me")
	public String findIdView() {
		return "findId";
	}
	
	@RequestMapping("findPwdView.me")
	public String findPwdView() {
		return "findPwd";
	}
	
	@RequestMapping("logout.me")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:home.do";
	}
	
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
	
	@RequestMapping("myPurView.me")
	public String myPurView() {
		return "myPur";
	}
	
	@RequestMapping("myPurActView.me")
	public String myPurActView() {
		return "myPurAct";
	}
	
	@RequestMapping("myPurProView.me")
	public String myPurProView() {
		return "myPurPro";
	}
	
	@RequestMapping("myFavView.me")
	public String myFavView() {
		return "myFav";
	}
	
	@RequestMapping("myFavActView.me")
	public String myFavActView() {
		return "myFavAct";
	}
	
	@RequestMapping("myFavProView.me")
	public String myFavProView() {
		return "myFavPro";
	}
	
	@RequestMapping("myFavStarView.me")
	public String myFavStarView() {
		return "myFavStar";
	}
	
	@RequestMapping("myInfoView.me")
	public String myInfoView() {
		return "myInfo";
	}
	
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
	
	@RequestMapping(value = "/kakao")
	public ModelAndView kakaoAuth(String code, HttpServletRequest req, HttpServletResponse resp, Model model, ModelAndView mv) {
		RestTemplate rt = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8"); //지금 전송할 HTTP 데이터가 key-value 데이터임을 알림
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", clientId);
		params.add("redirect_uri", redirectUri);
		params.add("code", code);
		
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);
		
		ResponseEntity<String> response = rt.exchange(
				"https://kauth.kakao.com/oauth/token",
				HttpMethod.POST,
				kakaoTokenRequest,
				String.class
		);
		
		Gson gson = new Gson();
		KakaoToken kakaoToken = gson.fromJson(response.getBody(), KakaoToken.class);
		
		
		RestTemplate rt2 = new RestTemplate();
		
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + kakaoToken.getAccess_token());
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=UTF-8"); //지금 전송할 HTTP 데이터가 key-value 데이터임을 알림
		
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest = new HttpEntity<>(headers2);
		
		ResponseEntity<String> response2 = rt2.exchange(
				"https://kapi.kakao.com/v2/user/me",
				HttpMethod.POST,
				kakaoProfileRequest,
				String.class
		); 
		
		KakaoProfile kakaoProfile = gson.fromJson(response2.getBody(), KakaoProfile.class);
		
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
		}
		return mv;
	}
}
