package com.kh.byulmee.activity.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.byulmee.activity.model.exception.ActivityException;
import com.kh.byulmee.activity.model.service.ActivityService;
import com.kh.byulmee.activity.model.vo.Activity;
import com.kh.byulmee.image.model.service.ImageService;
import com.kh.byulmee.image.model.vo.Image;

@Controller
public class ActivityController {
	
	@Autowired
	private ActivityService aService;
	
	@Autowired
	private ImageService iService;
	
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
		System.out.println(image);
		
		String category = null;
		switch(activity.getActCategory()) {
			case 0: category = "액티비티"; break;
			case 1: category = "리빙";  break;
			case 2: category = "건강/미용"; break;
			case 3: category = "힐링"; break;
			case 4: category = "푸드"; break;
			case 5: category = "커리어"; break;
		}
		String thumb = null;
		ArrayList<String> content = new ArrayList<String>();
		for(int i = 0; i < image.size(); i++) {
			if(image.get(i).getImgLevel() == 0) {
				thumb = "resources\\auploadFiles\\" + image.get(i).getImgName();
			} else {
				content.add("resources\\auploadFiles\\" + image.get(i).getImgName());
			}
		}
		
		System.out.println(thumb);
		System.out.println(content);
		
		if(activity != null && image != null) {
			mv.addObject("activity", activity)
			  .addObject("category", category)
			  .addObject("thumb", thumb)
			  .addObject("content", content)
			  .setViewName("activityDetail");
		} else {
			throw new ActivityException("활동 조회에 실패하였습니다.");
		}
		return mv;
	}
	
	@RequestMapping("activityCheck.ac")
	public String activityCheckView() {
		return "activityCheck";
	}

}
