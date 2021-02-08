package com.kh.byulmee.admin.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.byulmee.admin.service.AdminService;
import com.kh.byulmee.banner.model.vo.Banner;
import com.kh.byulmee.board.model.exception.BoardException;
import com.kh.byulmee.board.model.vo.CustomerQna;
import com.kh.byulmee.board.model.vo.Notice;
import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.board.model.vo.Pagination;
import com.kh.byulmee.member.model.exception.MemberException;
import com.kh.byulmee.member.model.vo.Member;
import com.kh.byulmee.order.model.vo.Order;

@Controller
public class AdminController {

	@Autowired
	private AdminService abService;

//	@RequestMapping("adminMain.ad")
//	public String adminMain() {
//		
//		return "admin_main";
//	
//	}
	@RequestMapping("adminMain.ad")
	public ModelAndView adminMainList( ModelAndView mv,HttpServletRequest request) {
		int mResult = abService.getMemberCount();
		int tmResult = abService.getMemberTotal();
		int aoResult = abService.getActivityCount();
		int poResult = abService.getProductCount();
		int oResult = abService.getOdersCount();
		
		if (mResult > 0 && tmResult > 0 && aoResult > 0 && poResult > 0 && oResult > 0 ) {
			mv.addObject("mResult", mResult);
			mv.addObject("tmResult", tmResult);
			mv.addObject("aoResult", aoResult);
			mv.addObject("poResult", poResult);
			mv.addObject("oResult", oResult);
			mv.setViewName("admin_main");
			
			
		}
		else {
			throw new MemberException("매출조회에 실패하였습니다.");
		}
		
		return mv;
	
	}
	
	@RequestMapping("searchId.ad")
	public ModelAndView searchId(@RequestParam(value = "page", required = false) Integer page, @RequestParam("searchId") String searchId, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = abService.getSearchIdListCount(searchId);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Member> list = abService.selectSerachMemberList(pi, searchId);
		
		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("searchId", searchId);
			mv.setViewName("admin_member");

		} else {
			throw new MemberException("회원 조회에 실패했습니다.");
		}
		
		return mv;
	}

	@RequestMapping("adminMember.ad")
	public ModelAndView memberList(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv,
			HttpServletRequest request) {
		String id = ((Member) request.getSession().getAttribute("loginUser")).getMemId();
		System.out.println(id);
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int listCount = abService.getMemberListCount(id);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		ArrayList<Member> list = abService.selectMemberList(pi, id);

		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("admin_member");

		} else {
			throw new MemberException("회원 조회에 실패했습니다.");
		}

		return mv;

	}
	

	@RequestMapping("adminNotice.ad")
	public ModelAndView NoticeList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int code = 1;
		int listCount = abService.getNoticeListCount();
		int listCount2 = abService.getQnAListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		PageInfo pi2 = Pagination.getPageInfo(currentPage, listCount2);
		
		ArrayList<Notice> nlist = abService.selectNoticeList(pi);
		ArrayList<CustomerQna> qlist = abService.selectCusQnAList(pi2);
		
		if(nlist != null && qlist != null) {		
			mv.addObject("qlist", qlist);
			mv.addObject("pi", pi);
			mv.addObject("pi2", pi2);
			mv.addObject("nlist", nlist);
			mv.setViewName("admin_notice");
		} else {
			throw new BoardException("전체 조회에 실패했습니다.");
		}
		
		return mv;
	}	

	@RequestMapping("adminBanner.ad")
	public ModelAndView bannerList(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv,
			HttpServletRequest request) {

		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int listCount = abService.getBannerListCount();

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		ArrayList<Banner> list = abService.selectBannerList(pi);

		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("admin_banner");

		} else {
			throw new BoardException("배너 조회에 실패했습니다.");
		}

		return mv;


	}
	
	@RequestMapping("BannerInsert.ad")
	public String bannerInsert(@RequestParam("updateBan") MultipartFile updateBan,
			@RequestParam("altBan") String altBan,@RequestParam("banUrl") String banUrl, 
			@RequestParam("banBgc") String banBgc, HttpServletRequest request, HttpSession session, Model model) {
		

		
		Banner adminBanner = new Banner();
		Banner ba = new Banner();
		
		if(updateBan != null && !updateBan.isEmpty()) {
			adminBanner = saveAdminBanner(updateBan, request);
			
			String banName = adminBanner.getBanName();
			String banPath = adminBanner.getBanPath();
			//String banAlt = adminBanner.getBanAlt();
			
			if(banName != null) {
				ba.setBanOrigin(updateBan.getOriginalFilename());
				ba.setBanName(banName);
				ba.setBanPath(banPath);
				ba.setBanAlt(altBan);
				ba.setBanUrl(banUrl);
				ba.setBanBgc(banBgc);
			}
				

		}
		int result = abService.insertBanner(ba);
			 
		if(result > 0) {
				 return "redirect:adminBanner.ad";
		} else {
			throw new BoardException("배너 등록에 실패하였습니다");
		}
	
	}
	
	public Banner saveAdminBanner(MultipartFile file, HttpServletRequest request) {
		Banner ba = new Banner();
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		// 웹 서버 contextPath를 불러와 폴더의 경로 받아옴(webapp 하위의 resources 폴더)
		
		String os= System.getProperty("os.name").toLowerCase();
		String savePath;
		if(os.indexOf("mac") >= 0) {
			savePath = root + "/piUploadFiles";
		} else {
			savePath = root + "\\piUploadFiles";
		}
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) 
								+ "." + originFileName.substring(originFileName.lastIndexOf(".") + 1);
		
		String renamePath;
		if(os.indexOf("mac") >= 0) {
			renamePath = folder + "/" + renameFileName;
		} else {
			renamePath = folder + "\\" + renameFileName;
		}
		ba.setBanPath(renamePath);
		ba.setBanName(renameFileName);
		
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return ba;
	}
}