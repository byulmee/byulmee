package com.kh.byulmee.order.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.order.model.vo.Order;
import com.kh.byulmee.order.model.vo.OrderSearch;

@Repository("odDAO")
public class OrderDAO {

	public int getListCount(SqlSessionTemplate sqlSession, String memId) {
		return sqlSession.selectOne("orderMapper.getListCount", memId);
	}

	public ArrayList<Order> selectOdList(SqlSessionTemplate sqlSession, PageInfo pi, String memId) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("orderMapper.selectOdList", memId, rowBounds);
	}

	public int getpdListCount(SqlSessionTemplate sqlSession, String memId) {
		return sqlSession.selectOne("orderMapper.getpdListCount", memId);
	}

	public ArrayList<Order> selectOdPdList(SqlSessionTemplate sqlSession, PageInfo pi, String memId) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("orderMapper.selectOdPdList", memId, rowBounds);
	}

	public int getSearchAcListCount(SqlSessionTemplate sqlSession, OrderSearch os) {
		return sqlSession.selectOne("orderMapper.getSearchAcListCount", os);
	}

	public ArrayList<Order> selectAcOrder(SqlSessionTemplate sqlSession, OrderSearch os, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("orderMapper.selectAcOrder", os, rowBounds);
	}

	public int getSearchPdListCount(SqlSessionTemplate sqlSession, OrderSearch os) {
		return sqlSession.selectOne("orderMapper.getSearchPdListCount", os);
	}

	public ArrayList<Order> selectPdOrder(SqlSessionTemplate sqlSession, OrderSearch os, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("orderMapper.selectPdOrder", os, rowBounds);
	}

	public int updateOrder(SqlSessionTemplate sqlSession, Order o) {
		return sqlSession.update("orderMapper.updateOrder", o);
	}

}
