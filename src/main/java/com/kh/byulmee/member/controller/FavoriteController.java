package com.kh.byulmee.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.byulmee.activity.model.vo.Activity;
import com.kh.byulmee.member.model.service.FavoriteService;

@Controller
public class FavoriteController {

	@Autowired
	private FavoriteService fService;
	
	@RequestMapping("activityFavorite.fa")
	public String activityFavorite(@RequestParam("acId") int acId) {
		
		int result = fService.insertActivityFavorite(acId);
		
		System.out.println(result);
		
		return null;
	}
}
