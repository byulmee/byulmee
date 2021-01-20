package com.kh.byulmee.mypage.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.byulmee.member.model.vo.Member;
import com.kh.byulmee.mypage.model.service.MypageService;

@SessionAttributes("loginUser")

@Controller
public class MyPageContoller {
	
	@Autowired
	private MypageService mpService;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
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
	
	@RequestMapping("myInfoPwdCheckView.me")
	public String myInfoPwdCheckView() {
		return "myInfoPwdCheck";
	}
	
	@RequestMapping("myInfoPwdCheck.me")
	public String myInfoPwdCheck(@RequestParam("memPwd")String memPwd, Model model, HttpServletRequest request) {

		Member member = (Member) request.getSession().getAttribute("loginUser");
		if(bcrypt.matches(memPwd, member.getMemPwd())) {
			model.addAttribute("loginUser", member);
			return "myInfoUpdate";
		} else {
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
			model.addAttribute("url", "myInfoPwdCheckView.me");
			return "../common/alert";
		}
	}
	
	@RequestMapping("myPageMainView.me")
	public String myPageMainView() {
		return "myPageMain";
	}
	
	
	@RequestMapping("myInfoUpdateView.me")
	public String myInfoUpdateView() {
		return "myInfoUpdate";
	}
	
	@RequestMapping("myInfoUpdate.me")
	public String myInfoUpdate(@ModelAttribute Member m, Model model) {

		int result = mpService.updateMyInfo(m);
		
		Member member = mpService.memberLogin(m);
		
		if(result > 0) {
			model.addAttribute("msg", "개인정보가 변경되었습니다.");
			model.addAttribute("url", "myPageMainView.me");
			model.addAttribute("loginUser", member);
			return "../common/alert";
		} else {
			model.addAttribute("msg", "개인정보 변경에 실패했습니다.");
			model.addAttribute("url", "myInfoUpdateView.me");
			return "../common/alert";
		}
		
	}
	
	@RequestMapping("myPwdUpdateView.me")
	public String myPwdUpdateView() {
		return "myPwdUpdate";
	}
	
	@RequestMapping("myPwdUpdate.me")
	public String updateMyPwd(@RequestParam("memPwd") String pwd,
							  @RequestParam("newPwd1") String newPwd1,
							  @RequestParam("newPwd2") String newPwd2,
							  HttpSession session, HttpServletRequest request, Model model) {
		
		Member m = mpService.memberLogin((Member)session.getAttribute("loginUser"));
		
		if(bcrypt.matches(pwd, m.getMemPwd())) {
			if(newPwd1.equals(newPwd2)) {
				String encNewPwd1 = bcrypt.encode(newPwd1);
				m.setMemPwd(encNewPwd1);
				
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("memId", m.getMemId());
				map.put("newPwd", encNewPwd1);
				
				int result = mpService.updateMyPwd(map);
				
				if(result > 0) {
					model.addAttribute("msg", "비밀번호가 변경되었습니다.");
					model.addAttribute("url", "myPageMainView.me");
					model.addAttribute("loginUser", m);
					return "../common/alert";
				} else {
					model.addAttribute("msg", "비밀번호 수정에 실패했습니다.");
					model.addAttribute("url", "myPwdUpdateView.me");
					return "../common/alert";
				}
			} else {
				model.addAttribute("msg", "비밀번호가 일치하지 않습니다. 다시 확인하시고 입력해주세요.");
				model.addAttribute("url", "myPwdUpdateView.me");
				return "../common/alert";
			}
		} else {
			model.addAttribute("msg", "기존 비밀번호가 틀렸습니다.");
			model.addAttribute("url", "myPwdUpdateView.me");
			return "../common/alert";
//			String referer = request.getHeader("Referer");
//		    return "redirect:"+ referer;
		}
	}
	
	@RequestMapping("memberDeleteView.me")
	public String memberDeleteView() {
		return "memberDelete";
	}
	
	@RequestMapping("mdelete.me")
	public String deleteMember(HttpServletRequest request, SessionStatus status, Model model) {
		String id = ((Member)request.getSession().getAttribute("loginUser")).getMemId();
		
		int result = mpService.deleteMember(id);

		if(result > 0) {
			model.addAttribute("msg", "회원 탈퇴가 완료되었습니다. 지금까지 이용해주셔서 감사합니다.");
			model.addAttribute("url", "home.do");
			status.setComplete();
			return "../common/alert";
		} else {
			model.addAttribute("msg", "회원 탈퇴에 실패했습니다.");
			model.addAttribute("url", "myPageMainView.me");
			return "../common/alert";
		}
		
	}
}
