package com.kh.byulmee.product.model.service;

import java.util.ArrayList;

import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.product.model.vo.Product;

public interface ProductService {

	int insertProduct(Product b);

	int getListCount();

	ArrayList<Product> selectList(PageInfo pi);

	Product selectPro(int proNo);

	int proUnableUpdate(int proNo);

	int proAbleUpdate(int proNo);

	int deletePro(int proNo);

	int updateProduct(Product p);

	int updateProRatingCnt(Product p);

}
