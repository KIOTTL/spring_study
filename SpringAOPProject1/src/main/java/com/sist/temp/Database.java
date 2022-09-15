package com.sist.temp;

public interface Database {
	public void getConnection();
	public void disConnection();
	public void selectOne();
	public void selectList();
	public default void insert() {};
}
