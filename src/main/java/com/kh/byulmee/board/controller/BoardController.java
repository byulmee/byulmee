package com.kh.byulmee.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.byulmee.board.model.exception.BoardException;
import com.kh.byulmee.board.model.service.BoardService;
import com.kh.byulmee.board.model.vo.CustomerQna;
import com.kh.byulmee.board.model.vo.Notice;
import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.board.model.vo.SearchCondition;
import com.kh.byulmee.common.Pagination;
import com.kh.byulmee.reply.model.service.ReplyService;
import com.kh.byulmee.reply.model.vo.Reply;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	@Autowired
	private ReplyService rService;
	
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
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 8);
		
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
	
	@RequestMapping("cusQnaInsert.bo")
	public String CusQnaInsert(@ModelAttribute CustomerQna c) {
		
		int result = bService.insertCusQna(c);
		
		if(result > 0) {
			return "redirect:QnAView.bo";
		} else {
			throw new BoardException("고객 QnA 등록에 실패했습니다.");
		}
		
	}
	
	@RequestMapping("cusQnADetail.bo")
	public ModelAndView CusQnAdetail(@RequestParam("cusqnaNo") int cusqnaNo, @RequestParam("page") int page, ModelAndView mv) {
		
		int result = bService.updateCusCount(cusqnaNo);
		
		CustomerQna customerqna = new CustomerQna();
		Reply reply = new Reply();
		int refcode = 0;
		int refno = cusqnaNo;
		reply.setRepRefcode(refcode);
		reply.setRepRefno(refno);
		
		if(result > 0) {
			customerqna = bService.selectCusQnA(cusqnaNo);
			reply = rService.selectCusQnaReply(reply);
		}
		
		
		if(customerqna != null) {
			mv.addObject("customerqna", customerqna);
			mv.addObject("page", page);
			mv.addObject("reply", reply);
			mv.setViewName("QnADetail");
		} else {
			throw new BoardException("고객 QnA 상세조회에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("repInsert.bo")
	@ResponseBody
	public String addReply(@ModelAttribute Reply r) {
		
		r.setRepRefcode(0);
		
		int result = rService.cusReplyInsert(r);
		
		if(result > 0) {
			return "success";
		} else {
			throw new BoardException("답변 등록에 실패했습니다.");
		}
		
	}
	
	@RequestMapping("updateCusReply.bo")
	@ResponseBody
	public String updateCusReply(@ModelAttribute Reply r) {
		r.setRepRefcode(0);
		System.out.println(r.getRepContent());
		int result = rService.updateCusReply(r);
		
		if(result > 0) {
			return "success";
		} else {
			throw new BoardException("답변 수정에 실패했습니다.");
		}
	}
	
	@RequestMapping("delCusReply.bo")
	@ResponseBody
	public String deleteCusReply(@RequestParam("repNo") int repNo) {
		
		int result = rService.deleteCusReply(repNo);
		
		if(result > 0) {
			return "success";
		} else {
			throw new BoardException("답변 삭제에 실패했습니다.");
		}
	}
	
	@RequestMapping("cusUpdateForm.bo")
	public ModelAndView cusUpdateForm(@RequestParam("cusqnaNo") int cusqnaNo, @RequestParam("page") int page, ModelAndView mv) {
		
		CustomerQna customerqna = bService.selectCusQnA(cusqnaNo);
		
		if(customerqna != null) {
			mv.addObject("customer", customerqna);
			mv.addObject("page", page);
			mv.setViewName("QnAUpdate");
		} else {
			throw new BoardException("고객 QnA 업데이트에 실패했습니다.");
		}
		
		return mv;
	}

	@RequestMapping("cusUpdate.bo")
	public ModelAndView cusUpdate(@ModelAttribute CustomerQna c, @RequestParam("page") int page, ModelAndView mv) {
		
		int result = bService.updateCusQna(c);
		
		if(result > 0) {
			mv.addObject("cusqnaNo", c.getCusqnaNo());
			mv.addObject("page", page);
			mv.setViewName("redirect:cusQnADetail.bo");
		} else {
			throw new BoardException("고객 QnA 업데이트에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("deleteCusQna.bo")
	public ModelAndView CusQnaDelete(@RequestParam("cusqnaNo") int cusqnaNo, @RequestParam("page") int page, ModelAndView mv) {
		
		int result = bService.cusQnaDelete(cusqnaNo);
		
		if(result > 0) {
			mv.addObject("page", page);
			mv.setViewName("redirect:QnAView.bo");
		} else {
			throw new BoardException("고객 QnA 삭제에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("searchNotice.bo")
	public ModelAndView searchNotice(@RequestParam("searchValue") String searchValue, @RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		String value = searchValue;
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = bService.getSearchNoticeListCount(value);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 8);
		
		ArrayList<Notice> list = bService.selectSearchNoticeList(value, pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("searchValue", value);
			mv.setViewName("noticeList");
		} else {
			throw new BoardException("공지사항 제목 검색 조회에 실패했습니다.");
		}
		return mv;
	}
	
	@RequestMapping("searchCusQna.bo")
	public ModelAndView searchCusQna(@RequestParam("searchValue") String searchValue, @RequestParam("searchCondition") String searchCondition, @RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		int category = 0;
		
		if(searchCondition.equals("category")) {
			if(searchValue.equals("배송")) {
				category = 0;
			} else if(searchValue.equals("환불/반품")) {
				category = 1;
			} else if(searchValue.equals("주문/결제")) {
				category = 2;
			} else if(searchValue.equals("상품정보")) {
				category = 3;
			} else if(searchValue.equals("마이페이지")) {
				category = 4;
			} else if(searchValue.equals("기타")) {
				category = 5;
			} else {
				category = 6;
			}
		}
		
		SearchCondition sc = new SearchCondition();
		if(searchCondition.equals("writer")) {
			sc.setWriter(searchValue);
		} else if(searchCondition.equals("title")) {
			sc.setTitle(searchValue);
		} else if(searchCondition.equals("category")) {
			sc.setCategory(category);
		}
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = bService.getSearchCusListCount(sc);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 8);
		
		ArrayList<CustomerQna> list = bService.selectSearchCusQnAList(sc, pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("searchValue", searchValue);
			mv.addObject("searchCondition", searchCondition);
			mv.setViewName("QnAList");
		} else {
			throw new BoardException("고객 QnA 검색 조회에 실패했습니다.");
		}
		return mv;
	}
}
