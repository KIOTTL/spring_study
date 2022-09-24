package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.FundingGoodsMapper;
import com.sist.vo.FundingGoodsVO;

@Repository
public class FundingGoodsDAO {
	@Autowired
	private FundingGoodsMapper mapper;
	
	public List<FundingGoodsVO> fundingSoonListData(Map map) {
		return mapper.fundingSoonListData(map);
	}
	
	public int fundingSoonTotalPage() {
		return mapper.fundingSoonTotalPage();
	}
	
	public int fundingSoonCount() {
		return mapper.fundingSoonCount();
	}
	
	public String fundingCategoryData(int fc_no) {
		return mapper.fundingCategoryData(fc_no);
	}
	
	public String fundingIdData(int user_no) {
		return mapper.fundingIdData(user_no);
	}
	
	public List<FundingGoodsVO> fundingListData(Map map) {
		return mapper.fundingListData(map);
	}
	
	public int fundingTotalPage() {
		return mapper.fundingTotalPage();
	}
	
	public int fundingCount() {
		return mapper.fundingCount();
	}
}
