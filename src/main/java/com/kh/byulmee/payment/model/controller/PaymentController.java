package com.kh.byulmee.payment.model.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.byulmee.activity.model.service.ActivityService;
import com.kh.byulmee.activity.model.vo.Activity;
import com.kh.byulmee.member.model.service.MemberService;
import com.kh.byulmee.member.model.vo.Member;
import com.kh.byulmee.order.model.service.OrderService;
import com.kh.byulmee.order.model.vo.Order;
import com.kh.byulmee.product.model.service.ProductService;

@Controller
public class PaymentController {

	@Autowired
	private ActivityService aService;
	
	@Autowired
	private ProductService pService;
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private OrderService odService;
	
	@RequestMapping("payment.pt")
	public ModelAndView getPayment(@ModelAttribute Order o, @RequestParam("acId") int acId, @RequestParam("memNo") int memNo, ModelAndView mv, HttpServletRequest request) {
		Activity a = aService.selectActivity(acId);
		Member m = mService.selectMemberWithNo(memNo);
		
		mv.addObject("a", a);
		mv.addObject("m", m);
		mv.addObject("o", o);
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
	
	@RequestMapping("payment-success.pt")
	public ModelAndView getpaymentSuccess(@RequestParam("ordPay") int ordPay, @RequestParam("ordCount") int ordCount, @RequestParam("acId") int acId, @RequestParam("memNo") int memNo, ModelAndView mv, HttpServletRequest request) {
		Activity a = aService.selectActivity(acId);
		Member m = mService.selectMemberWithNo(memNo);
		Order o = new Order();
		o.setOrdCount(ordCount);
		o.setOrdPay(ordPay);
		o.setMemId(m.getMemId());
		o.setOrdName(m.getMemName());
		o.setOrdPhone(m.getMemPhone());
		o.setOrdPostcode(m.getMemPostcode());
		o.setOrdBasicaddr(m.getMemBasicAddr());
		o.setOrdDetailaddr(m.getMemDetailAddr());
		o.setOrdPayno("12334556");
		o.setOrdPayWay(1);
		o.setOrdRefcode(0);
		o.setOrdRefno(a.getActNo());
		o.setOrdStarcode(a.getMemId());
		
		int ordNo = odService.insertPayOrder(o);
		
		Order order = odService.selectPayOrder(ordNo);
		
		if(order != null) {
			mv.addObject("a",a);
			mv.addObject("m",m);
			mv.addObject("o", order);
			mv.setViewName("activity_pay_Success");
		}
		
		return mv;
	}
}
