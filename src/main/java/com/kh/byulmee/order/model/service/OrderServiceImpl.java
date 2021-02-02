package com.kh.byulmee.order.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.order.model.dao.OrderDAO;
import com.kh.byulmee.order.model.vo.Order;
import com.kh.byulmee.order.model.vo.OrderSearch;

@Service("odService")
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private OrderDAO odDAO;

	@Override
	public int getListCount(String memId) {
		return odDAO.getListCount(sqlSession, memId);
	}

	@Override
	public ArrayList<Order> selectOdList(PageInfo pi, String memId) {
		return odDAO.selectOdList(sqlSession, pi, memId);
	}

	@Override
	public int getpdListCount(String memId) {
		return odDAO.getpdListCount(sqlSession, memId);
	}

	@Override
	public ArrayList<Order> selectOdPdList(PageInfo pi, String memId) {
		return odDAO.selectOdPdList(sqlSession, pi, memId);
	}

	@Override
	public int getSearchAcListCount(OrderSearch os) {
		return odDAO.getSearchAcListCount(sqlSession, os);
	}

	@Override
	public ArrayList<Order> selectAcOrder(OrderSearch os, PageInfo pi) {
		return odDAO.selectAcOrder(sqlSession, os, pi);
	}

	@Override
	public int getSearchPdListCount(OrderSearch os) {
		return odDAO.getSearchPdListCount(sqlSession, os);
	}

	@Override
	public ArrayList<Order> selectPdOrder(OrderSearch os, PageInfo pi) {
		return odDAO.selectPdOrder(sqlSession, os, pi);
	}

	@Override
	public int updateOrder(Order o) {
		return odDAO.updateOrder(sqlSession, o);
	}

	@Override
	public int insertPayOrder(Order o) {
		int ordNo = odDAO.insertPayOrder(sqlSession, o);
		return ordNo;
	}

	@Override
	public Order selectPayOrder(int ordNo) {
		return odDAO.selectPayOrder(sqlSession, ordNo);
	}
	
}
