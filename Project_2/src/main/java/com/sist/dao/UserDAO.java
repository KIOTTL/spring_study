package com.sist.dao;

import javax.servlet.http.HttpSession;

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
	
//	public void userEmailInsert(UserVO vo) {
//		mapper.userEmailInsert(vo);
//	}
	
	public void userEmailUpdate(UserVO vo) {
		mapper.userEmailUpdate(vo);
	}

	public void userTelUpdate(UserVO vo) {
		mapper.userTelUpdate(vo);
	}
	
	public String userPwdUpdate(UserVO vo) {
		String result="no";
		
		UserVO dbvo=mapper.userInfoData(vo.getId());
		if(encoder.matches(vo.getNowpwd(), dbvo.getPwd())) {
			result="yes";
			mapper.userPwdUpdate(vo);
		}
		
		return result;
	}
	
	public void userCardUpdate(UserVO vo) {
		mapper.userCardUpdate(vo);
	}
	
	public void userCardDelete(UserVO vo) {
		mapper.userCardDelete(vo);
	}
	
	public void userDeliUpdate(UserVO vo) {
		mapper.userDeliUpdate(vo);
	}
	
	public void userDeliDelete(UserVO vo) {
		mapper.userDeliDelete(vo);
	}
}
