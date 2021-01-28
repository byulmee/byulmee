package com.kh.byulmee.activity.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

	@Autowired
	private ActivityService ActivityService;
	
	@RequestMapping("activityList.ac")
	public String activityListView() {
		return "activityList";
	}
	
	@RequestMapping("activityDetail.ac")
	public ModelAndView activityDetail(@RequestParam("acId") int acId, ModelAndView mv, HttpServletRequest request) {
		
		// �솢�룞 寃뚯떆�뙋 �뵒�뀒�씪 �궡�슜 議고쉶
		Activity activity = aService.selectActivity(acId);
		// �솢�룞 寃뚯떆�뙋 �씠誘몄�由ъ뒪�듃 議고쉶
		ArrayList<Image> image = iService.selectImage(acId);
		// �솢�룞 寃뚯떆�뙋 �옉�꽦�옄 議고쉶
		Member writer = mService.selectActivityWriter(acId);
		
		String category = null;
		switch(activity.getActCategory()) {
			case 0: category = "�븸�떚鍮꾪떚"; break;
			case 1: category = "由щ튃";  break;
			case 2: category = "嫄닿컯/誘몄슜"; break;
			case 3: category = "�옄留�"; break;
			case 4: category = "�뫖�뱶"; break;
			case 5: category = "而ㅻ━�뼱"; break;
		}
		
		// content textarea�뿉 ���옣�맂 媛� 以꾨컮轅덊빐�꽌 媛��졇�삤湲�
		String contentText = activity.getActContent().replaceAll("\r\n", "<br>");
		
		// �꽟�꽕�씪 �씠誘몄��� 蹂몃Ц �씠誘몄�(4媛�) �굹�늻湲� 
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
			throw new ActivityException("�솢�룞 議고쉶�뿉 �떎�뙣�븯���뒿�땲�떎.");
		}
		
		return mv;
	}
	
	// 臾몄쓽 由ъ뒪�듃 遺덈윭�삤湲� (理쒓렐 5媛�)
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
	
	// 臾몄쓽 由ъ뒪�듃 遺덈윭�삤湲� (理쒓렐 5媛� �젣�쇅�븳 �굹癒몄�)
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
	
	// �썑湲� 遺덈윭�삤湲�
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
	
	
	// 臾몄쓽 �떟蹂� 遺덈윭�삤湲�
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
		
		// �솢�룞 寃뚯떆�뙋 �뵒�뀒�씪 �궡�슜 議고쉶
		Activity activity = aService.selectActivity(acId);
		// �솢�룞 寃뚯떆�뙋 �씠誘몄�由ъ뒪�듃 議고쉶
		ArrayList<Image> image = iService.selectImage(acId);
		// �솢�룞 寃뚯떆�뙋 �옉�꽦�옄 議고쉶
		Member writer = mService.selectActivityWriter(acId);
		
		String category = null;
		switch(activity.getActCategory()) {
			case 0: category = "�븸�떚鍮꾪떚"; break;
			case 1: category = "由щ튃";  break;
			case 2: category = "嫄닿컯/誘몄슜"; break;
			case 3: category = "�옄留�"; break;
			case 4: category = "�뫖�뱶"; break;
			case 5: category = "而ㅻ━�뼱"; break;
		}
		
		// �꽟�꽕�씪 �씠誘몄�
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
			throw new ActivityException("�솢�룞 �떊泥��럹�씠吏� 議고쉶�뿉 �떎�뙣�븯���뒿�땲�떎.");
		}
		return mv;
	}

	@RequestMapping("alist.ac")         
    public String activityList(@RequestParam(value="page", required=false) Integer page, Model model) {
                     // (value="page", required=false) --> page��� ���� ���� ���� �ְ� ���� ���� ����
	  int currentPage = 1;
	  if(page != null) {
	     currentPage = page;
	  }
	  
	  int listCount = ActivityService.getListCount();
	  
	  PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
	  
	  ArrayList<Activity> list = ActivityService.selectList(pi);
//	  ArrayList<Activity> list = new ArrayList<Activity>();
	 
	  
	  
	  list.add(new Activity());
	  list.add(new Activity());
//	  list.add(new Activity());
//	  list.add(new Activity());
//	  list.add(new Activity());
//	  list.add(new Activity());
//	  list.add(new Activity());
//	  list.add(new Activity());
//	  list.add(new Activity());
//	  list.add(new Activity());
//	  list.add(new Activity());
//	  list.add(new Activity());
	 
	  
	  
	  System.out.println("list == > " + list);
	  System.out.println("list.size 1== > " + list.size());
	  
	  if(list == null) {
		  throw new ActivityException("조회에 실패하였습니다.");
	  }
  
	 model.addAttribute("list", list);
	 model.addAttribute("pi", pi);
	 System.out.println("list.size 2== > " + list.size());
	 return "activityList";
		 		
	}
//	@RequestMapping("alist.ac")         
//	public ModelAndView activityList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv, HttpServletRequest request) {
//		// (value="page", required=false) --> page��� ���� ���� ���� �ְ� ���� ���� ����
//		String id = ((Member)request.getSession().getAttribute("loginUser")).getMemId();
//		int currentPage = 1;
//		if(page != null) {
//			currentPage = page;
//		}
//		
//		int listCount = ActivityService.getListCount();
//		
//		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
//		ArrayList<Activity> list = ActivityService.selectList(pi);
//		
//		if(list != null) {
//			mv.addObject("list",list);
//			mv.addObject("pi",pi);
//			mv.setViewName("activityList");
//		}else {
//			throw new ActivityException("실패하였습니다.");
//		}
//		
//		return mv;	  
//		
//	}

	
	
	
	
	
	
	
	
	
	@RequestMapping("adetail.bo")
	public ModelAndView activityDetail(@RequestParam("acId") int acId, @RequestParam("page") int page, ModelAndView mv) {
		Activity activity = ActivityService.selectList(acId);
		if(activity != null) {
			mv.addObject("activity",activity)
			.addObject("page",page)
			.setViewName("activityDetail");
		}else {
			throw new ActivityException("실패");
		}
		return mv;
	}
	
}
