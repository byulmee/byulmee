package com.kh.byulmee.product.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.common.Pagination;
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
public class productController {
	@Autowired
	private ProductService pService;
	
	@Autowired
	private ImageService iService;
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private ReviewService rvService;
	
	@RequestMapping("plist.pd")         
    public ModelAndView productList(@RequestParam(value="page", required=false) Integer page, @RequestParam("proCategory") int proCategory, ModelAndView model) {
           
		int currentPage = 1;
		if(page != null) {
		     currentPage = page;
		}
		  
		int listCount = pService.ProductListCount(proCategory);
		  int code = 2;
		  
		  PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 20);
		  
		  ArrayList<Product> list = pService.selectList(pi, proCategory);
		  ArrayList<Image> ilist = iService.selectList(code);
 
		  if(list != null) {
			 model.addObject("list", list);
			 model.addObject("pi", pi);
			 model.addObject("ilist", ilist);
			 model.setViewName("productList");
		  } else {
			  throw new ProductException("조회에 실패하였습니다.");
		  }
		  return model;
	}
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
}
