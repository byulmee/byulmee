package com.kh.byulmee.product.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.product.model.dao.ProductDAO;
import com.kh.byulmee.product.model.vo.Product;

@Service("pService")
public class ProductServiceImpl implements ProductService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ProductDAO pDAO;

	@Override
	public int insertProduct(Product b) {
		int proNo = pDAO.insertProduct(sqlSession, b);
		return proNo;
	}

	@Override
	public int getListCount() {
		return pDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Product> selectList(PageInfo pi, String memId) {
		return pDAO.selectList(sqlSession, pi, memId);
	}

	@Override
	public Product selectPro(int proNo) {
		return pDAO.selectPro(sqlSession, proNo);
	}

	@Override
	public int proUnableUpdate(int proNo) {
		return pDAO.proUnableUpdate(sqlSession, proNo);
	}

	@Override
	public int proAbleUpdate(int proNo) {
		
		return pDAO.proAbleUpdate(sqlSession, proNo);
	}

	@Override
	public int deletePro(int proNo) {
		return pDAO.deletePro(sqlSession, proNo);
	}

	@Override
	public int updateProduct(Product p) {
		return pDAO.updateProduct(sqlSession, p);
	}

	@Override
	public int getUserListCount(String memId) {
		return pDAO.getUserListCount(sqlSession, memId);
	}

	@Override
	public ArrayList<Product> selectUserList(String memId, PageInfo pi) {
		return pDAO.selectUserList(sqlSession, pi, memId);
	}
	
}
