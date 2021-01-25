package com.kh.byulmee.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.byulmee.board.model.exception.BoardException;
import com.kh.byulmee.board.model.service.BoardService;
import com.kh.byulmee.board.model.vo.CustomerQna;
import com.kh.byulmee.board.model.vo.Notice;
import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.common.Pagination;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping("ccView.bo")
	public String CustomerCenterForm() {
		return "centerBridge";
	}
	
	@RequestMapping("QnAView.bo")
	public ModelAndView QnAListForm(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = bService.getQnAListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 8);
		
		ArrayList<CustomerQna> list = bService.selectCusQnAList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("QnAList");
		} else {
			throw new BoardException("고객 QnA 전체 조회에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("QnAInsertView.bo")
	public String QnAInsertForm() {
		return "QnAInsert";
	}
	
	@RequestMapping("noticeListView.bo")
	public ModelAndView NoticeListForm(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = bService.getNoticeListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 6);
		
		ArrayList<Notice> list = bService.selectNoticeList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("noticeList");
		} else {
			throw new BoardException("공지사항 전체 조회에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("noticeInsertView.bo")
	public String NoticeInsertForm() {
		return "noticeInsert";
	}
	
	@RequestMapping("notInsert.bo")
	public String NoticeInsert(@ModelAttribute Notice n) {
		
		int result = bService.insertNotice(n);
		
		if(result > 0) {
			return "redirect:noticeListView.bo";
		} else {
			throw new BoardException("공지사항 작성에 실패했습니다.");
		}
	}
	
	@RequestMapping("notDetail.bo")
	public ModelAndView Noticedetail(@RequestParam("notNo") int notNo, @RequestParam("page") int page, ModelAndView mv) {
		
		int result = bService.updateNotCount(notNo);
		
		Notice notice = new Notice();
		
		if(result > 0) {
			notice = bService.selectNotice(notNo);
		}
		
		if(notice != null) {
			mv.addObject("notice", notice);
			mv.addObject("page", page);
			mv.setViewName("noticeDetail");
		} else {
			throw new BoardException("공지사항 조회에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("notUpdateForm.bo")
	public ModelAndView NoticeUpdateForm(@RequestParam("notNo") int notNo, @RequestParam("page") int page, ModelAndView mv) {
		
		Notice notice = bService.selectNotice(notNo);
		
		if(notice != null) {
			mv.addObject("notice", notice);
			mv.addObject("page", page);
			mv.setViewName("noticeUpdate");
		} else {
			throw new BoardException("공지사항 조회에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("notUpdate.bo")
	public ModelAndView NoticeUpdate(@ModelAttribute Notice n, @RequestParam("page") int page, ModelAndView mv) {
		
		int result = bService.updateNotice(n);
		
		if(result > 0) {
			mv.addObject("notNo", n.getNotNo());
			mv.addObject("page", page);
			mv.setViewName("redirect:notDetail.bo");
		} else {
			throw new BoardException("공지사항 업데이트에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("notDelete.bo")
	public ModelAndView NoticeDelete(@RequestParam("notNo") int notNo, @RequestParam("page") int page, ModelAndView mv) {
		
		int result = bService.noticeDelete(notNo);
		
		if(result > 0){
			mv.addObject("page", page);
			mv.setViewName("redirect:noticeListView.bo");
		} else {
			throw new BoardException("공지사항 삭제에 실패했습니다.");
		}
		
		return mv;
	}
}
