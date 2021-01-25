package com.kh.byulmee.board.model.exception;

public class BoardException extends RuntimeException {
	
	private static final long serialVersionUID = 1L;
	
	public BoardException() {}
	
	public BoardException(String message) {
		super(message);
	}
}
