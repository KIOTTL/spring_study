package com.sist.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.UserVO;

public interface UserMapper {
	@Select("SELECT COUNT(*) FROM user2_2 "
			+ "WHERE id=#{id}")
	public int userIdCount(String id);
	
	@Select("SELECT user_no, id, pwd, admin FROM user2_2 "
			+ "WHERE id=#{id}")
	public UserVO userInfoData(String id);
	
	@Insert("INSERT INTO user2_2(user_no, id, pwd, name, tel, admin) VALUES( "
			+ "(SELECT NVL(MAX(user_no)+1, 1) FROM user2_2), #{id}, #{pwd}, #{name}, #{tel}, 'n') ")
	public void userJoinInsert(UserVO vo);

	@Select("SELECT COUNT(*) FROM user2_2 "
			+ "WHERE tel=#{tel}")
	public int userTelCount(String tel);
	
//	@Update("UPDATE user2_2 SET pwd=#{pwd} WHERE id=#{id}")
//	public void userUpdate(UserVO vo);
	
}
