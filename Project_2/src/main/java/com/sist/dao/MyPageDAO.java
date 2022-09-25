package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.MyPageMapper;
import com.sist.vo.FundingGoodsVO;
import com.sist.vo.LikeVO;
import com.sist.vo.PayHistoryVO;
import com.sist.vo.UserVO;

@Repository
public class MyPageDAO {
	@Autowired
	private MyPageMapper mapper;
	
	public UserVO mypageProfile(String id) {
		return mapper.mypageProfile(id);
	}
	
	public List<FundingGoodsVO> mypageProject(Map map) {
		return mapper.mypageProject(map);
	}
	
	public int mypageProjectTotalPage(int user_no) {
		return mapper.mypageProjectTotalPage(user_no);
	}
	
	public int mypageProjectCount(int user_no) {
		return mapper.mypageProjectCount(user_no);
	}
	
	public List<PayHistoryVO> mypagePaying(int user_no) {
		return mapper.mypagePaying(user_no);
	}
	
	public List<PayHistoryVO> mypagePayingFin(int user_no) {
		return mapper.mypagePayingFin(user_no);
	}
	
	public int mypagePayingCount(int user_no) {
		return mapper.mypagePayingCount(user_no);
	}

	public int mypagePayingFinCount(int user_no) {
		return mapper.mypagePayingFinCount(user_no);
	}
	
	public FundingGoodsVO fundingData(int fg_no) {
		return mapper.fundingData(fg_no);
	}
	
	public UserVO userData(int user_no) {
		return mapper.userData(user_no);
	}
	
	public List<LikeVO> mypageLike(int user_no) {
		return mapper.mypageLike(user_no);
	}
	
}
