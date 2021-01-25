package com.kh.byulmee.product.model.exception;

public class ProductException extends RuntimeException {
	private static final long serialVersionUID = 1L;
	
	public ProductException() {}
	
	public ProductException(String message) {
		super(message);
	}
}
