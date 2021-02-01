package com.kh.byulmee.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.byulmee.activity.model.exception.ActivityException;
import com.kh.byulmee.activity.model.service.ActivityService;
import com.kh.byulmee.activity.model.vo.Activity;
import com.kh.byulmee.board.model.vo.SalesQna;
import com.kh.byulmee.board.service.SalesQnaService;
import com.kh.byulmee.product.model.service.ProductService;
import com.kh.byulmee.product.model.vo.Product;

@Controller
public class SalesQnaController {
	
	@Autowired
	private ActivityService aService;
	
	@Autowired
	private SalesQnaService sqService;
	
	@Autowired
	private ProductService pService;
	
	// 활동 문의 작성하기
	@RequestMapping("salesQnaInsertView.sq")
	public ModelAndView insertQnaView(ModelAndView mv, @RequestParam("acId") int acId) {
		
		Activity ac = aService.selectActivity(acId);
		
		if(ac != null) {
			mv.addObject("ac", ac)
			  .setViewName("salesQnaInsertView");
		} else {
			throw new ActivityException("활동 문의 등록 페이지 이동에 실패하였습니다.");
		}
		return mv;
	}

	@RequestMapping("salesQnaInsert.sq")
	public ModelAndView insertQna(@ModelAttribute SalesQna sq, @RequestParam("acId") int acId, @RequestParam("starId") String starId, ModelAndView mv) {
		
		sq.setSalqnaRefcode(0);
		sq.setSalqnaRefno(acId);
		sq.setSalqnaStarcode(starId);
		
		int result = sqService.insertQna(sq);
		
		if(result > 0) {
			mv.addObject("acId", acId)
			  .setViewName("redirect:activityDetail.ac");
		} else {
			throw new ActivityException("활동 문의 등록에 실패하였습니다.");
		}
		return mv;
	}
	
	// 상품 문의 작성하기
	@RequestMapping("salesProductQnaInsertView.sq")
	public ModelAndView insertProductQnaView(ModelAndView mv, @RequestParam("pdId") int pdId) {
		
		Product pd = pService.selectProduct(pdId);
		
		if(pd != null) {
			mv.addObject("pd", pd)
			  .setViewName("salesProductQnaInsertView");
		} else {
			throw new ActivityException("상품 문의 등록 페이지 이동에 실패하였습니다.");
		}
		return mv;
	}
	
	@RequestMapping("salesProductQnaInsert.sq")
	public ModelAndView insertProductQna(@ModelAttribute SalesQna sq, @RequestParam("pdId") int pdId, @RequestParam("starId") String starId, ModelAndView mv) {
		
		sq.setSalqnaRefcode(0);
		sq.setSalqnaRefno(pdId);
		sq.setSalqnaStarcode(starId);
		
		int result = sqService.insertProductQna(sq);
		
		if(result > 0) {
			mv.addObject("pdId", pdId)
			  .setViewName("redirect:productDetail.pd");
		} else {
			throw new ActivityException("상품 문의 등록에 실패하였습니다.");
		}
		return mv;
	}
}
