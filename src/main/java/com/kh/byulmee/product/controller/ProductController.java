package com.kh.byulmee.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.byulmee.activity.model.exception.ActivityException;
import com.kh.byulmee.board.model.vo.SalesQna;
import com.kh.byulmee.board.service.SalesQnaService;
import com.kh.byulmee.image.model.service.ImageService;
import com.kh.byulmee.image.model.vo.Image;
import com.kh.byulmee.member.model.service.MemberService;
import com.kh.byulmee.member.model.vo.Member;
import com.kh.byulmee.product.model.exception.ProductException;
import com.kh.byulmee.product.model.service.ProductService;
import com.kh.byulmee.product.model.vo.Product;
import com.kh.byulmee.review.model.service.ReviewService;
import com.kh.byulmee.review.model.vo.Review;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService pService;
	
	@Autowired
	private ImageService iService;

	@Autowired
	private MemberService mService;
	
	@Autowired 
	private ReviewService rvService;
	
	@Autowired
	private SalesQnaService sqService;
	
	@RequestMapping("productDetail.pd")
	public ModelAndView productDetail(@RequestParam("pdId") int pdId, ModelAndView mv, HttpServletRequest request) {
		
		// 상품 게시판 디테일 내용 조회
		Product product = pService.selectProduct(pdId);
		// 상품 게시판 이미지리스트 조회
		ArrayList<Image> image = iService.selectProductImage(pdId);
		// 상품 게시판 작성자 조회
		Member writer = mService.selectProductWriter(pdId);
		
		// 전체 리뷰 평균 별점 조회
		ArrayList<Review> review = rvService.selectProductReviewAll(pdId);
		int reviewNum = review.size();
		int ratingSum = 0;
		for(int i = 0; i < review.size(); i++) {
			ratingSum += review.get(i).getRevRating();
		}
		double ratingAvg = (double)ratingSum / reviewNum;
		
		// 주문 가능 수량 조회
		int Stock = product.getProStock();
		int orderSum = pService.selectOrderSum(pdId);
		int possibleStock = Stock - orderSum;
		
		String category = null;
		switch(product.getProCategory()) {
			case 0: category = "액티비티"; break;
			case 1: category = "리빙";  break;
			case 2: category = "건강/미용"; break;
			case 3: category = "힐링"; break;
			case 4: category = "푸드"; break;
			case 5: category = "커리어"; break;
		}
		
		// content textarea에 저장된 값 줄바꿈해서 가져오기
		String contentText = product.getProContent().replaceAll("\r\n", "<br>");
		
		// 섬네일 이미지와 본문 이미지(4개) 나누기 
		String thumb = null;
		String content1 = null;
		String content2 = null;
		String content3 = null;
		String content4 = null;
		for(int i = 0; i < image.size(); i++) {
			if(image.get(i).getImgLevel() == 0) {
				thumb = "resources\\auploadFiles\\" + image.get(i).getImgName();
			} else if(image.get(i).getImgLevel() == 1) {
				content1 = "resources\\auploadFiles\\" + image.get(i).getImgName();
			} else if(image.get(i).getImgLevel() == 2) {
				content2 = "resources\\auploadFiles\\" + image.get(i).getImgName();
			} else if(image.get(i).getImgLevel() == 3) {
				content3 = "resources\\auploadFiles\\" + image.get(i).getImgName();
			} else if(image.get(i).getImgLevel() == 4) {
				content4 = "resources\\auploadFiles\\" + image.get(i).getImgName();
			}
		}
		
		if(product != null && image != null) {
			mv.addObject("product", product)
			  .addObject("category", category)
			  .addObject("thumb", thumb)
			  .addObject("content1", content1)
			  .addObject("content2", content2)
			  .addObject("content3", content3)
			  .addObject("content4", content4)
			  .addObject("writer", writer)
			  .addObject("contentText", contentText)
			  .addObject("reviewNum", reviewNum)
			  .addObject("ratingAvg", ratingAvg)
			  .addObject("possibleStock", possibleStock)
			  .setViewName("productDetail");
		} else {
			throw new ProductException("상품 조회에 실패하였습니다.");
		}
		return mv;
	}
	
	// 문의 리스트 불러오기 (최근 5개)
	@RequestMapping("salesQnaProductList.pd")
	public void getQnaList(@RequestParam("pdId") int pdId, HttpServletResponse response) {
		ArrayList<SalesQna> sqList = sqService.selectProductQnaList(pdId);
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		try {
			gson.toJson(sqList, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 문의 리스트 불러오기 (최근 5개 제외한 나머지)
	@RequestMapping("salesQnaExceptProductList.pd")
	public void getQnaExceptList(@RequestParam("pdId") int pdId, HttpServletResponse response) {
		ArrayList<SalesQna> sqList = sqService.selectProductQnaExceptList(pdId);
		System.out.println(sqList);
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		try {
			gson.toJson(sqList, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 후기 불러오기
	@RequestMapping("salesProductReviewList.pd")
	public void getReviewList(@RequestParam("pdId") int pdId, HttpServletResponse response) {
		ArrayList<Review> reviewList = rvService.selectProductReviewList(pdId);
		System.out.println(reviewList);
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		try {
			gson.toJson(reviewList, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 후기 디테일 불러오기
	@RequestMapping("salesProductReviewDetail.pd")
	public void getReviewDetail(@RequestParam("revNo") int revNo, HttpServletResponse response) {
		Review review = rvService.salesProductReviewDetail(revNo);
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		try {
			gson.toJson(review, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 상품 주문 페이지
	@RequestMapping("productCheck.pd")
	public ModelAndView productCheckView(@RequestParam("pdId") int pdId, @RequestParam("amount") int amount, @RequestParam("all-price2") String price, ModelAndView mv, HttpServletRequest request) {
		
		// 상품 게시판 디테일 내용 조회
		Product product = pService.selectProduct(pdId);
		// 상품 게시판 이미지리스트 조회
		ArrayList<Image> image = iService.selectProductImage(pdId);
		// 상품 게시판 작성자 조회
		Member writer = mService.selectProductWriter(pdId);
		
		// 전체 리뷰 평균 별점 조회
		ArrayList<Review> review = rvService.selectProductReviewAll(pdId);
		int reviewNum = review.size();
		int ratingSum = 0;
		for(int i = 0; i < review.size(); i++) {
			ratingSum += review.get(i).getRevRating();
		}
		double ratingAvg = (double)ratingSum / reviewNum;
		
		String category = null;
		switch(product.getProCategory()) {
			case 0: category = "액티비티"; break;
			case 1: category = "리빙";  break;
			case 2: category = "건강/미용"; break;
			case 3: category = "힐링"; break;
			case 4: category = "푸드"; break;
			case 5: category = "커리어"; break;
		}
		
		// 섬네일 이미지
		String thumb = null;
		for(int i = 0; i < image.size(); i++) {
			if(image.get(i).getImgLevel() == 0) {
				thumb = "resources\\auploadFiles\\" + image.get(i).getImgName();
			} 
		}
		
		if(product != null && image != null) {
			mv.addObject("product", product)
			  .addObject("category", category)
			  .addObject("thumb", thumb)
			  .addObject("writer", writer)
			  .addObject("amount", amount)
			  .addObject("price", price)
			  .addObject("reviewNum", reviewNum)
			  .addObject("ratingAvg", ratingAvg)
			  .setViewName("productCheck");
		} else {
			throw new ProductException("상품 구매페이지 조회에 실패하였습니다.");
		}
		return mv;
	}
}