package com.ssafy.happyhouse.dto;


public class UserException extends RuntimeException {
	public UserException() {
		super("Book 정보를 처리 중 오류 발생");
	}
	public UserException(String msg) {
		super(msg);
	}
}
