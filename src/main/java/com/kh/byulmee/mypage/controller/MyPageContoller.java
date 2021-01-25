package com.kh.byulmee.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.board.model.vo.Pagination;
import com.kh.byulmee.image.model.service.ImageService;
import com.kh.byulmee.image.model.vo.Image;
import com.kh.byulmee.member.model.exception.MemberException;
import com.kh.byulmee.member.model.vo.Member;
import com.kh.byulmee.mypage.model.service.MypageService;
import com.kh.byulmee.order.model.vo.Order;
import com.kh.byulmee.review.model.vo.Review;

@SessionAttributes("loginUser")

@Controller
public class MyPageContoller {
	
	@Autowired
	private MypageService mpService;
	
	@Autowired
	private ImageService iService;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@RequestMapping("myPurActView.me")
	public ModelAndView myPurActView(@RequestParam(value="page", required=false) Integer page, ModelAndView mv, HttpServletRequest request) {
		String id = ((Member)request.getSession().getAttribute("loginUser")).getMemId();
		
		
		int memNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
		ArrayList<Image> img = mpService.selectProfileImg(memNo);
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = mpService.getOrderListCount(id);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Order> o = mpService.selectOrderList(pi, id);
		if(o != null) {
			mv.addObject("o", o);
			mv.addObject("pi", pi);
			mv.addObject("img", img);
			mv.setViewName("myPurAct");
		} else {
			throw new MemberException("활동 신청 내역 조회에 실패했습니다.");
		}
		
		return mv;
	}
	
	// 상세내역 ajax
	@RequestMapping("detailAct.me")
	public void detailActModal(@RequestParam("ordNo") int ordNo, HttpServletResponse response) {
		ArrayList<Order> oDetail = mpService.selectDetailList(ordNo);
		
		response.setContentType("application/json; charset=UTF-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		try {
			gson.toJson(oDetail, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("myPurProView.me")
	public String myPurProView() {
		return "myPurPro";
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
		}
	}
	
	@RequestMapping("profileImageUpdateView.me")
	public ModelAndView profileImageUpdateView(ModelAndView mv, HttpServletRequest request, Model model) {
		int memNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
		ArrayList<Image> img = mpService.selectProfileImg(memNo);
		
		if(img != null) {
			mv.addObject("img", img);
			mv.setViewName("myProfileImage");
		} else {
			throw new MemberException("프로필사진 변경 페이지 접속에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("profileImgInsert.me")
	public String profileImgInsert(@RequestParam("updateImg") MultipartFile updateImg,
								   HttpServletRequest request, HttpSession session, Model model) {
		int result = 0;
		
		Member m = mpService.memberLogin((Member)session.getAttribute("loginUser"));
		int memNo = m.getMemNo();
		
		Image profileImg = new Image();
		Image i = new Image();
		
		if(updateImg != null && !updateImg.isEmpty()) {
			profileImg = saveProfileImg(updateImg, request);
			
			String imgName = profileImg.getImgName();
			String imgPath = profileImg.getImgPath();
			
			if(imgName != null) {
				i.setImgOrigin(updateImg.getOriginalFilename());
				i.setImgName(imgName);
				i.setImgPath(imgPath);
				i.setImgLevel(0);
				i.setImgRefcode(0);
				i.setImgRefno(Integer.toString(memNo));
			}
			
			result = iService.insertImage(i);
		}
		
		if(memNo > 0 && result > 0) {
			model.addAttribute("msg", "프로필사진이 변경되었습니다.");
			model.addAttribute("url", "profileImageUpdateView.me");
			return "../common/alert";
		} else {
			model.addAttribute("msg", "프로필사진 변경에 실패했습니다.");
			model.addAttribute("url", "profileImageUpdateView.me");
			return "../common/alert";
		}
	}
	
	public Image saveProfileImg(MultipartFile file, HttpServletRequest request) {
		Image i = new Image();
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		// 웹 서버 contextPath를 불러와서 폴더의 결로를 받아옴(webapp 하위의 resources 푤더)
		
		String savePath = root + "\\piUploadFiles";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		int ranNum = (int)(Math.random()*100000);
		
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ranNum + "." 
								+ originFileName.substring(originFileName.lastIndexOf(".") + 1);
		String renamePath = folder + "\\" + renameFileName;
		
		i.setImgPath(renamePath);
		i.setImgName(renameFileName);
		
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return i;
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
	
	@RequestMapping("reviewInsert.me")
	public String insertReview(@ModelAttribute Review r, HttpServletRequest request, HttpSession session,
							   @RequestParam("reviewImgFile1") MultipartFile reviewImgFile1,
							   @RequestParam("reviewImgFile2") MultipartFile reviewImgFile2,
							   @RequestParam("reviewImgFile3") MultipartFile reviewImgFile3,
							   Model model) {
		
		String memId = r.getMemId();
		
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		int revNo = mpService.insertReview(r);
		
		System.out.println("getRevNo : " + r.getRevNo());
		System.out.println("getMemId : " + r.getMemId());
		System.out.println("getRevRating : " + r.getRevRating());
		System.out.println("getRevContent : " + r.getRevContent());
		System.out.println("getRevDate : " + r.getRevDate());
		System.out.println("getRevStatus : " + r.getRevStatus());
		System.out.println("getRevRefcode : " + r.getRevRefcode());
		System.out.println("getRevRefno : " + r.getRevRefno());
		System.out.println("getOrdNo : " + r.getOrdNo());
		
		Image reviewImg = new Image();
		Image i = new Image();
		
		if(reviewImgFile1 != null && !reviewImgFile1.isEmpty()) {
			reviewImg = saveReviewImg(reviewImgFile1, request);
			
			String imgName = reviewImg.getImgName();
			String imgPath = reviewImg.getImgPath();
			
			if(imgName != null) {
				i.setImgOrigin(reviewImgFile1.getOriginalFilename());
				i.setImgName(imgName);
				i.setImgPath(imgPath);
				i.setImgLevel(0);
				i.setImgRefcode(3);
				i.setImgRefno(Integer.toString(revNo));
			}
			
			result1 = iService.insertImage(i);
		}
		
		if(reviewImgFile2 != null && !reviewImgFile2.isEmpty()) {
			reviewImg = saveReviewImg(reviewImgFile2, request);
			
			String imgName = reviewImg.getImgName();
			String imgPath = reviewImg.getImgPath();
			
			if(imgName != null) {
				i.setImgOrigin(reviewImgFile2.getOriginalFilename());
				i.setImgName(imgName);
				i.setImgPath(imgPath);
				i.setImgLevel(1);
				i.setImgRefcode(3);
				i.setImgRefno(Integer.toString(revNo));
			}
			
			result2 = iService.insertImage(i);
		}
		
		if(reviewImgFile3 != null && !reviewImgFile3.isEmpty()) {
			reviewImg = saveReviewImg(reviewImgFile3, request);
			
			String imgName = reviewImg.getImgName();
			String imgPath = reviewImg.getImgPath();
			
			if(imgName != null) {
				i.setImgOrigin(reviewImgFile3.getOriginalFilename());
				i.setImgName(imgName);
				i.setImgPath(imgPath);
				i.setImgLevel(2);
				i.setImgRefcode(3);
				i.setImgRefno(Integer.toString(revNo));
			}
			
			result3 = iService.insertImage(i);
		}
		
		System.out.println("revNo" + revNo + ", " + "result1" + result1 + ", "
						   + "result2" + result2 + ", " + "result3" + result3);
		
		if(revNo > 0) {
			mpService.updateReviewStatus(r);
			model.addAttribute("msg", "리뷰작성이 완료되었습니다.");
			model.addAttribute("url", "myPurActView.me");
			return "../common/alert";
		} else {
			model.addAttribute("msg", "리뷰작성에 실패했습니다.");
			model.addAttribute("url", "myPurActView.me");
			return "../common/alert";
		}
	}
	
	public Image saveReviewImg(MultipartFile file, HttpServletRequest request) {
		Image i = new Image();
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		// 웹 서버 contextPath를 불러와서 폴더의 결로를 받아옴(webapp 하위의 resources 푤더)
		
		String savePath = root + "\\riUploadFiles";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		int ranNum = (int)(Math.random()*100000);
		
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ranNum + "." 
								+ originFileName.substring(originFileName.lastIndexOf(".") + 1);
		String renamePath = folder + "\\" + renameFileName;
		
		i.setImgPath(renamePath);
		i.setImgName(renameFileName);
		
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return i;
	}
}
