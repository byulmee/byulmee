package com.kh.byulmee.member.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;


/* by다혜: 회원 관련 서비스 이동 처리 컨트롤러 */
@Controller
public class MemberController {
	
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
	
	@RequestMapping("findPwdWithEmailView.me")
	public String findPwdWithEmailView() {
		return "findPwdWithEmail";
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
}
