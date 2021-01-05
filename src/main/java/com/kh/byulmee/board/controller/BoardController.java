package com.kh.byulmee.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@RequestMapping("ccView.bo")
	public String CustomerCenterForm() {
		return "centerBridge";
	}
	
	@RequestMapping("QnAView.bo")
	public String QnAListForm() {
		return "QnAList";
	}
	
	@RequestMapping("QnAInsertView.bo")
	public String QnAInsertForm() {
		return "QnAInsert";
	}
	
	@RequestMapping("noticeListView.bo")
	public String NoticeListForm() {
		return "noticeList";
	}
	
	@RequestMapping("noticeInsertView.bo")
	public String NoticeInsertForm() {
		return "noticeInsert";
	}
}
