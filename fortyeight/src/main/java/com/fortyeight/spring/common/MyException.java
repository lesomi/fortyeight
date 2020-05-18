package com.fortyeight.spring.common;

public class MyException extends RuntimeException {
	/**
	 * 
	 */
	private static final long serialVersionUID = -7552604172192040218L;

	// 예외처리 객체
	
	public MyException() {
		// TODO Auto-generated constructor stub
	}
	
	public MyException(String msg) {
		super(msg);
	}
}
