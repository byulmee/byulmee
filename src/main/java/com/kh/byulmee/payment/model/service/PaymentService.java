package com.kh.byulmee.payment.model.service;

import java.util.ArrayList;

import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.order.model.vo.Order;

public interface PaymentService {
	int getPaymentListCount();
	ArrayList<Order> selectOrderList(PageInfo pi);
	

}
