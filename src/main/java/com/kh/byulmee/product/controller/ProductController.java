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
import com.kh.byulmee.board.model.vo.Pagination;
import com.kh.byulmee.product.model.service.ProductService;
import com.kh.byulmee.product.model.vo.Product;

@Controller
public class ProductController {
	@Autowired
	private ProductService pService;
	
	@RequestMapping("plist.ac")         
    public String activityList(@RequestParam(value="page", required=false) Integer page, Model model) {
                    
	  int currentPage = 1;
	  if(page != null) {
	     currentPage = page;
	  }
	  
//	  int listCount = ProductService.getListCount();
//	  
//	  PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
//	  
//	  ArrayList<Product> list = ProductService.selectList(pi);
//
//	 
//	  
//	  
//	  list.add(new Product());
//	 
//	 
//	  
//	  
//	  System.out.println("list == > " + list);
//	  
//	  if(list == null) {
//		  throw new ActivityException("조회에 실패하였습니다.");
//	  }
//  
//	 model.addAttribute("list", list);
//	 model.addAttribute("pi", pi);
//	 System.out.println("list.size 2== > " + list.size());
	 return "productList";
		 		
	}
}
