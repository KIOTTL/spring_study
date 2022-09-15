package com.sist.mapper;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.UserVO;

public interface UserMapper {
	@Select("SELECT COUNT(*) FROM user2_2 "
			+ "WHERE id=#{id}")
	public int userIdCount(String id);
	
	@Select("SELECT pwd, admin FROM user2_2 "
			+ "WHERE id=#{id}")
	public UserVO userInfoData(String id);
}
