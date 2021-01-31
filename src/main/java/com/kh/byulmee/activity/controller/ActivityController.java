package com.kh.byulmee.activity.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;

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
import com.kh.byulmee.board.model.vo.SalesQna;
import com.kh.byulmee.board.service.SalesQnaService;
import com.kh.byulmee.image.model.service.ImageService;
import com.kh.byulmee.image.model.vo.Image;
import com.kh.byulmee.member.model.service.MemberService;
import com.kh.byulmee.member.model.vo.Member;
import com.kh.byulmee.reply.model.service.ReplyService;
import com.kh.byulmee.reply.model.vo.Reply;
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
	private ReplyService rService;
	
	@Autowired 
	private ReviewService rvService;

	
	@RequestMapping("activityList.ac")
	public String activityListView() {
		return "activityList";
	}
	
	@RequestMapping("activityDetail.ac")
	public ModelAndView activityDetail(@RequestParam("acId") int acId, ModelAndView mv, HttpServletRequest request) {
		
		// 활동 게시판 디테일 내용 조회
		Activity activity = aService.selectActivity(acId);
		// 활동 게시판 이미지리스트 조회
		ArrayList<Image> image = iService.selectImage(acId);
		// 활동 게시판 작성자 조회
		Member writer = mService.selectActivityWriter(acId);
		
		String category = null;
		switch(activity.getActCategory()) {
			case 0: category = "액티비티"; break;
			case 1: category = "리빙";  break;
			case 2: category = "건강/미용"; break;
			case 3: category = "힐링"; break;
			case 4: category = "푸드"; break;
			case 5: category = "커리어"; break;
		}
		
		// content textarea에 저장된 값 줄바꿈해서 가져오기
		String contentText = activity.getActContent().replaceAll("\r\n", "<br>");
		
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
		System.out.println(image);
		System.out.println("thumb " + thumb);
		System.out.println("content1 " + content1);
		System.out.println("content2 " + content2);
		System.out.println("content3 " + content3);
		System.out.println("content4 " + content4);
		
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
	
	// 후기 불러오기
	@RequestMapping("salesReviewList.ac")
	public void getReviewList(@RequestParam("acId") int acId, HttpServletResponse response) {
		ArrayList<Review> reviewList = rvService.selectReviewList(acId);
//		ArrayList<Image> image = new ArrayList<Image>();
//		
//		for(int i = 0; i < reviewList.size(); i++) {
//			int revImgNo = reviewList.get(i).getRevNo();
//			image = iService.selectReviewImage(revImgNo);
//		}
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		try {
			gson.toJson(reviewList, response.getWriter());
//			gson.toJson(image, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	// 문의 답변 불러오기
	@RequestMapping("salesQnaReply.ac")
	public void getQnaReply(@RequestParam("qnaNo") int qnaNo, HttpServletResponse response) {
		Reply r = rService.getQnaReply(qnaNo);
		System.out.println(r);
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		try {
			gson.toJson(r, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("activityCheck.ac")
	public ModelAndView activityCheckView(@RequestParam("acId") int acId, @RequestParam("amount") int amount, @RequestParam("all-price2") String price, ModelAndView mv, HttpServletRequest request) {
		
		// 활동 게시판 디테일 내용 조회
		Activity activity = aService.selectActivity(acId);
		// 활동 게시판 이미지리스트 조회
		ArrayList<Image> image = iService.selectImage(acId);
		// 활동 게시판 작성자 조회
		Member writer = mService.selectActivityWriter(acId);
		
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
			  .setViewName("activityCheck");
		} else {
			throw new ActivityException("활동 신청페이지 조회에 실패하였습니다.");
		}
		return mv;
	}
}
