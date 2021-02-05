package com.kh.byulmee.activity.controller;

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
import com.kh.byulmee.activity.model.service.ActivityService;
import com.kh.byulmee.activity.model.vo.Activity;
import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.board.model.vo.SalesQna;
import com.kh.byulmee.board.service.SalesQnaService;
import com.kh.byulmee.common.Pagination;
import com.kh.byulmee.image.model.service.ImageService;
import com.kh.byulmee.image.model.vo.Image;
import com.kh.byulmee.member.model.service.MemberService;
import com.kh.byulmee.member.model.vo.Member;
import com.kh.byulmee.review.model.service.ReviewService;
import com.kh.byulmee.review.model.vo.Review;

@Controller
public class ActivityController {
	
	@Autowired
	private ActivityService aService;
	
	@Autowired
	private ImageService iService;
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private SalesQnaService sqService;
	
	@Autowired 
	private ReviewService rvService;

	
//	@RequestMapping("activityList.ac")
//	public String activityListView() {
//		return "activityList";
//	}
//	
	@RequestMapping("activityDetail.ac")
	public ModelAndView activityDetail(@RequestParam("acId") int acId, ModelAndView mv, HttpServletRequest request) {
		
		// 활동 게시판 디테일 내용 조회
		Activity activity = aService.selectActivity(acId);
		// 활동 게시판 이미지리스트 조회
		ArrayList<Image> image = iService.selectImage(acId);
		// 활동 게시판 작성자 조회
		Member writer = mService.selectActivityWriter(acId);
		
		// 전체 리뷰 평균 별점 조회
		ArrayList<Review> review = rvService.selectReviewAll(acId);
		int reviewNum = review.size();
		int ratingSum = 0;
		for(int i = 0; i < review.size(); i++) {
			ratingSum += review.get(i).getRevRating();
		}
		double ratingAvg = (double)ratingSum / reviewNum;
		
		// 활동 신청 가능한 인원수 조회
		int actPeople = activity.getActPeople();
		int orderSum = aService.selectOrderSum(acId);
		int possibleNum = actPeople - orderSum;
		
		String category = null;
		switch(activity.getActCategory()) {
			case 0: category = "액티비티"; break;
			case 1: category = "리빙";  break;
			case 2: category = "건강/미용"; break;
			case 3: category = "힐링"; break;
			case 4: category = "푸드"; break;
			case 5: category = "커리어"; break;
		}
		
		// 본문과 유의사항 textarea에 저장된 값 줄바꿈해서 가져오기
		String contentText = activity.getActContent().replaceAll("\r\n", "<br>");
		String guideText = activity.getActGuide().replaceAll("\r\n", "<br>");
		
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
		
		if(activity != null && image != null) {
			mv.addObject("activity", activity)
			  .addObject("category", category)
			  .addObject("thumb", thumb)
			  .addObject("content1", content1)
			  .addObject("content2", content2)
			  .addObject("content3", content3)
			  .addObject("content4", content4)
			  .addObject("writer", writer)
			  .addObject("contentText", contentText)
			  .addObject("guideText", guideText)
			  .addObject("reviewNum", reviewNum)
			  .addObject("ratingAvg", ratingAvg)
			  .addObject("possibleNum", possibleNum)
			  .setViewName("activityDetail");
		} else {
			throw new ActivityException("활동 조회에 실패하였습니다.");
		}
		return mv;
	}
	
	// 문의 리스트 불러오기 (최근 5개)
	@RequestMapping("salesQnaList.ac")
	public void getQnaList(@RequestParam("acId") int acId, HttpServletResponse response) {
		ArrayList<SalesQna> sqList = sqService.selectQnaList(acId);
		
		System.out.println(acId);
		
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
	@RequestMapping("salesQnaExceptList.ac")
	public void getQnaExceptList(@RequestParam("acId") int acId, HttpServletResponse response) {
		ArrayList<SalesQna> sqList = sqService.selectQnaExceptList(acId);
		
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
	
	// 문의 디테일+답변 불러오기
	@RequestMapping("salesQnaDetail.ac")
	public void getQnaDetail(@RequestParam("qnaNo") int qnaNo, HttpServletResponse response) {
		SalesQna sq = sqService.selectQnaDetail(qnaNo);
		System.out.println(sq);
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		try {
			gson.toJson(sq, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	// 후기 불러오기
	@RequestMapping("salesReviewList.ac")
	public void getReviewList(@RequestParam("acId") int acId, HttpServletResponse response) {
		ArrayList<Review> reviewList = rvService.selectReviewList(acId);
		
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
	@RequestMapping("salesReviewDetail.ac")
	public void getReviewDetail(@RequestParam("revNo") int revNo, HttpServletResponse response) {
		Review review = rvService.selectReviewDetail(revNo);
		
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
	
	// 활동 신청 페이지
	@RequestMapping("activityCheck.ac")
	public ModelAndView activityCheckView(@RequestParam("acId") int acId, @RequestParam("amount") int amount, @RequestParam("all-price2") String price, ModelAndView mv, HttpServletRequest request) {
		
		// 활동 게시판 디테일 내용 조회
		Activity activity = aService.selectActivity(acId);
		// 활동 게시판 이미지리스트 조회
		ArrayList<Image> image = iService.selectImage(acId);
		// 활동 게시판 작성자 조회
		Member writer = mService.selectActivityWriter(acId);
		
		// 전체 리뷰 평균 별점 조회
		ArrayList<Review> review = rvService.selectReviewAll(acId);
		int reviewNum = review.size();
		int ratingSum = 0;
		for(int i = 0; i < review.size(); i++) {
			ratingSum += review.get(i).getRevRating();
		}
		double ratingAvg = (double)ratingSum / reviewNum;
		
		String category = null;
		switch(activity.getActCategory()) {
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
		
		if(activity != null && image != null) {
			mv.addObject("activity", activity)
			  .addObject("category", category)
			  .addObject("thumb", thumb)
			  .addObject("writer", writer)
			  .addObject("amount", amount)
			  .addObject("price", price)
			  .addObject("reviewNum", reviewNum)
			  .addObject("ratingAvg", ratingAvg)
			  .setViewName("activityCheck");
		} else {
			
			throw new ActivityException("활동 신청페이지 조회에 실패하였습니다.");
		}
		return mv;
	}
	

	@RequestMapping("alist.ac")         
    public ModelAndView activityList(@RequestParam(value="page", required=false) Integer page, @RequestParam("actCategory") int actCategory , ModelAndView model) {
                     
		int currentPage = 1;
		if(page != null) {
		     currentPage = page;
		}
		  
		int listCount = aService.getActBoardListCount(actCategory);
		  int code = 1;
		  
		  PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 20);
		  
		  ArrayList<Activity> list = aService.selectList(pi, actCategory);
		  ArrayList<Image> ilist = iService.selectList(code);
  
		  
		  if(list != null) {
			 model.addObject("list", list);
			 model.addObject("pi", pi);
			 model.addObject("ilist", ilist);
			 model.setViewName("activityList");
			 System.out.println("list : "+ list.size());
		  } else {
			  throw new ActivityException("조회에 실패하였습니다.");
		  }
		  return model;
	}
}
