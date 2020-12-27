package com.kh.byulmee.member.model.exception;

public class MemberException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public MemberException() {}
	
	public MemberException(String message) {
		super(message);
	}
	
}
