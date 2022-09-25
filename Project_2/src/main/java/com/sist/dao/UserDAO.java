package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.sist.mapper.UserMapper;
import com.sist.vo.UserVO;

@Repository
public class UserDAO {
	@Autowired
	private UserMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	public UserVO isLogin(String id, String pwd) {
		UserVO vo=new UserVO();
		int count=mapper.userIdCount(id);
		if(count==0) {
			vo.setMsg("NOID");
		} else {
			UserVO dbVO=mapper.userInfoData(id);
			if(encoder.matches(pwd, dbVO.getPwd())) {
				vo.setUser_no(dbVO.getUser_no());
				vo.setId(id);
				vo.setAdmin(dbVO.getAdmin());
				vo.setMsg("OK");
			} else {
				vo.setMsg("NOPWD");
			}
		}
		
		return vo;
	}
	
	public int userIdCount(String id) {
		return mapper.userIdCount(id);
	}
	
	public UserVO userInfoData(String id) {
		return mapper.userInfoData(id);
	}
	
	public void userJoinInsert(UserVO vo) {
		mapper.userJoinInsert(vo);
	}
	
	public int userTelCount(String tel) {
		return mapper.userTelCount(tel);
	}
	
//	public void userUpdate(UserVO vo) {
//		mapper.userUpdate(vo);
//	}
}
