package com.kh.byulmee.wookroom.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.byulmee.activity.model.exception.ActivityException;
import com.kh.byulmee.activity.model.service.ActivityService;
import com.kh.byulmee.activity.model.vo.Activity;
import com.kh.byulmee.board.model.exception.SalesQnaException;
import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.board.model.vo.SalesQna;
import com.kh.byulmee.board.service.SalesQnaService;
import com.kh.byulmee.common.Pagination;
import com.kh.byulmee.image.model.service.ImageService;
import com.kh.byulmee.image.model.vo.Image;
import com.kh.byulmee.member.model.exception.MemberException;
import com.kh.byulmee.member.model.service.FavoriteService;
import com.kh.byulmee.member.model.service.MemberService;
import com.kh.byulmee.member.model.vo.Favorite;
import com.kh.byulmee.member.model.vo.Member;
import com.kh.byulmee.mypage.model.service.MypageService;
import com.kh.byulmee.order.model.exception.OrderException;
import com.kh.byulmee.order.model.service.OrderService;
import com.kh.byulmee.order.model.vo.Order;
import com.kh.byulmee.order.model.vo.OrderSearch;
import com.kh.byulmee.product.model.exception.ProductException;
import com.kh.byulmee.product.model.service.ProductService;
import com.kh.byulmee.product.model.vo.Product;
import com.kh.byulmee.reply.model.service.ReplyService;
import com.kh.byulmee.reply.model.vo.Reply;

@Controller
public class WorkRoomController {
	
	@Autowired
	private ActivityService aService;
	
	@Autowired
	private ImageService iService;
	
	@Autowired
	private ProductService pService;
	
	@Autowired
	private MypageService mpService;
	
	@Autowired
	private SalesQnaService sqService;
	
	@Autowired
	private ReplyService rService;
	
	@Autowired
	private OrderService odService;
	
	@Autowired
	private MemberService mService;
	
	@Autowired 
	private FavoriteService fService;
	
	@RequestMapping("pdWorkRoomUser.wr")
	public ModelAndView pdWorkRoomUserMain(@RequestParam(value="page", required=false) Integer page, @RequestParam("memNo") int memNo, @RequestParam("memId") String memId, 
											ModelAndView mv, HttpServletRequest request) {
		
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getMemId();
		Image img = mpService.selectProfileImg(memNo);
		Member writer = mService.selectMember(memId);
		
		Favorite f = new Favorite(); 
		int refcode = 0; 
		f.setMemId(userId);
		f.setFavRefcode(refcode); 
		f.setFavRefno(memNo);
		
		int favCount = fService.selectStarFavorite(f);
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int code = 2;
		int listCount = pService.getUserListCount(memId);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 6);
		
		ArrayList<Product> plist = pService.selectUserList(memId, pi);
		ArrayList<Image> ilist = iService.selectList(code);
		
		if(plist != null && ilist != null) {
			mv.addObject("plist", plist);
			mv.addObject("pi", pi);
			mv.addObject("ilist", ilist);
			mv.addObject("img", img);
			mv.addObject("writer", writer);
			mv.addObject("memNo", memNo);
			mv.addObject("memId", memId);
			mv.addObject("favCount", favCount);
			//mv.addObject("favorite", favorite);
			mv.setViewName("pdWorkRoomMainUser");
		} else {
			throw new ProductException("상품 조회에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("acWorkRoomMain.wr")
	public ModelAndView acWorkRoomMain(@RequestParam(value="page", required=false) Integer page, @RequestParam("memNo") int memNo, @RequestParam("memId") String memId, 
										ModelAndView mv, HttpServletRequest request) {

		String userId = ((Member)request.getSession().getAttribute("loginUser")).getMemId();
		Image img = mpService.selectProfileImg(memNo);
		Member writer = mService.selectMember(memId);

		Favorite f = new Favorite(); 
		int refcode = 0; 
		f.setMemId(userId);
		f.setFavRefcode(refcode); 
		f.setFavRefno(memNo);
		
		int favCount = fService.selectStarFavorite(f);
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int code = 1;
		int listCount = aService.getUserListCount(memId);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 6);
		
		ArrayList<Activity> alist = aService.selectUserList(memId, pi);
		ArrayList<Image> ilist = iService.selectList(code);
		
		if(alist != null && ilist != null) {
			mv.addObject("alist", alist);
			mv.addObject("pi", pi);
			mv.addObject("ilist", ilist);
			mv.addObject("img", img);
			mv.addObject("writer", writer);
			mv.addObject("memNo", memNo);
			mv.addObject("memId", memId);
			mv.addObject("favCount", favCount);
			//mv.addObject("favorite", favorite);
			mv.setViewName("atWorkRoomMainUser");
		} else {
			throw new ActivityException("활동상품 조회에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("starFavInsert.wr")
	@ResponseBody
	public String starFavInsert(@RequestParam("memId") String memId, @RequestParam("favRefno") int favRefno) {
		
		Favorite f = new Favorite();
		f.setMemId(memId);
		f.setFavRefno(favRefno);
		f.setFavRefcode(0);

		
		int result = fService.starFavInsert(f);
		
		if(result > 0) {
			return "success";
		}  else {
			throw new MemberException("스타 찜하기에 실패했습니다.");		
		}
	}
	
	@RequestMapping("starFavDelete.wr")
	@ResponseBody
	public String starFavDelete(@RequestParam("memId") String memId, @RequestParam("favRefno") int favRefno) {
		
		Favorite f = new Favorite();
		f.setMemId(memId);
		f.setFavRefno(favRefno);
		f.setFavRefcode(0);

		
		int result = fService.starFavDelete(f);
		
		if(result > 0) {
			return "success";
		}  else {
			throw new MemberException("스타 찜하기 취소에 실패했습니다.");		
		}
	}
	
	@RequestMapping("orderView.wr")
	public ModelAndView OrderViewForm(@RequestParam(value="page", required=false) Integer page, ModelAndView mv, HttpServletRequest request) {
		int memNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
		Image img = mpService.selectProfileImg(memNo);
		String memId = ((Member)request.getSession().getAttribute("loginUser")).getMemId();
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int listCount = odService.getListCount(memId);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 13);
		
		ArrayList<Order> odlist = odService.selectOdList(pi, memId);
		
		if(odlist != null) {
			mv.addObject("odlist", odlist);
			mv.addObject("pi", pi);
			mv.addObject("img", img);
			mv.setViewName("orderWorkRoom");
		} else {
			throw new OrderException("고객주문 조회에 실패했습니다.");
		}
		 
		return mv;
	}
	
	@RequestMapping("updateOrder.wr")
	@ResponseBody
	public String updateOrder(@ModelAttribute Order o) {
		
		int result = odService.updateOrder(o);
		
		if(result > 0) {
			return "success";
		} else {
			throw new OrderException("고객주문 업데이트에 실패했습니다.");
		}
	}
	
	@RequestMapping("pdorderView.wr")
	public ModelAndView pdorderView(@RequestParam(value="page", required=false) Integer page, ModelAndView mv, HttpServletRequest request) {
		int memNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
		Image img = mpService.selectProfileImg(memNo);
		String memId = ((Member)request.getSession().getAttribute("loginUser")).getMemId();
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int listCount = odService.getpdListCount(memId);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 13);
		
		ArrayList<Order> odlist = odService.selectOdPdList(pi, memId);
		
		if(odlist != null) {
			mv.addObject("odlist", odlist);
			mv.addObject("pi", pi);
			mv.addObject("img", img);
			mv.setViewName("pdorderWorkRoom");
		} else {
			throw new OrderException("고객주문 조회에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("searchAcOrder.wr")
	public ModelAndView searchAcOrder(@RequestParam("searchId") String searchId, @RequestParam("startday") Date startday, @RequestParam("endday") Date endday, 
										@RequestParam(value="page", required=false) Integer page, ModelAndView mv, HttpServletRequest request) {
		int memNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
		Image img = mpService.selectProfileImg(memNo);
		String memId = ((Member)request.getSession().getAttribute("loginUser")).getMemId();
		
		int refcode = 0;
		
		OrderSearch os = new OrderSearch();
		os.setSearchId(searchId);
		os.setStartday(startday);
		os.setEndday(endday);
		os.setRefcode(refcode);
		os.setStarcode(memId);
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = odService.getSearchAcListCount(os);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 13);
		
		ArrayList<Order> odlist = odService.selectAcOrder(os, pi);
		
		if(odlist != null) {
			mv.addObject("odlist", odlist);
			mv.addObject("pi", pi);
			mv.addObject("img", img);
			mv.addObject("searchId", searchId);
			mv.addObject("startday", startday);
			mv.addObject("endday", endday);
			mv.setViewName("orderWorkRoom");
		} else {
			throw new OrderException("고객주문 검색에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("searchPdOrder.wr")
	public ModelAndView searchPdOrder(@RequestParam("searchId") String searchId, @RequestParam("startday") Date startday, @RequestParam("endday") Date endday, 
										@RequestParam(value="page", required=false) Integer page, ModelAndView mv, HttpServletRequest request){
		int memNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
		Image img = mpService.selectProfileImg(memNo);
		String memId = ((Member)request.getSession().getAttribute("loginUser")).getMemId();
		
		int refcode = 1;
		
		OrderSearch os = new OrderSearch();
		os.setSearchId(searchId);
		os.setStartday(startday);
		os.setEndday(endday);
		os.setRefcode(refcode);
		os.setStarcode(memId);
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = odService.getSearchPdListCount(os);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 13);
		
		ArrayList<Order> odlist = odService.selectPdOrder(os, pi);
		
		if(odlist != null) {
			mv.addObject("odlist", odlist);
			mv.addObject("pi", pi);
			mv.addObject("img", img);
			mv.addObject("searchId", searchId);
			mv.addObject("startday", startday);
			mv.addObject("endday", endday);
			mv.setViewName("pdorderWorkRoom");
		} else {
			throw new OrderException("고객주문 검색에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("customerView.wr")
	public ModelAndView customerViewForm(@RequestParam(value="page", required=false) Integer page, ModelAndView mv, HttpServletRequest request) {
		int memNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
		Image img = mpService.selectProfileImg(memNo);
		String memId = ((Member)request.getSession().getAttribute("loginUser")).getMemId();
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int listCount = sqService.getListCount(memId);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 16);
		ArrayList<SalesQna> sqlist = sqService.selectSalQnaList(pi, memId);
		
		if(sqlist != null) {
			mv.addObject("sqlist", sqlist);
			mv.addObject("pi", pi);
			mv.addObject("img", img);
			mv.setViewName("customerWorkRoom");
		} else {
			throw new SalesQnaException("고객문의 조회에 실패했습니다.");
		}
		
		//"customerWorkRoom"
		return mv;
	}
	
	@RequestMapping("salqnaDetail.wr")
	public ModelAndView salqnaDetailForm(@RequestParam("salqnaNo") int salqnaNo, @RequestParam("page") int page, @RequestParam("salqnaType") String salqnaType, 
											ModelAndView mv) {
		int refcode = 0;
		if(salqnaType.equals("A")) {
			refcode = 1;
		} else {
			refcode = 2;
		}
		Reply reply = new Reply();
		reply.setRepRefcode(refcode);
		reply.setRepRefno(salqnaNo);
		
		SalesQna salesqna = sqService.selectSalQna(salqnaNo);
		reply = rService.selectSalQna(reply);
		
		if(salesqna != null) {
			mv.addObject("salesqna", salesqna);
			mv.addObject("reply", reply);
			mv.addObject("refcode", refcode);
			mv.addObject("page", page);
			mv.setViewName("salQnaDetail");
		}  else {
			throw new SalesQnaException("고객문의 조회에 실패했습니다.");
		}
		
		
		return mv;
	}
	
	@RequestMapping("salrepInsert.wr")
	@ResponseBody
	public String salrepInsert(@RequestParam("memId") String memId, @RequestParam("repContent") String repContent, @RequestParam("repRefno") int repRefno, @RequestParam("repRefcode") String repRefcode) {
		int setCode = 0;
		if(repRefcode.equals("A")) {
			setCode = 1;
		} else {
			setCode = 2;
		}
		
		Reply r = new Reply();
		r.setMemId(memId);
		r.setRepContent(repContent);
		r.setRepRefcode(setCode);
		r.setRepRefno(repRefno);
		
		int result = rService.cusReplyInsert(r);
		
		if(result > 0) {
			int result1 = sqService.updateSalstatus(repRefno);
			if(result1 > 0) {
				return "success";
			}  else {
				throw new SalesQnaException("답변 등록에 실패했습니다.");
			}
		}  else {
			throw new SalesQnaException("답변 등록에 실패했습니다.");
		}
	}
	
	@RequestMapping("updateSalReply.wr")
	@ResponseBody
	public String updateSalReply(@ModelAttribute Reply r) {
		
		int result = rService.updateSalReply(r);
		
		if(result > 0) {
			return "success";
		} else {
			throw new SalesQnaException("답변 수정에 실패했습니다.");
		}
	}
	
	@RequestMapping("deleteSalQna.wr")
	public ModelAndView SalQnaDelete(@RequestParam("salqnaNo") int salqnaNo, @RequestParam("page") int page, ModelAndView mv) {
		
		int result = sqService.salQnaDelete(salqnaNo);
		
		if(result > 0) {
			mv.addObject("page", page);
			mv.setViewName("redirect:customerView.wr");
		} else {
			throw new SalesQnaException("답변 삭제에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("salQnaUpdateForm.wr")
	public ModelAndView salUpdateForm(@RequestParam("salqnaNo") int salqnaNo, @RequestParam("page") int page, ModelAndView mv) {
		
		SalesQna salesqna = sqService.selectSalQna(salqnaNo);
		
		if(salesqna != null) {
			mv.addObject("salesqna", salesqna);
			mv.addObject("page", page);
			mv.setViewName("salQnAUpdate");
		} else {
			throw new SalesQnaException("고객 QnA 업데이트에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("salQnaUpdate.wr")
	public ModelAndView salQnaUpdate(@ModelAttribute SalesQna s, @RequestParam("page") int page, ModelAndView mv) {

		int result = sqService.salQnaUpdate(s);
		
		if(result > 0) {
			mv.addObject("salqnaNo", s.getSalqnaNo());
			mv.addObject("salqnaType", s.getSalqnaType());
			mv.addObject("page", page);
			mv.setViewName("redirect:salqnaDetail.wr");
		} else {
			throw new SalesQnaException("고객 QnA 업데이트에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("delSalReply.wr")
	@ResponseBody
	public String deleteSalReply(@RequestParam("repNo") int repNo, @RequestParam("repRefno") int repRefno) {
		
		int result = rService.deleteSalReply(repNo);
		
		if(result > 0) {
			int result1 = sqService.unUpdateSalstatus(repRefno);
			if(result1 > 0) {
				return "success";
			} else {
				throw new SalesQnaException("답변 삭제에 실패했습니다.");		
			}
		}  else {
			throw new SalesQnaException("답변 삭제에 실패했습니다.");
		}
	}
	
	@RequestMapping("wookroomView.wr")
	public ModelAndView ActivityViewForm(@RequestParam(value="page", required=false) Integer page, ModelAndView mv, HttpServletRequest request) {
		int memNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
		Image img = mpService.selectProfileImg(memNo);
		String memId = ((Member)request.getSession().getAttribute("loginUser")).getMemId();
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int code = 1;
		int listCount = aService.getListCount(memId);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 6);
		
		ArrayList<Activity> alist = aService.selectList(memId, pi);
		ArrayList<Image> ilist = iService.selectList(code);
		
		if(alist != null && ilist != null) {
			mv.addObject("alist", alist);
			mv.addObject("pi", pi);
			mv.addObject("ilist", ilist);
			mv.addObject("img", img);
			mv.setViewName("atWorkRoomMainAd");
		} else {
			throw new ActivityException("활동상품 조회에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("activityInsertForm.wr")
	public String ActivityInsertForm() {
		return "activityInsert";
	}
	
	@RequestMapping("productView.wr")
	public ModelAndView ProductViewForm(@RequestParam(value="page", required=false) Integer page, ModelAndView mv,  HttpServletRequest request) {
		int memNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
		Image img = mpService.selectProfileImg(memNo);
		String memId = ((Member)request.getSession().getAttribute("loginUser")).getMemId();
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int code = 2;
		int listCount = pService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 6);
		
		ArrayList<Product> plist = pService.selectList(pi, memId);
		ArrayList<Image> ilist = iService.selectList(code);
		
		if(plist != null && ilist != null) {
			mv.addObject("plist", plist);
			mv.addObject("pi", pi);
			mv.addObject("ilist", ilist);
			mv.addObject("img", img);
			mv.setViewName("pdWorkRoomMainAd");
		} else {
			throw new ProductException("상품 조회에 실패했습니다.");
		}
		
		
		return mv;
	}
	
	@RequestMapping("productInsertForm.wr")
	public String ProductInsertForm() {
		return "productInsert";
	}
	
	@RequestMapping("ainsert.wr")
	public String ActivityInsert(@ModelAttribute Activity a, @RequestParam("thumbnailImg5") MultipartFile thumbnailImg5, 
									@RequestParam("thumbnailImg1") MultipartFile thumbnailImg1,
									@RequestParam("thumbnailImg2") MultipartFile thumbnailImg2, 
									@RequestParam("thumbnailImg3") MultipartFile thumbnailImg3, 
									@RequestParam("thumbnailImg4") MultipartFile thumbnailImg4,
									HttpServletRequest request) {
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		int result4 = 0;
		int result5 = 0;
		int actNo = aService.insertActivity(a);
		
		Image ri = new Image();
		Image i = new Image();
		
		System.out.println(actNo);
		if(thumbnailImg5 != null && !thumbnailImg5.isEmpty()) {
			
			ri = saveFile(thumbnailImg5, request);
			
			String imgName = ri.getImgName();
			String imgPath = ri.getImgPath();
			
			if(imgName != null) {
				i.setImgName(imgName);
				i.setImgOrigin(thumbnailImg5.getOriginalFilename());
				i.setImgRefcode(1);
				i.setImgRefno(actNo);
				i.setImgPath(imgPath);
				i.setImgLevel(0);
			}
			
			result1 = iService.insertImage(i);
		}
		
		if(thumbnailImg1 != null && !thumbnailImg1.isEmpty()) {
			
			ri = saveFile(thumbnailImg1, request);
			
			String imgName = ri.getImgName();
			String imgPath = ri.getImgPath();
			
			if(imgName != null) {
				i.setImgName(imgName);
				i.setImgOrigin(thumbnailImg1.getOriginalFilename());
				i.setImgRefcode(1);
				i.setImgRefno(actNo);
				i.setImgPath(imgPath);
				i.setImgLevel(1);
			}
			
			result2 = iService.insertImage(i);
		}
		
		if(thumbnailImg2 != null && !thumbnailImg2.isEmpty()) {
			
			ri = saveFile(thumbnailImg2, request);
			
			String imgName = ri.getImgName();
			String imgPath = ri.getImgPath();
			
			if(imgName != null) {
				i.setImgName(imgName);
				i.setImgOrigin(thumbnailImg2.getOriginalFilename());
				i.setImgRefcode(1);
				i.setImgRefno(actNo);
				i.setImgPath(imgPath);
				i.setImgLevel(2);
			}
			
			result3 = iService.insertImage(i);
		}
		
		if(thumbnailImg3 != null && !thumbnailImg3.isEmpty()) {
			
			ri = saveFile(thumbnailImg3, request);
			
			String imgName = ri.getImgName();
			String imgPath = ri.getImgPath();
			
			if(imgName != null) {
				i.setImgName(imgName);
				i.setImgOrigin(thumbnailImg3.getOriginalFilename());
				i.setImgRefcode(1);
				i.setImgRefno(actNo);
				i.setImgPath(imgPath);
				i.setImgLevel(3);
			}
			
			result4 = iService.insertImage(i);
		}
		
		if(thumbnailImg4 != null && !thumbnailImg4.isEmpty()) {
			
			ri = saveFile(thumbnailImg4, request);
			
			String imgName = ri.getImgName();
			String imgPath = ri.getImgPath();
			
			if(imgName != null) {
				i.setImgName(imgName);
				i.setImgOrigin(thumbnailImg4.getOriginalFilename());
				i.setImgRefcode(1);
				i.setImgRefno(actNo);
				i.setImgPath(imgPath);
				i.setImgLevel(4);
			}
			
			result5 = iService.insertImage(i);
		}
		
		if(actNo > 0 && (result1 > 0 || result2 > 0 || result3 > 0 || result4 > 0 || result5 > 0 )) {
			return "redirect:wookroomView.wr";
		} else {
			throw new ActivityException("활동상품 등록에 실패했습니다.");
		}
		
	}
	
	@RequestMapping("pinsert.wr")
	public String ProductInsert(@ModelAttribute Product b, @RequestParam("thumbnailImg5") MultipartFile thumbnailImg5, 
								@RequestParam("thumbnailImg1") MultipartFile thumbnailImg1,
								@RequestParam("thumbnailImg2") MultipartFile thumbnailImg2, 
								@RequestParam("thumbnailImg3") MultipartFile thumbnailImg3, 
								@RequestParam("thumbnailImg4") MultipartFile thumbnailImg4,
								HttpServletRequest request) {
		
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		int result4 = 0;
		int result5 = 0;
		int proNo = pService.insertProduct(b);
		
		Image ri = new Image();
		Image i = new Image();
		
		if(thumbnailImg5 != null && !thumbnailImg5.isEmpty()) {
			
			ri = saveFile(thumbnailImg5, request);
			
			String imgName = ri.getImgName();
			String imgPath = ri.getImgPath();
			
			if(imgName != null) {
				i.setImgName(imgName);
				i.setImgOrigin(thumbnailImg5.getOriginalFilename());
				i.setImgRefcode(2);
				i.setImgRefno(proNo);
				i.setImgPath(imgPath);
				i.setImgLevel(0);
			}
			
			result1 = iService.insertImage(i);
		}
		
		if(thumbnailImg1 != null && !thumbnailImg1.isEmpty()) {
			
			ri = saveFile(thumbnailImg1, request);
			
			String imgName = ri.getImgName();
			String imgPath = ri.getImgPath();
			
			if(imgName != null) {
				i.setImgName(imgName);
				i.setImgOrigin(thumbnailImg1.getOriginalFilename());
				i.setImgRefcode(2);
				i.setImgRefno(proNo);
				i.setImgPath(imgPath);
				i.setImgLevel(1);
			}
			
			result2 = iService.insertImage(i);
		}
		
		if(thumbnailImg2 != null && !thumbnailImg2.isEmpty()) {
			
			ri = saveFile(thumbnailImg2, request);
			
			String imgName = ri.getImgName();
			String imgPath = ri.getImgPath();
			
			if(imgName != null) {
				i.setImgName(imgName);
				i.setImgOrigin(thumbnailImg2.getOriginalFilename());
				i.setImgRefcode(2);
				i.setImgRefno(proNo);
				i.setImgPath(imgPath);
				i.setImgLevel(2);
			}
			
			result3 = iService.insertImage(i);
		}
		
		if(thumbnailImg3 != null && !thumbnailImg3.isEmpty()) {
			
			ri = saveFile(thumbnailImg3, request);
			
			String imgName = ri.getImgName();
			String imgPath = ri.getImgPath();
			
			if(imgName != null) {
				i.setImgName(imgName);
				i.setImgOrigin(thumbnailImg3.getOriginalFilename());
				i.setImgRefcode(2);
				i.setImgRefno(proNo);
				i.setImgPath(imgPath);
				i.setImgLevel(3);
			}
			
			result4 = iService.insertImage(i);
		}
		
		if(thumbnailImg4 != null && !thumbnailImg4.isEmpty()) {
			
			ri = saveFile(thumbnailImg4, request);
			
			String imgName = ri.getImgName();
			String imgPath = ri.getImgPath();
			
			if(imgName != null) {
				i.setImgName(imgName);
				i.setImgOrigin(thumbnailImg4.getOriginalFilename());
				i.setImgRefcode(2);
				i.setImgRefno(proNo);
				i.setImgPath(imgPath);
				i.setImgLevel(4);
			}
			
			result5 = iService.insertImage(i);
		}

		if(proNo > 0 && (result1 > 0 || result2 > 0 || result3 > 0 || result4 > 0 || result5 > 0 ) ) {
			return "redirect:productView.wr";
		} else {
			throw new ProductException("상품 등록에 실패했습니다.");
		}
	}
	
	
	
	public Image saveFile(MultipartFile file, HttpServletRequest request) {
		Image i = new Image();
		//"C:\\dev\\Final_byulmee\\byulmee\\src\\main\\webapp\\resources";
		String root = request.getSession().getServletContext().getRealPath("resources");
		// 웹 서버 contextPath를 불러와 폴더의 경로 받아옴(webapp 하위의 resources 폴더 )
		System.out.println(root);
		String savePath = root + "\\auploadFiles";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		int ranNum = (int)(Math.random()*100000);
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ranNum 
								+ "." + originFileName.substring(originFileName.lastIndexOf(".") + 1);
		String renamePath = folder + "\\" + renameFileName;
		i.setImgPath(renamePath);
		i.setImgName(renameFileName);
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// DB에 저장할 용도로 리턴하는 값
		return i;
	}
	
	@RequestMapping("actupdateform.wr")
	public ModelAndView actUpdateFormView(@RequestParam("actNo") int actNo, @RequestParam("page") int page, ModelAndView mv) {
		Image i = new Image();
		i.setImgRefcode(1);
		i.setImgRefno(actNo);
		Activity activity = aService.selectAct(actNo);
		ArrayList<Image> ilist = iService.selectImgList(i);
		
		if(activity != null && ilist != null) {
			mv.addObject("activity", activity);
			mv.addObject("ilist", ilist);
			mv.addObject("page", page);
			mv.setViewName("activityUpdate");
		} else {
			throw new ActivityException("활동상품수정 페이지로 이동을 실패했습니다.");
		}
		
		return mv;
	}
	
	// 비활성화
	@RequestMapping("actunable.wr")
	public ModelAndView activityUnable(@RequestParam("actNo") int actNo, @RequestParam("page") int page, ModelAndView mv) {
		
		int result = aService.actUnableUpdate(actNo);
		
		if(result > 0) {
			mv.addObject("page", page);
			mv.addObject("actNo", actNo);
			mv.setViewName("redirect:actupdateform.wr");
		} else {
			throw new ActivityException("활동 상품 비활성화를 실패했습니다.");
		}
		
		return mv;
	}
	
	// 활성화
	@RequestMapping("actable.wr")
	public ModelAndView activityAble(@RequestParam("actNo") int actNo, @RequestParam("page") int page, ModelAndView mv) {
		
		int result = aService.actAbleUpdate(actNo);
		
		if(result > 0) {
			mv.addObject("page", page);
			mv.addObject("actNo", actNo);
			mv.setViewName("redirect:actupdateform.wr");
		} else {
			throw new ActivityException("활동 상품 활성화를 실패했습니다.");
		}
		
		return mv;
	}
	
	// 게시물 삭제
	@RequestMapping("delActivity.wr")
	public ModelAndView delActivity(@RequestParam("actNo") int actNo, @RequestParam("page") int page, HttpServletRequest request, 
								@RequestParam("imgName1") String imgName1, @RequestParam("imgName2") String imgName2, 
								@RequestParam("imgName3") String imgName3, @RequestParam("imgName4") String imgName4, 
								@RequestParam("imgName5") String imgName5, ModelAndView mv) {
		if(imgName1 != null) {
			deleteFile(imgName1, request);
		}
		if(imgName2 != null) {
			deleteFile(imgName2, request);
		}
		if(imgName3 != null) {
			deleteFile(imgName3, request);
		}
		if(imgName4 != null) {
			deleteFile(imgName4, request);
		}
		if(imgName5 != null) {
			deleteFile(imgName5, request);
		}
		Image i = new Image();
		i.setImgRefcode(1);
		i.setImgRefno(actNo);
		
		int iresult = iService.deleteImage(i); 
		int aresult = aService.deleteAct(actNo);
		
		if(iresult > 0 && aresult > 0) {
			mv.addObject("page", page);
			mv.setViewName("redirect:wookroomView.wr");
		} else {
			throw new ActivityException("활동 상품 삭제를 실패했습니다.");
		}
		
		return mv;
	}
	
	// 사진 실제 삭제
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\auploadFiles";
		
		File f = new File(savePath + "\\" + fileName);
		
		if(f.exists()) {
			f.delete();
		}
	}
	
	@RequestMapping("aupdate.wr")
	public ModelAndView ActivityUpdate(@ModelAttribute Activity a, @RequestParam("thumbnailImg5") MultipartFile thumbnailImg5, 
			@RequestParam("thumbnailImg1") MultipartFile thumbnailImg1,
			@RequestParam("thumbnailImg2") MultipartFile thumbnailImg2, 
			@RequestParam("thumbnailImg3") MultipartFile thumbnailImg3, 
			@RequestParam("thumbnailImg4") MultipartFile thumbnailImg4,
			HttpServletRequest request,  @RequestParam("page") int page,
			@RequestParam("imgName1") String imgName1, @RequestParam("imgName2") String imgName2, 
			@RequestParam("imgName3") String imgName3, @RequestParam("imgName4") String imgName4, 
			@RequestParam("imgName5") String imgName5, ModelAndView mv) {
		
		int result = 0; 
		int result1 = 0;
		int result2 = 0; 
		int result3 = 0; 
		int result4 = 0; 
		int result5 = 0;
		int imgLev = 0;
		Image ri = new Image();
		Image i = new Image();
		Image deli = new Image();
		
		if(thumbnailImg5 != null && !thumbnailImg5.isEmpty()) {
			if(imgName1 != null) {
				deleteFile(imgName1, request);
				imgLev = 0;
				deli.setImgName(imgName1);
				deli.setImgLevel(imgLev);
				iService.delImg(deli);
			}
			
			ri = saveFile(thumbnailImg5, request);
			
			String imgName = ri.getImgName();
			String imgPath = ri.getImgPath();
			
			if(imgName != null) {
				i.setImgName(imgName);
				i.setImgOrigin(thumbnailImg5.getOriginalFilename());
				i.setImgRefcode(1);
				i.setImgRefno(a.getActNo());
				i.setImgPath(imgPath);
				i.setImgLevel(0);
			}
			
			result1 = iService.insertImage(i);
		}
		if(thumbnailImg1 != null && !thumbnailImg1.isEmpty()) {
			if(imgName2 != null) {
				deleteFile(imgName2, request);
				imgLev = 1;
				deli.setImgName(imgName2);
				deli.setImgLevel(imgLev);
				iService.delImg(deli);
			}
			
			
			ri = saveFile(thumbnailImg1, request);
			
			String imgName = ri.getImgName();
			String imgPath = ri.getImgPath();
			
			if(imgName != null) {
				i.setImgName(imgName);
				i.setImgOrigin(thumbnailImg1.getOriginalFilename());
				i.setImgRefcode(1);
				i.setImgRefno(a.getActNo());
				i.setImgPath(imgPath);
				i.setImgLevel(1);
			}
			
			result2 = iService.insertImage(i);
		}
		
		if(thumbnailImg2 != null && !thumbnailImg2.isEmpty()) {
			if(imgName3 != null) {
				deleteFile(imgName3, request);
				imgLev = 2;
				deli.setImgName(imgName3);
				deli.setImgLevel(imgLev);
				iService.delImg(deli);
			}
			
			
			ri = saveFile(thumbnailImg2, request);
			
			String imgName = ri.getImgName();
			String imgPath = ri.getImgPath();
			
			if(imgName != null) {
				i.setImgName(imgName);
				i.setImgOrigin(thumbnailImg2.getOriginalFilename());
				i.setImgRefcode(1);
				i.setImgRefno(a.getActNo());
				i.setImgPath(imgPath);
				i.setImgLevel(2);
			}
			
			result3 = iService.insertImage(i);
		}
		
		if(thumbnailImg3 != null && !thumbnailImg3.isEmpty()) {
			if(imgName4 != null) {
				deleteFile(imgName4, request);
				imgLev = 3;
				deli.setImgName(imgName4);
				deli.setImgLevel(imgLev);
				iService.delImg(deli);
			}
			
			
			ri = saveFile(thumbnailImg3, request);
			
			String imgName = ri.getImgName();
			String imgPath = ri.getImgPath();
			
			if(imgName != null) {
				i.setImgName(imgName);
				i.setImgOrigin(thumbnailImg3.getOriginalFilename());
				i.setImgRefcode(1);
				i.setImgRefno(a.getActNo());
				i.setImgPath(imgPath);
				i.setImgLevel(3);
			}
			
			result4 = iService.insertImage(i);
		}
		
		if(thumbnailImg4 != null && !thumbnailImg4.isEmpty()) {
			if(imgName5 != null) {
				deleteFile(imgName5, request);
				imgLev = 4;
				deli.setImgName(imgName5);
				deli.setImgLevel(imgLev);
				iService.delImg(deli);
			}
			
			
			ri = saveFile(thumbnailImg4, request);
			
			String imgName = ri.getImgName();
			String imgPath = ri.getImgPath();
			
			if(imgName != null) {
				i.setImgName(imgName);
				i.setImgOrigin(thumbnailImg4.getOriginalFilename());
				i.setImgRefcode(1);
				i.setImgRefno(a.getActNo());
				i.setImgPath(imgPath);
				i.setImgLevel(4);
			}
			
			result5 = iService.insertImage(i);
		}
		
		result = aService.updateActivity(a);
		
		if(result > 0 || ( result1 > 0 || result2 > 0 || result3 > 0 || result4 > 0 || result5 > 0 )) {
			mv.addObject("page", page);
			mv.setViewName("redirect:wookroomView.wr");
		} else {
			throw new ActivityException("활동상품 수정에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("proupdateform.wr")
	public ModelAndView proUpdateFormView(@RequestParam("proNo") int proNo, @RequestParam("page") int page, ModelAndView mv) {
		Image i = new Image();
		i.setImgRefcode(2);
		i.setImgRefno(proNo);
		Product product = pService.selectPro(proNo);
		ArrayList<Image> ilist = iService.selectImgList(i);
		
		if(product != null && ilist != null) {
			mv.addObject("product", product);
			mv.addObject("ilist", ilist);
			mv.addObject("page", page);
			mv.setViewName("productUpdate");
		} else {
			throw new ProductException("상품 업데이트 뷰 이동을 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("prounable.wr")
	public ModelAndView productUnable(@RequestParam("proNo") int proNo, @RequestParam("page") int page, ModelAndView mv) {
		
		int result = pService.proUnableUpdate(proNo);
		
		if(result > 0) {
			mv.addObject("page", page);
			mv.addObject("proNo", proNo);
			mv.setViewName("redirect:proupdateform.wr");
		} else {
			throw new ProductException("상품 비활성화에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("proable.wr")
	public ModelAndView productAble(@RequestParam("proNo") int proNo, @RequestParam("page") int page, ModelAndView mv) {
		int result = pService.proAbleUpdate(proNo);
		
		if(result > 0) {
			mv.addObject("page", page);
			mv.addObject("proNo", proNo);
			mv.setViewName("redirect:proupdateform.wr");
		} else {
			throw new ProductException("상품 활성화에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("delproduct.wr")
	public ModelAndView delProduct(@RequestParam("proNo") int proNo, @RequestParam("page") int page, HttpServletRequest request, 
								@RequestParam("imgName1") String imgName1, @RequestParam("imgName2") String imgName2, 
								@RequestParam("imgName3") String imgName3, @RequestParam("imgName4") String imgName4, 
								@RequestParam("imgName5") String imgName5, ModelAndView mv) {
		if(imgName1 != null) {
			deleteFile(imgName1, request);
		}
		if(imgName2 != null) {
			deleteFile(imgName2, request);
		}
		if(imgName3 != null) {
			deleteFile(imgName3, request);
		}
		if(imgName4 != null) {
			deleteFile(imgName4, request);
		}
		if(imgName5 != null) {
			deleteFile(imgName5, request);
		}
		Image i = new Image();
		i.setImgRefcode(2);
		i.setImgRefno(proNo);
		
		int iresult = iService.deleteImage(i);
		int presult = pService.deletePro(proNo);
		
		if(iresult > 0 && presult > 0) {
			mv.addObject("page", page);
			mv.setViewName("redirect:productView.wr");
		} else {
			throw new ProductException("상품 삭제에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("pupdate.wr")
	public ModelAndView ProductUpdate(@ModelAttribute Product p, @RequestParam("thumbnailImg5") MultipartFile thumbnailImg5, 
			@RequestParam("thumbnailImg1") MultipartFile thumbnailImg1,
			@RequestParam("thumbnailImg2") MultipartFile thumbnailImg2, 
			@RequestParam("thumbnailImg3") MultipartFile thumbnailImg3, 
			@RequestParam("thumbnailImg4") MultipartFile thumbnailImg4,
			HttpServletRequest request,  @RequestParam("page") int page,
			@RequestParam("imgName1") String imgName1, @RequestParam("imgName2") String imgName2, 
			@RequestParam("imgName3") String imgName3, @RequestParam("imgName4") String imgName4, 
			@RequestParam("imgName5") String imgName5, ModelAndView mv) {
		
		int result = 0; 
		int result1 = 0;
		int result2 = 0; 
		int result3 = 0; 
		int result4 = 0; 
		int result5 = 0;
		int imgLev = 0;
		Image ri = new Image();
		Image i = new Image();
		Image deli = new Image();
		
		if(thumbnailImg5 != null && !thumbnailImg5.isEmpty()) {
			if(imgName1 != null) {
				deleteFile(imgName1, request);
			}
			imgLev = 0;
			deli.setImgName(imgName1);
			deli.setImgLevel(imgLev);
			iService.delImg(deli);
			
			ri = saveFile(thumbnailImg5, request);
			
			String imgName = ri.getImgName();
			String imgPath = ri.getImgPath();
			
			if(imgName != null) {
				i.setImgName(imgName);
				i.setImgOrigin(thumbnailImg5.getOriginalFilename());
				i.setImgRefcode(2);
				i.setImgRefno(p.getProNo());
				i.setImgPath(imgPath);
				i.setImgLevel(0);
			}
			
			result1 = iService.insertImage(i);
		}
		if(thumbnailImg1 != null && !thumbnailImg1.isEmpty()) {
			if(imgName2 != null) {
				deleteFile(imgName2, request);
			}
			imgLev = 1;
			deli.setImgName(imgName2);
			deli.setImgLevel(imgLev);
			iService.delImg(deli);
			
			ri = saveFile(thumbnailImg1, request);
			
			String imgName = ri.getImgName();
			String imgPath = ri.getImgPath();
			
			if(imgName != null) {
				i.setImgName(imgName);
				i.setImgOrigin(thumbnailImg1.getOriginalFilename());
				i.setImgRefcode(2);
				i.setImgRefno(p.getProNo());
				i.setImgPath(imgPath);
				i.setImgLevel(1);
			}
			
			result2 = iService.insertImage(i);
		}
		
		if(thumbnailImg2 != null && !thumbnailImg2.isEmpty()) {
			if(imgName3 != null) {
				deleteFile(imgName3, request);
			}
			imgLev = 2;
			deli.setImgName(imgName3);
			deli.setImgLevel(imgLev);
			iService.delImg(deli);
			
			ri = saveFile(thumbnailImg2, request);
			
			String imgName = ri.getImgName();
			String imgPath = ri.getImgPath();
			
			if(imgName != null) {
				i.setImgName(imgName);
				i.setImgOrigin(thumbnailImg2.getOriginalFilename());
				i.setImgRefcode(2);
				i.setImgRefno(p.getProNo());
				i.setImgPath(imgPath);
				i.setImgLevel(2);
			}
			
			result3 = iService.insertImage(i);
		}
		
		if(thumbnailImg3 != null && !thumbnailImg3.isEmpty()) {
			if(imgName4 != null) {
				deleteFile(imgName4, request);
			}
			imgLev = 3;
			deli.setImgName(imgName4);
			deli.setImgLevel(imgLev);
			iService.delImg(deli);
			
			ri = saveFile(thumbnailImg3, request);
			
			String imgName = ri.getImgName();
			String imgPath = ri.getImgPath();
			
			if(imgName != null) {
				i.setImgName(imgName);
				i.setImgOrigin(thumbnailImg3.getOriginalFilename());
				i.setImgRefcode(2);
				i.setImgRefno(p.getProNo());
				i.setImgPath(imgPath);
				i.setImgLevel(3);
			}
			
			result4 = iService.insertImage(i);
		}
		
		if(thumbnailImg4 != null && !thumbnailImg4.isEmpty()) {
			if(imgName5 != null) {
				deleteFile(imgName5, request);
			}
			imgLev = 4;
			deli.setImgName(imgName5);
			deli.setImgLevel(imgLev);
			iService.delImg(deli);
			
			ri = saveFile(thumbnailImg4, request);
			
			String imgName = ri.getImgName();
			String imgPath = ri.getImgPath();
			
			if(imgName != null) {
				i.setImgName(imgName);
				i.setImgOrigin(thumbnailImg4.getOriginalFilename());
				i.setImgRefcode(2);
				i.setImgRefno(p.getProNo());
				i.setImgPath(imgPath);
				i.setImgLevel(4);
			}
			
			result5 = iService.insertImage(i);
		}
		
		result = pService.updateProduct(p);
		
		if(result > 0 || ( result1 > 0 || result2 > 0 || result3 > 0 || result4 > 0 || result5 > 0 )) {
			mv.addObject("page", page);
			mv.setViewName("redirect:productView.wr");
		} else {
			throw new ProductException("상품 수정에 실패했습니다.");
		}
		
		return mv;
	}
}
