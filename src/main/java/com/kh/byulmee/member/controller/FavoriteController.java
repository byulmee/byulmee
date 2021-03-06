package com.kh.byulmee.member.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.byulmee.activity.model.exception.ActivityException;
import com.kh.byulmee.member.model.service.FavoriteService;
import com.kh.byulmee.member.model.vo.Favorite;
import com.kh.byulmee.member.model.vo.Member;
import com.kh.byulmee.product.model.exception.ProductException;

@Controller
public class FavoriteController {

	@Autowired
	private FavoriteService fService;
	
	// 별미 찜하기
	@RequestMapping("activityFavorite.fa")
	public String activityFavorite(HttpSession session, @RequestParam("acId") int acId) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		Favorite fv = new Favorite();
		
		fv.setFavRefno(acId);
		fv.setMemId(loginUser.getMemId());
		
		int result = fService.insertActivityFavorite(fv);
		
		if(result > 0) {
			return "redirect:activityDetail.ac?acId=" + acId;
		} else {
			throw new ActivityException("활동 찜하기에 실패하였습니다.");
		}
	}
	
	// 활동 찜하기
	@RequestMapping("productFavorite.fa")
	public String productFavorite(HttpSession session, @RequestParam("pdId") int pdId) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		Favorite fv = new Favorite();
		
		fv.setFavRefno(pdId);
		fv.setMemId(loginUser.getMemId());
		
		int result = fService.insertProductFavorite(fv);
		
		if(result > 0) {
			return "redirect:productDetail.pd?pdId=" + pdId;
		} else {
			throw new ProductException("상품 찜하기에 실패하였습니다.");
		}
	}
	
	// 스타 찜하기(별미)
	@RequestMapping("starFavoriteInsert.fa")
	public String starFavorite(HttpSession session, @RequestParam("starNo") int starNo, @RequestParam("acId") int acId, HttpServletResponse response) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		Favorite fv = new Favorite();
		
		fv.setFavRefno(starNo);
		fv.setMemId(loginUser.getMemId());
		
		int result = fService.insertStarFavorite(fv);
		
		if(result > 0) {
			return "redirect:activityDetail.ac?acId=" + acId;
		} else {
			throw new ActivityException("스타 찜하기에 실패하였습니다.");
		}
	}
	
	// 스타 찜하기(상품)
	@RequestMapping("starFavoriteInsertProduct.fa")
	public String starFavoriteProduct(HttpSession session, @RequestParam("starNo") int starNo, @RequestParam("pdId") int pdId, HttpServletResponse response) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		Favorite fv = new Favorite();
		
		fv.setFavRefno(starNo);
		fv.setMemId(loginUser.getMemId());
		
		int result = fService.insertStarFavorite(fv);
		
		if(result > 0) {
			return "redirect:productDetail.pd?pdId=" + pdId;
		} else {
			throw new ActivityException("스타 찜하기에 실패하였습니다.");
		}
	}
}
