package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.SeoulMapper;
import com.sist.vo.SeoulVO;

@Repository
public class SeoulDAO {
	@Autowired
	private SeoulMapper mapper;
	
	public List<SeoulVO> seoulListData(Map map) {
		return mapper.seoulListData(map);
	}
	
	public SeoulVO seoulDetailData(Map map) {
		mapper.hitIncrement(map);
		return mapper.seoulDetailData(map);
	}
	
	public int seoulTotalPage(Map map) {
		return mapper.seoulTotalPage(map);
	}
	
	public List<SeoulVO> seoulTop5(Map map) {
		return mapper.seoulTop5(map);
	}
}
