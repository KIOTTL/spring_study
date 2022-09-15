package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.UserMapper;
import com.sist.vo.UserVO;

@Repository
public class UserDAO {
	@Autowired
	private UserMapper mapper;
	
	public UserVO isLogin(String id, String pwd) {
		UserVO vo=new UserVO();
		int count=mapper.userIdCount(id);
		if(count==0) {
			vo.setMsg("NOID");
		} else {
			UserVO dbVO=mapper.userInfoData(id);
			if(pwd.equals(dbVO.getPwd())) {
				vo.setId(id);
				vo.setAdmin(dbVO.getAdmin());
				vo.setMsg("OK");
			} else {
				vo.setMsg("NOPWD");
			}
		}
		
		return vo;
	}
}
