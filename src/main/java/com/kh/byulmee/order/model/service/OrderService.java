package com.kh.byulmee.order.model.service;

import java.util.ArrayList;

import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.order.model.vo.Order;
import com.kh.byulmee.order.model.vo.OrderSearch;

public interface OrderService {

	int getListCount(String memId);

	ArrayList<Order> selectOdList(PageInfo pi, String memId);

	int getpdListCount(String memId);

	ArrayList<Order> selectOdPdList(PageInfo pi, String memId);

	int getSearchAcListCount(OrderSearch os);

	ArrayList<Order> selectAcOrder(OrderSearch os, PageInfo pi);

	int getSearchPdListCount(OrderSearch os);

	ArrayList<Order> selectPdOrder(OrderSearch os, PageInfo pi);

	int updateOrder(Order o);

}
