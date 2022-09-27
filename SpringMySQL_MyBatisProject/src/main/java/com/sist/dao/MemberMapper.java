package com.sist.dao;

import java.util.*;

import org.apache.ibatis.annotations.Select;

public interface MemberMapper {
	@Select("SELECT * FROM member")
	public List<MemberVO> memberListData();
}
