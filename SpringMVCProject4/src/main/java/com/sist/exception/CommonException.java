package com.sist.exception;

import java.io.IOException;
import java.sql.SQLException;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice(basePackages = {"com.sist.web"})
public class CommonException {
	@ExceptionHandler(RuntimeException.class) // RuntimeException (변환 : Integer.parseInt()), NullPointerException
	public void runtime(RuntimeException ex) {
		System.out.println("========== RuntimeException 발생 ==========");
		System.out.println(ex.getMessage());
	}
	
	@ExceptionHandler(SQLException.class)
	public void sqlException(SQLException ex) {
		System.out.println("========== SQLException 발생 ==========");
		System.out.println(ex.getMessage());
	}
	
	@ExceptionHandler(IOException.class)
	public void ioException(IOException ex) {
		System.out.println("========== IOException 발생 ==========");
		System.out.println(ex.getMessage());
	}
	
	@ExceptionHandler(Exception.class)
	public void exception(Exception ex) {
		System.out.println("========== Exception 발생 ==========");
		System.out.println(ex.getMessage());
	}
	
}
