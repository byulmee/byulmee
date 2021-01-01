package com.kh.byulmee.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@RequestMapping("QnAView.bo")
	public String QnAListForm() {
		return "QnAList";
	}
	
	@RequestMapping("QnAInsertView.bo")
	public String QnAInsertForm() {
		return "QnAInsert";
	}
}
