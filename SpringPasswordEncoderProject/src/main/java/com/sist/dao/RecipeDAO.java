package com.sist.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.*;
import com.sist.vo.*;

@Repository
public class RecipeDAO {
	@Autowired
	private RecipeMapper mapper;
	
	public List<RecipeVO> recipeListData(Map map) {
		return mapper.recipeListData(map);
	}
	
	public int recipeTotalPage() {
		return mapper.recipeTotalPage();
	}
	
	public List<ChefVO> chefListData(Map map) {
		return mapper.chefListData(map);
	}
	
	public int chefTotalPage() {
		return mapper.chefTotalPage();
	}
	
	public List<RecipeVO> recipeFindData(Map map) {
		return mapper.recipeFindData(map);
	}
	
	public int recipeFindTotalPage(Map map) {
		return mapper.recipeFindTotalPage(map);
	}
	
	public List<RecipeVO> chefMakeRecipeData(Map map) {
		return mapper.chefMakeRecipeData(map);
	}
	
	public int chefMakeTotalPage(Map map) {
		return mapper.chefMakeTotalPage(map);
	}
	
	public List<RecipeVO> chefMakeRecipeFindData(Map map) {
		return mapper.chefMakeRecipeFindData(map);
	}
	
	public int chefMakeFindTotalPage(Map map) {
		return mapper.chefMakeFindTotalPage(map);
	}
}
