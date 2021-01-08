package com.kh.byulmee.wookroom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WorkRoomController {
	
	@RequestMapping("wookroomView.wr")
	public String wookRoomViewForm() {
		return "atWorkRoomMainAd";
	}
	
	@RequestMapping("activityInsertForm.wr")
	public String ActivityInsertForm() {
		return "activityInsert";
	}
}
