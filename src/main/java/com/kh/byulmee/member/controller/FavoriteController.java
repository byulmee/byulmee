package com.kh.byulmee.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.byulmee.activity.model.exception.ActivityException;
import com.kh.byulmee.member.model.service.FavoriteService;

@Controller
public class FavoriteController {

	@Autowired
	private FavoriteService fService;
	
	@RequestMapping("activityFavorite.fa")
	public String activityFavorite(@RequestParam("acId") int acId) {
		
		int result = fService.insertActivityFavorite(acId);
		
		if(result > 0) {
			return "redirect:activityDetail.ac?acId=" + acId;
		} else {
			throw new ActivityException("활동 찜하기에 실패하였습니다.");
		}
		
	}
}
