package com.kh.byulmee.payment.model.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.byulmee.activity.model.service.ActivityService;
import com.kh.byulmee.activity.model.vo.Activity;
import com.kh.byulmee.member.model.service.MemberService;
import com.kh.byulmee.member.model.vo.Member;
import com.kh.byulmee.product.model.service.ProductService;

@Controller
public class PaymentController {

	@Autowired
	private ActivityService aService;
	
	@Autowired
	private ProductService pService;
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping("payment.py")
	public ModelAndView getPayment(@RequestParam("acId") int acId, @RequestParam("memNo") int memNo, ModelAndView mv, HttpServletRequest request) {
		Activity a = aService.selectActivity(acId);
		Member m = mService.selectMemberWithNo(memNo);
		
		System.out.println("acid : "+ acId);
		mv.addObject("a", a);
		mv.addObject("m", m);
		mv.setViewName("payment");
		return mv;
	}
//	@RequestMapping("payment.py")
//	public ModelAndView getPayment(@RequestParam("acId") int acId, ModelAndView mv) {
//		Activity activity = aService.selectActivity(acId);
//		
//		mv.addObject("totAmount", "")
//		.addObject("acId",acId)
//		.setViewName("payment");
//		return mv;
//	}
	
	@RequestMapping("payment-success.py")
	public String getpaymentSuccess() {		
		return "product_pay_Success";
	}
}
