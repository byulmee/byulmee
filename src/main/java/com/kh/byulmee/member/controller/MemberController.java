package com.kh.byulmee.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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


@SessionAttributes({"loginUser", "oauthInfo"})

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@RequestMapping("loginView.me")
	public String loginView() {
		return "login";
	}
	
	@RequestMapping("joinUsView.me")
	public String joinUsView() {
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
	public String joinUs(@ModelAttribute Member m, Model model, HttpSession session, SessionStatus status) {
		
		status.setComplete();
		
		String encodedPwd = bcrypt.encode(m.getMemPwd());
		m.setMemPwd(encodedPwd);
		
		int result = mService.insertMember(m);
		
		if(result > 0) {
			if(session.getAttribute("oauthInfo") != null) {
				status.isComplete();
				Member loginUser = mService.selectMember(m.getMemId());
				model.addAttribute("loginUser", loginUser);
				return "redirect: home.do";
			}
			
			return "redirect: loginView.me";
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
		System.out.println(memId);
		boolean result = mService.checkId(memId) == 0 ? true : false;
		
		System.out.println(result);
		
		return result;
	}
	
	@RequestMapping("checkNickname.me")
	@ResponseBody
	public boolean checkNickname(@RequestParam("nickname") String nickname, HttpServletResponse response) {
		boolean result = mService.checkNickname(nickname) < 1 ? true : false;
		
		System.out.println(result);
		
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
		
		//Post 방식으로 key=value 데이터를 요청(카카오쪽으로)
		/* java에서 url 요청하는 법 */
		//java 클래스 사용
		//	HttpsURLConnection
		//라이브러리 사용
		//	Retrofit2, OkHttp, RestTemplate
		
		//HTTP 요청을 위한 RestTemplate 객체 생성
		RestTemplate rt = new RestTemplate();
		
		//http 헤더 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8"); //지금 전송할 HTTP 데이터가 key-value 데이터임을 알림
		
		//body의 파라미터 선언
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "8c2d3b0c2a33b21fc67c577be7a832e0");
		params.add("redirect_uri", "http://localhost:9180/kakao");
		params.add("code", code);
		
		//params의 body 데이터와 head를 가진 개체를 생성
		//HttpEntiy에 담는 이유? RestTemplate.exchange()의 파라미터에 필요해서
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);
		
		//요청하기
		//	파라미터: 주소, 전송방식, http 객체, 응답받을 타입
		ResponseEntity<String> response = rt.exchange(
				"https://kauth.kakao.com/oauth/token",
				HttpMethod.POST,
				kakaoTokenRequest,
				String.class
		);
		
		//요청 받은 값을 담기
		//json, Gson, Simple, ObjectMapper
		Gson gson = new Gson();
		KakaoToken kakaoToken = gson.fromJson(response.getBody(), KakaoToken.class);
		
		
		//사용자 정보 가져오기
		RestTemplate rt2 = new RestTemplate();
		
		//http 헤더 생성
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + kakaoToken.getAccess_token());
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=UTF-8"); //지금 전송할 HTTP 데이터가 key-value 데이터임을 알림
		
		//header2를 담은 객체 생성
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest = new HttpEntity<>(headers2);
		
		//요청하기
		ResponseEntity<String> response2 = rt2.exchange(
				"https://kapi.kakao.com/v2/user/me",
				HttpMethod.POST,
				kakaoProfileRequest,
				String.class
		); 
		
		KakaoProfile kakaoProfile = gson.fromJson(response2.getBody(), KakaoProfile.class);
		
		String id = "k" + kakaoProfile.getId();
		
		boolean isFirstVisit = mService.checkId(id) < 1 ? true : false;
		
		Member m = new Member();
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
			
			model.addAttribute("loginUser", m);
			mv.setViewName("../index");
		}
		return mv;
	}
}
