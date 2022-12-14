package com.sist.web;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.*;
import com.sist.vo.*;

@Controller
@RequestMapping("recipe/")
public class RecipeController {
	@Autowired
	private RecipeDAO dao;
	
	// 사용자 요청 구분 : @RequestMapping(), @GetMapping(), @PostMapping()
	@RequestMapping("list.do")
	public String recipe_list(String type, String page, Model model) {
		List<RecipeVO> list=new ArrayList<RecipeVO>();
		if (page==null) {
			page="1";
		}
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=12;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		map.put("start", start);
		map.put("end", end);
		
		int totalpage=0;
		if(type==null || type.equals("")) {
			list=dao.recipeListData(map);
			totalpage=dao.recipeTotalPage();
		} else {
			map.put("ss", type);
			list=dao.recipeFindData(map);
			totalpage=dao.recipeFindTotalPage(map);
		}
		
		for(RecipeVO vo:list) {
			String title=vo.getTitle();
			if(title.length()>25) {
				title=title.substring(0, 25)+"...";
				vo.setTitle(title);
			} 
			vo.setTitle(title);
		}
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		model.addAttribute("list", list);
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("type", type);
		model.addAttribute("main_jsp", "../recipe/list.jsp");
		
		return "main/main";
		
	}
	
	@GetMapping("chef_list.do")
	public String chef_list(String page, Model model) {
		if (page==null) {
			page="1";
		}
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=12;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		map.put("start", start);
		map.put("end", end);
		
		List<ChefVO> list=dao.chefListData(map);
		int totalpage=dao.chefTotalPage();
		
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("list", list);
		model.addAttribute("main_jsp", "../recipe/chef_list.jsp");
		
		return "main/main";
	}
	
	@RequestMapping("chef_detail.do")
	public String chef_detail(int no, String page, String ss, Model model) {
		if (page==null) {
			page="1";
		}
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=12;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		map.put("start", start);
		map.put("end", end);
		map.put("no", no);
		
		List<RecipeVO> list=new ArrayList<RecipeVO>();
		int totalpage=0;
		if(ss==null || ss.equals("")) {
			list=dao.chefMakeRecipeData(map);
			totalpage=dao.chefMakeTotalPage(map);
		} else {
			map.put("ss", ss);
			list=dao.chefMakeRecipeFindData(map);
			totalpage=dao.chefMakeFindTotalPage(map);
		}
		
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("list", list);
		model.addAttribute("no", no);
		model.addAttribute("ss", ss);
		model.addAttribute("main_jsp", "../recipe/chef_detail.jsp");
		
		return "main/main";
	}
}
