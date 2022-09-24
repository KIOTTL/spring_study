package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;

public interface RecipeMapper {
	// 레시피
	@Select("SELECT no, title, poster, chef, num "
			+ "FROM (SELECT no, title, poster, chef, rownum as num "
			+ "FROM (SELECT /*+ INDEX_ASC(recipe recipe_no_pk)*/no, title, poster, chef "
			+ "FROM recipe)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<RecipeVO> recipeListData(Map map);
	
	// 레시피 검새 => 동적쿼리
	@Select("SELECT no, title, poster, chef, num "
			+ "FROM (SELECT no, title, poster, chef, rownum as num "
			+ "FROM (SELECT /*+ INDEX_ASC(recipe recipe_no_pk)*/no, title, poster, chef "
			+ "FROM recipe WHERE REGEXP_LIKE(title, #{ss}))) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<RecipeVO> recipeFindData(Map map);
	
	// 셰프
	@Select("SELECT no, chef, poster, mem_cont1, mem_cont2, mem_cont3, mem_cont7, num "
			+ "FROM (SELECT no, chef, poster, mem_cont1, mem_cont2, mem_cont3, mem_cont7, rownum as num "
			+ "FROM (SELECT /*+ INDEX_ASC(chef chef_no_pk) */no, chef, poster, mem_cont1, mem_cont2, mem_cont3, mem_cont7 "
			+ "FROM chef)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<ChefVO> chefListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM recipe")
	public int recipeTotalPage();
	
	@Select("SELECT CEIL(COUNT(*)/30.0) FROM chef")
	public int chefTotalPage();
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM recipe WHERE REGEXP_LIKE(title, #{ss})")
	public int recipeFindTotalPage(Map map);
	
	// 셰프 상세
	@Select("SELECT no, title, chef, poster, num "
			+ "FROM (SELECT no, title, chef, poster, rownum as num "
			+ "FROM (SELECT /*+INDEX_ASC(recipe recipe_no_pk) */no, title, chef, poster "
			+ "FROM recipe WHERE chef=(SELECT chef FROM chef WHERE no=#{no}))) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<RecipeVO> chefMakeRecipeData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM recipe "
			+ "WHERE chef=(SELECT chef FROM chef WHERE no=#{no})")
	public int chefMakeTotalPage(Map map);
	
	// 셰프 검색
	@Select("SELECT no, title, chef, poster, num "
			+ "FROM (SELECT no, title, chef, poster, rownum as num "
			+ "FROM (SELECT /*+INDEX_ASC(recipe recipe_no_pk) */no, title, chef, poster "
			+ "FROM recipe WHERE chef=(SELECT chef FROM chef WHERE no=#{no}) AND REGEXP_LIKE(title, #{ss}))) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<RecipeVO> chefMakeRecipeFindData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM recipe "
			+ "WHERE chef=(SELECT chef FROM chef WHERE no=#{no}) AND REGEXP_LIKE(title, #{ss})")
	public int chefMakeFindTotalPage(Map map);
	
	// 레시피 => 재료별 레시피
}
