package com.kh.byulmee.product.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.byulmee.activity.model.exception.ActivityException;
import com.kh.byulmee.activity.model.vo.Activity;
import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.common.Pagination;
import com.kh.byulmee.product.model.exception.ProductException;
import com.kh.byulmee.product.model.service.ProductService;
import com.kh.byulmee.product.model.vo.Product;

@Controller
public class ProductController {
	@Autowired
	private ProductService	ProductService;
	
	@RequestMapping("plist.pd")         
    public String productList(@RequestParam(value="page", required=false) Integer page, Model model) {
                     // (value="page", required=false) --> page��� ���� ���� ���� �ְ� ���� ���� ����
	  int currentPage = 1;
	  if(page != null) {
	     currentPage = page;
	  }
	  
	  int listCount = ProductService.getListCount();
	  
	  
	  PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
	  
	  ArrayList<Product> list = ProductService.selectList(pi);
	  
	  list.add(new Product());
	  list.add(new Product());
	  
	  
	  System.out.println("list == > " + list);
	  System.out.println("list.size 1== > " + list.size());
	  
	  if(list == null) {
		  throw new ProductException("조회에 실패하였습니다.");
	  }
  
	 model.addAttribute("list", list);
	 model.addAttribute("pi", pi);
	 System.out.println("list.size 2== > " + list.size());
	 return "productList";
		 		
	}
	
}
//	@RequestMapping("plist.ac")         
//	public ModelAndView activityList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv, HttpServletRequest request) {	
//		int currentPage = 1;
//		if(page != null) {
//			currentPage = page;
//		}
//		
//		int listCount = ProductService.getListCount();
//		
//		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
//		ArrayList<Product> list = ProductService.selectList(pi);
//		
//		if(list != null) {
//			mv.addObject("list",list);
//			mv.addObject("pi",pi);
//			mv.setViewName("productList");
//		}else {
//			throw new ProductException("조회에 실패하였습니다.");
//		}
//		
//		return mv;	  
//		
//	}
//}
