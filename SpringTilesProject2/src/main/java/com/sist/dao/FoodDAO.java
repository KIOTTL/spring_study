package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.FoodMapper;
import com.sist.vo.CategoryVO;
import com.sist.vo.FoodVO;

@Repository
public class FoodDAO {
	@Autowired
	private FoodMapper mapper;
	
	public List<CategoryVO> categoryListData(Map map) {
		return mapper.categoryListData(map);
	}
	
	public List<FoodVO> foodListData(int cno) {
		return mapper.foodListData(cno);
	}
	
	public CategoryVO categoryInfoData(int cno) {
		return mapper.categoryInfoData(cno);
	}
	
	public FoodVO foodDetailData(int fno) {
		return mapper.foodDetailData(fno);
	}
	
	public List<FoodVO> foodFindData(Map map) {
		return mapper.foodFindData(map);
	}
	
	public int foodLocationTotalPage(String address) {
		return mapper.foodLocationTotalPage(address);
	}
	
	public FoodVO foodDetailVueData(int fno) {
		return mapper.foodDetailVueData(fno);
	}
	
	public List<FoodVO> foodAllData(Map map) {
		return mapper.foodAllData(map);
	}
	
	public int foodTotalPage() {
		return mapper.foodTotalPage();
	}
}
