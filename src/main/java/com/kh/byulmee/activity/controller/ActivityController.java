package com.kh.byulmee.activity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ActivityController {
	
	@RequestMapping("activityList.ac")
	public String activityListView() {
		return "activityList";
	}
	
	@RequestMapping("activityDetail.ac")
	public String activityDetailView() {
		return "activityDetail";
	}
	
	@RequestMapping("activityCheck.ac")
	public String activityCheckView() {
		return "activityCheck";
	}

}
