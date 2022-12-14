package com.sist.web;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;
import com.sist.vo.*;
import com.sist.dao.*;

@RestController
// 문자열을 입력 받아서 좌우대칭 여부 확인 ==> 반드시 문자열이 짝수인지 확인
// 이미지 180도 회전
// 점수 3개 받아서 평균
public class FoodRestController {
	@Autowired
	private FoodDAO dao;
	
	@PostMapping(value = "food/recipe_list.do", produces = "text/plain;charset=utf-8")
	public String recipe_list(String type) {
		String result="";
		String str=type.replace("/", "|").replace(" ", "").replace("요리", "").replace("기타", "");
		List<String> list=dao.foodLikeRecipe(str);
		JSONArray arr=new JSONArray();
		for(String s:list) {
			arr.add(s);
		}
		result=arr.toJSONString();
		
		return result;
	}
	
	@GetMapping(value = "food/detail_vue.do", produces = "text/plain;charset=utf-8")
	public String food_detail_vue(int fno) {
		String result="";
		FoodVO vo=dao.foodDetailData(fno);
		
		String menu=vo.getMenu();
		menu=menu.replace("원", "^");
		menu=menu.substring(0, menu.lastIndexOf("^"));
		
		JSONObject obj=new JSONObject();
		obj.put("fno", vo.getFno());
		obj.put("poster", vo.getPoster());
		obj.put("name", vo.getName());
		obj.put("score", vo.getScore());
		obj.put("address", vo.getAddress().substring(0, vo.getAddress().lastIndexOf("지")).trim());
		obj.put("tel", vo.getTel());
		obj.put("type", vo.getType());
		obj.put("time", vo.getTime());
		obj.put("price", vo.getPrice());
		obj.put("parking", vo.getParking());
		obj.put("menu", menu);
		
		result=obj.toJSONString();
		
		return result;
	}
}
