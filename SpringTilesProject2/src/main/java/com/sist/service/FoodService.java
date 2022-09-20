package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.CategoryVO;
import com.sist.vo.FoodVO;

public interface FoodService {
	public List<CategoryVO> categoryListData(Map map);
	public List<FoodVO> foodListData(int cno);
	public CategoryVO categoryInfoData(int cno);
	public FoodVO foodDetailData(int fno);
	public List<FoodVO> foodFindData(Map map);
	public int foodLocationTotalPage(String address);
	public FoodVO foodDetailVueData(int fno);
}
