package com.kh.byulmee.order.model.exception;

public class OrderException extends RuntimeException {
	
	private static final long serialVersionUID = 1L;
	
	public OrderException() {}
	
	public OrderException(String message) {
		super(message);
	}
}
