package com.sist.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class FoodDAO {
	@Autowired
	private FoodMapper mapper;
	
	public List<CategoryVO> foodCategoryAllData() {
		return mapper.foodCategoryAllData();
	}
	
	public List<FoodVO> foodCategoryListData(int cno) {
		return mapper.foodCategoryListData(cno);
	}
	
	public CategoryVO categoryInfoData(int cno) {
		return mapper.categoryInfoData(cno);
	}
	
	public List<String> foodLikeRecipe(String type) {
		return mapper.foodLikeRecipe(type);
	}
	
	public FoodVO foodDetailData(int fno) {
		return mapper.foodDetailData(fno);
	}
	
}
