package com.kh.byulmee.payment.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.byulmee.order.model.vo.Order;

public class PaymentDAO {
	public ArrayList<Order> selectOrderList(SqlSessionTemplate sqlSession, int acId){
		return (ArrayList)sqlSession.selectList("orderMapper.selectOrderList",acId);
	}
}
