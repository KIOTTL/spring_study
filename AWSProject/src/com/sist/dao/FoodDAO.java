package com.sist.dao;

import java.util.*;
import java.io.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.CategoryVO;
import com.sist.vo.FoodVO;

public class FoodDAO {
	/*
	 * 	<bean id="ssf" class="org.mybatis.spring.SqlSessionFactoryBean"
			p:dataSource-ref="ds"
		/>
	 */
	private static SqlSessionFactory ssf;
	
	static {
		try {
			Reader reader=Resources.getResourceAsReader("Config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
		} catch(Exception ex) {
			ex.printStackTrace();
		} 
	}
	
	public static List<CategoryVO> categoryListData() {
		SqlSession session=ssf.openSession();
		List<CategoryVO> list=session.selectList("categoryListData");
		session.close();
		
		return list;
	}
	
	public static List<FoodVO> categoryFoodListData(int cno) {
		SqlSession session=ssf.openSession();
		List<FoodVO> list=session.selectList("categoryFoodListData", cno);
		session.close();
		
		return list;
	}
	
	public static FoodVO foodDetailData(int fno) {
		SqlSession session=ssf.openSession();
		FoodVO vo=session.selectOne("foodDetailData", fno);
		session.close();
		
		return vo;
	}
	
}
