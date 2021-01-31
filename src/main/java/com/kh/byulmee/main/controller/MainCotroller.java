package com.kh.byulmee.main.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.byulmee.activity.model.exception.ActivityException;
import com.kh.byulmee.activity.model.service.ActivityService;
import com.kh.byulmee.activity.model.vo.Activity;
import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.board.model.vo.Pagination;
import com.kh.byulmee.image.model.service.ImageService;
import com.kh.byulmee.member.model.service.MemberService;
import com.kh.byulmee.product.model.vo.service.ProductService;

@Controller
public class MainCotroller {
	
	@Autowired
	private ActivityService aService;
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private ProductService pService;
	
	@Autowired
	private ImageService iService;
	
	/* by다혜, 활동 검색하기 */
	@RequestMapping("searchAct.do")
	public ModelAndView getActSearchResult(@RequestParam(value="page", required=false) Integer page, @RequestParam("keyword") String keyword, ModelAndView mv) {
		
		//키워드 정제
		String match = "[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]";
        keyword = keyword.replaceAll(match, "");
		String[] keywords = keyword.split(" ");
		
		for(String i : keywords) {
			System.out.println(i);
		}
		
		//페이징 처리
		//키워드에 매칭하는 스타, 전체 게시글의 갯수 계산
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int starListCount = mService.getStarSearchListCount(keywords);
		PageInfo starListPi = Pagination.getPageInfoWithPageLimit(5, currentPage, starListCount);
		
		int actListCount = aService.getActSearchListCount(keywords);
		PageInfo actListPi = Pagination.getPageInfo(currentPage, actListCount);
		
		System.out.println(starListCount);
		System.out.println(actListCount);
		
		ArrayList<Activity> starList = mService.getStarSearchResult(starListPi, keywords);
		ArrayList<Activity> actList = aService.getActSearchResult(actListPi, keywords);
		
		System.out.println(starList);
		System.out.println(actList);
		
		if(starList != null && actList != null) {
			mv.addObject("test", "테스트합니다.");
			mv.addObject("keywords", keywords);
			mv.addObject("starListPi", starListPi);
			mv.addObject("actListPi", actListPi);
			mv.addObject("starList", starList);
			mv.addObject("actList", actList);
			mv.setViewName("/activity/activityList");
			
			return mv;
		} else {
			throw new ActivityException("검색 결과 조회에 실패했습니다.\n오류가 지속되면 관리자에게 문의해주세요.");
		}
	}

	@RequestMapping("searchPro.do")
	public ModelAndView getProSearchResult(@RequestParam(value="page", required=false) Integer page, @RequestParam("keyword") String keyword, ModelAndView mv) {
		//키워드 정제
		String match = "[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]";
        keyword = keyword.replaceAll(match, "");
		String[] keywords = keyword.split(" ");
		
		//페이징 처리
		//키워드에 매칭하는 스타, 전체 게시글의 갯수 계산
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int starListCount = mService.getStarSearchListCount(keywords);
		PageInfo starListPi = Pagination.getPageInfoWithPageLimit(5, currentPage, starListCount);
		
		int proListCount = pService.getProSearchListCount(keywords);
		PageInfo proListPi = Pagination.getPageInfo(currentPage, proListCount);
		
		ArrayList<Activity> starList = mService.getStarSearchResult(starListPi, keywords);
		ArrayList<Activity> proList = pService.getProSearchResult(proListPi, keywords);
		
		System.out.println(starList);
		System.out.println(proList);
		
		if(starList != null && proList != null) {
			
			mv.addObject("keywords", keywords);
			mv.addObject("starListPi", starListPi);
			mv.addObject("proListPi", proListPi);
			mv.addObject("starList", starList);
			mv.addObject("proList", proList);
			mv.setViewName("activityList");
	
			
			return mv;
		} else {
			throw new ActivityException("검색 결과 조회에 실패했습니다.\n오류가 지속되면 관리자에게 문의해주세요.");
		}
	}
}
