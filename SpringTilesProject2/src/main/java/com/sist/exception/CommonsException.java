package com.sist.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.sql.*;
import java.io.*;

/*
 * 	1. RuntimeException => NumberFormatException, NullPointerException, ClassCastException
 * 	2. SQLException
 * 	3. IOException
 * 	4. Exception
 */

// 공통으로 적용하는 예외처리
@ControllerAdvice
public class CommonsException {
	@ExceptionHandler(RuntimeException.class)
	public void runtimeException(RuntimeException ex) {
		System.out.println("========== RuntimeException 발생 ===========");
		ex.printStackTrace();
		System.out.println("===========================================");
	}
	@ExceptionHandler(SQLException.class)
	public void sqlException(SQLException ex) {
		System.out.println("========== SQLException 발생 ===========");
		ex.printStackTrace();
		System.out.println("===========================================");
	}
	@ExceptionHandler(IOException.class)
	public void ioException(IOException ex) {
		System.out.println("========== IOException 발생 ===========");
		ex.printStackTrace();
		System.out.println("===========================================");
	}
	@ExceptionHandler(Exception.class)
	public void exception(Exception ex) {
		System.out.println("========== 기타Exception 발생 ===========");
		ex.printStackTrace();
		System.out.println("===========================================");
	}
}
