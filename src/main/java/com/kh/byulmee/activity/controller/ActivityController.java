package com.kh.byulmee.activity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.byulmee.activity.model.service.ActivityService;
import com.kh.byulmee.activity.model.vo.Activity;

@Controller
public class ActivityController {
	
	@Autowired
	private ActivityService acService;
	
	@RequestMapping("activityList.ac")
	public String activityListView() {
		return "activityList";
	}
	
	@RequestMapping("activityDetail.ac")
	public ModelAndView activityDetailView(@RequestParam("acId") int acId, ModelAndView mv) {
		
		Activity activity = acService.selectActivity(acId);
		
		String category = null;
		switch(activity.getActCategory()) {
		case 0: category = "액티비티"; break;
		case 1: category = "리빙";  break;
		case 2: category = "건강/미용"; break;
		case 3: category = "힐링"; break;
		case 4: category = "푸드"; break;
		case 5: category = "커리어"; break;
		}
		
		if(activity != null) {
			mv.addObject("activity", activity)
			  .addObject("category", category)
			  .setViewName("activityDetail");
		} else {
			mv.addObject("message", "활동 조회에 실패하였습니다.");
			mv.setViewName("../common/errorPage");
		}
		
		return mv;
		
	}
	
	@RequestMapping("activityCheck.ac")
	public String activityCheckView() {
		return "activityCheck";
	}

}
