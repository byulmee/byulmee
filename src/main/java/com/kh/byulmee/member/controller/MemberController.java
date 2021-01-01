package com.kh.byulmee.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

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
	public String joinUs(@ModelAttribute Member m) {
		
		String encodedPwd = bcrypt.encode(m.getMemPwd());
		m.setMemPwd(encodedPwd);
		
		int result = mService.insertMember(m);
		
		if(result > 0) {
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
	
	@RequestMapping("checkId.me")
	public void checkId(@RequestParam("memId") String memId, HttpServletResponse response) {
		boolean result = mService.checkId(memId) == 0 ? true : false;
		try {
			response.getWriter().print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("checkNickname.me")
	public void checkNickname(@RequestParam("nickname") String nickname, HttpServletResponse response) {
		boolean result = mService.checkNickname(nickname) == 0 ? true : false;
		try {
			response.getWriter().print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("checkEmail.me")
	public void checkEmail(@RequestParam("email") String email, HttpServletResponse response) {
		boolean result = mService.checkEmail(email) == 0 ? true : false;
		try {
			response.getWriter().print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
