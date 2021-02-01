package com.kh.byulmee.product.model.dao;

import java.util.ArrayList;

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

	public ArrayList<Product> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("productMapper.selectList", null, rowBounds);
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

	public int geProSearchListCount(SqlSessionTemplate sqlSession, String[] keywords) {
		return sqlSession.selectOne("productMapper.getProSearchListCount", keywords);
	}

	public ArrayList<Activity> getProSearchResult(SqlSessionTemplate sqlSession, PageInfo proListPi, String[] keywords) {
		int offset = (proListPi.getCurrentPage() - 1) * proListPi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, proListPi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("productMapper.proSearchLsit", keywords, rowBounds);
	}

	public ArrayList<Product> getPopularProList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("productMapper.getPopularProList");
	}

}
