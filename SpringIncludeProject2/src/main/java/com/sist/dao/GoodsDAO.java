package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.GoodsMapper;

/*
 * 	1. Controller(Model) ==> @Controller, @RestController
 * 	2. 데이터베이스 (DAO, Service) ==> @Repository, @Service
 * 	3. 데이터 분석 (Manager) ==> @Component
 */

@Repository
public class GoodsDAO {
	@Autowired
	private GoodsMapper mapper;
	
	public List<GoodsVO> goodsListData(Map map) {
		return mapper.goodsListData(map);
	}
	
	public int goodsTotalPage(Map map) {
		return mapper.goodsTotalPage(map);
	}
	
	public GoodsVO goodsDetailData(Map map) {
		return mapper.goodsDetailData(map);
	}
	
	// 로그인
	public MemberVO memberLogin(String id, String pwd) {
		MemberVO vo=new MemberVO();
		int count=mapper.idCount(id);
		if(count==0) {
			vo.setMsg("NOID");
		} else {
			MemberVO dbVO=mapper.memberGetPassword(id);
			if(pwd.equals(dbVO.getPwd())) {	// 로그인
				vo.setId(id);
				vo.setName(dbVO.getName());
				vo.setMsg("OK");
			} else {	// 비밀번호가 틀린 경우
				vo.setMsg("NOPWD");
			}
		}
		
		return vo;
	}
	
	public List<GoodsVO> goodsFindData(Map map) {
		return mapper.goodsFindData(map);
	}
	
}
