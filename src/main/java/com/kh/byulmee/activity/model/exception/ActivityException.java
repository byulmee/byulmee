package com.kh.byulmee.activity.model.exception;

public class ActivityException extends RuntimeException {
	
	private static final long serialVersionUID = 1L;
	
	public ActivityException() {}
	
	public ActivityException(String message) {
		super(message);
	}
}
