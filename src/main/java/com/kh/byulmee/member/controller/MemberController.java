package com.kh.byulmee.member.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
}
