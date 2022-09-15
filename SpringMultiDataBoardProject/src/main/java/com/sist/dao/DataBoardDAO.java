package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.*;
import com.sist.mapper.*;

@Repository
public class DataBoardDAO {
	@Autowired
	private DataBoardMapper mapper;
	
	public List<DataBoardVO> boardListData(Map map){
		return mapper.boardListData(map);
	}
	
	public void boardInsert(DataBoardVO vo) {
		mapper.boardInsert(vo);
	}
	
	public int boardTotalPage() {
		return mapper.boardTotalPage();
	}
	
	public DataBoardVO databoardDetailData(int no) {
		mapper.hitIncrement(no);
		return mapper.databoardDetailData(no);
	}

	public DataBoardVO databoardUpdateData(int no) {
		return mapper.databoardDetailData(no);
	}
	
	public boolean databoardUpdate(DataBoardVO vo) {
		boolean bCheck=false;
		String db_pwd=mapper.databoardGetPassword(vo.getNo());
		if(db_pwd.equals(vo.getPwd())) {
			bCheck=true;
			mapper.databoardUpdate(vo);
		}
		
		return bCheck;
	}
	
	public boolean databoardDelete(int no, String pwd) {
		boolean bCheck=false;
		String db_pwd=mapper.databoardGetPassword(no);
		if(db_pwd.equals(pwd)) {
			bCheck=true;
			mapper.databoardDelete(no);
		}
		
		return bCheck;
		
	}
	
	public DataBoardVO databoardInfoData(int no) {
		return mapper.databoardInfoData(no);
	}
	
	
}
