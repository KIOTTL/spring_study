package com.sist.main;

public class MusicDAO {
	private DataBase db;
	
	
	public DataBase getDb() {
		return db;
	}

	public void setDb(DataBase db) {
		this.db = db;
	}

	public void getConnection() {
		System.out.println("오라클 연결(local host)");
	}
	
	public void disConnection() {
		System.out.println("오라클 연결 해제");
	}
	
	public void musicListData() {
		db.getConnection();
		System.out.println("music 목록 읽기");
		db.disConnection();
	}
	
	public void musicDetailData() {
		db.getConnection();
		System.out.println("music 상세보기");
		db.disConnection();
	}
	
	public void musicFindData() {
		db.getConnection();
		System.out.println("music 찾기");
		db.disConnection();
	}
}
