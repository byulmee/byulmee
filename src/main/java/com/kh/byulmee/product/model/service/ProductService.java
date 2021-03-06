package com.kh.byulmee.product.model.service;

import java.util.ArrayList;

import com.kh.byulmee.activity.model.vo.Activity;
import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.image.model.vo.Image;
import com.kh.byulmee.product.model.vo.Product;

public interface ProductService {

	int insertProduct(Product b);

	int getListCount();

	ArrayList<Product> selectList(PageInfo pi, String memId);

	Product selectPro(int proNo);

	int proUnableUpdate(int proNo);

	int proAbleUpdate(int proNo);

	int deletePro(int proNo);

	int updateProduct(Product p);

	int getUserListCount(String memId);

	ArrayList<Product> selectUserList(String memId, PageInfo pi);
  
	int getProSearchListCount(String[] keywords);

	ArrayList<Activity> getProSearchResult(PageInfo proListPi, String[] keywords);

	Product selectProduct(int pdId);

	int selectOrderSum(int pdId);

	ArrayList<Product> getPopularProList();
	
	int updateProRatingCnt(Product p);

	

	// 상품 조회
	int ProductListCount(int proCategory);

	ArrayList<Product> selectList(PageInfo pi, int proCategory);
	
	
}
