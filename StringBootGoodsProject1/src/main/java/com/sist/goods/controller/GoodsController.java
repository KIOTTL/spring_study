package com.sist.goods.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.goods.dao.*;
import com.sist.goods.vo.GoodsVO;

@Controller
public class GoodsController {
	@Autowired
	private GoodsMapper dao;
	
	private String[] tables= {"","goods_all","goods_new","goods_special","goods_best"};
	private String[] title= {"","전체 상품","신상품","특가 상품","베스트 상품"};
	
	@GetMapping("goods/list")
	public String goods_list(String page, String type, Model model) {
		if(page==null)
			page="1";
		if(type==null)
			type="1";
			
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=12;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		map.put("start", start);
		map.put("end", end);
		map.put("table_name", tables[Integer.parseInt(type)]);
		List<GoodsVO> list=dao.goodsListData(map);
		for(GoodsVO vo:list) {
			String s=vo.getGoods_name();
			if(s.length()>25) {
				s=s.substring(0, 25)+"...";
				vo.setGoods_name(s);
			}
			vo.setGoods_name(s);
		}
		int totalpage=dao.goodsTotalPage(map);
		
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("list", list);
		model.addAttribute("type", type);
		model.addAttribute("title", title[Integer.parseInt(type)]);
		model.addAttribute("main_jsp", "../goods/list.jsp");
		
		return "main/main";
	}
	
//	@GetMapping("goods/detail")
//	public String goods_detail(int no, int type, Model model) {
//		Map map=new HashMap();
//		map.put("no", no);
//		map.put("table_name", tables[type]);
//		GoodsVO vo=dao.goodsDetailData(map);
//		
//		model.addAttribute("type", type);
//		model.addAttribute("vo", vo);
//		model.addAttribute("main_jsp", "../goods/detail.jsp");
//		
//		return "main/main";
//	}
}
