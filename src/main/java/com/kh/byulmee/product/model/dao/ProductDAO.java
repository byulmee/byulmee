package com.kh.byulmee.product.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.jdbc.Null;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.byulmee.activity.model.vo.Activity;
import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.product.model.vo.Product;

@Repository("pDAO")
public class ProductDAO {

	public int insertProduct(SqlSessionTemplate sqlSession, Product b) {
		sqlSession.insert("productMapper.insertProduct", b);
		int proNo = b.getProNo();
		return proNo;
	}

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("productMapper.getListCount");
	}

	public ArrayList<Product> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String memId) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("productMapper.selectList", memId, rowBounds);
	}

	public Product selectPro(SqlSessionTemplate sqlSession, int proNo) {
		return sqlSession.selectOne("productMapper.selectPro", proNo);
	}

	public int proUnableUpdate(SqlSessionTemplate sqlSession, int proNo) {
		return sqlSession.update("productMapper.proUnableUpdate", proNo);
	}

	public int proAbleUpdate(SqlSessionTemplate sqlSession, int proNo) {
		return sqlSession.update("productMapper.proAbleUpdate", proNo);
	}

	public int deletePro(SqlSessionTemplate sqlSession, int proNo) {
		return sqlSession.delete("productMapper.deletePro", proNo);
	}

	public int updateProduct(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.update("productMapper.updateProduct", p);
	}

	public int getUserListCount(SqlSessionTemplate sqlSession, String memId) {
		return sqlSession.selectOne("productMapper.getUserListCount", memId);
	}

	public ArrayList<Product> selectUserList(SqlSessionTemplate sqlSession, PageInfo pi, String memId) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("productMapper.selectUserList", memId, rowBounds);
  }
  
	public int geProSearchListCount(SqlSessionTemplate sqlSession, String[] keywords) {
		return sqlSession.selectOne("productMapper.getProSearchListCount", keywords);
	}

	public ArrayList<Activity> getProSearchResult(SqlSessionTemplate sqlSession, PageInfo proListPi, String[] keywords) {
		int offset = (proListPi.getCurrentPage() - 1) * proListPi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, proListPi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("productMapper.proSearchLsit", keywords, rowBounds);
	}

	public Product selectProduct(SqlSessionTemplate sqlSession, int pdId) {
		return sqlSession.selectOne("productMapper.selectProduct", pdId);
	}

	public int addReadCount(SqlSessionTemplate sqlSession, int pdId) {
		return sqlSession.update("productMapper.addReadCount", pdId);
	}

	public int selectOrderSum(SqlSessionTemplate sqlSession, int pdId) {
		return sqlSession.selectOne("productMapper.selectOrderSum", pdId);
	}
	
	public ArrayList<Product> getPopularProList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("productMapper.getPopularProList");
	}

	public int updateProRatingCnt(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.update("productMapper.updateProRatingCnt", p);
	}

	public int ProductListCount(SqlSessionTemplate sqlSession, int proCategory) {
		
		return sqlSession.selectOne("productMapper.ProductListCount", proCategory);
	}

	public ArrayList<Product> selectList(SqlSessionTemplate sqlSession, PageInfo pi, int proCategory) {
			int offset = (pi.getCurrentPage() - 1 ) * pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
			
			return (ArrayList) sqlSession.selectList("productMapper.selectProBoardList",proCategory,rowBounds);
		}
	}

	

	

