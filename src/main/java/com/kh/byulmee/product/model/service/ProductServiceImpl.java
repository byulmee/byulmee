package com.kh.byulmee.product.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.byulmee.activity.model.vo.Activity;
import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.image.model.vo.Image;
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

	public int getUserListCount(String memId) {
		return pDAO.getUserListCount(sqlSession, memId);
	}

	@Override
	public ArrayList<Product> selectUserList(String memId, PageInfo pi) {
		return pDAO.selectUserList(sqlSession, pi, memId);
	}

	//상품 검색 결과 게시글 전체 갯수
	@Override
	public int getProSearchListCount(String[] keywords) {
		return pDAO.geProSearchListCount(sqlSession, keywords);
	}
	
	//활동 검색 결과 게시글 전체 리스트
	@Override
	public ArrayList<Activity> getProSearchResult(PageInfo proListPi, String[] keywords) {
		return pDAO.getProSearchResult(sqlSession, proListPi, keywords);
	}

	// 상품 게시판 디테일 내용 조회
	@Override
	public Product selectProduct(int pdId) {
		
		int result = pDAO.addReadCount(sqlSession, pdId);
		
		Product pc = null;
		if(result > 0) {
			pc = pDAO.selectProduct(sqlSession, pdId);
		}
		
		return pc;
	}

	@Override
	public int selectOrderSum(int pdId) {
		return pDAO.selectOrderSum(sqlSession, pdId);
	}	

	@Override
	public ArrayList<Product> getPopularProList() {
		return pDAO.getPopularProList(sqlSession);
	}
	
	@Override
	public int updateProRatingCnt(Product p) {
		return pDAO.updateProRatingCnt(sqlSession, p);
	}

	@Override
	public int ProductListCount(int proCategory) {		
		return pDAO.ProductListCount(sqlSession, proCategory);
	}

	@Override
	public ArrayList<Product> selectList(PageInfo pi, int proCategory) {
			return pDAO.selectList(sqlSession, pi, proCategory);
		}
	}