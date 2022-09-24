package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class MemberDAO {
	@Autowired
	private MemberMapper mapper;
	
	public int memberIdCheck(String id) {
		return mapper.memberIdCheck(id);
	}
	
	public void memberJoinInsert(MemberVO vo) {
		mapper.memberJoinInsert(vo);
	}
	
	public MemberVO memberJoinInfoData(String id) {
		return mapper.memberJoinInfoData(id);
	}
	
	public String memberGetPassword(String id) {
		return mapper.memberGetPassword(id);
	}
	
	public MemberVO memberUpdateData(String id) {
		return mapper.memberUpdateData(id);
	}
	
	public void memberUpdate(MemberVO vo) {
		mapper.memberUpdate(vo);
	}
}
