package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.GoodsService;
import com.sist.dao.GoodsVO;

@Controller
@RequestMapping("goods/")	// 중복적인 경로명 제거
public class GoodsController {
	@Autowired
	private GoodsService service;
	
	@GetMapping("main.do")
	public String goods_main() {
		return "goods/main";
	}
	
	@GetMapping("goods_all.do")
	public String goods_all_list(String page, Model model) {
		// 결과값 전송 객체 : Model
		
		if (page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		map.put("start", (curpage*12)-11);
		map.put("end", curpage*12);
		List<GoodsVO> list=service.goodsAllListData(map);
		for (GoodsVO vo:list) {
			String name=vo.getName();
			if(name.length()>17) {
				name=name.substring(0,17)+"...";
				vo.setName(name);
			} else {
				vo.setName(name);
			}
		}
		
		int totalpage=service.goodsAllTotalPage();
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if (endPage>totalpage)
			endPage=totalpage;
		
		// 전송
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("list", list);
		// model => request
		/*
		 * 	public void addAttribute(String key, Object obj) {
		 * 		request.setAttribute(key, obj);
		 * 	}
		 * 	
		 * 	request 사용 x 권장
		 */
		
		return "goods/goods_all";
	}
	
	@GetMapping("goods_all_detail.do")
	public String goods_all_detail(int no, Model model) {
		GoodsVO vo=service.goodsAllDetailData(no);
		
		model.addAttribute("vo", vo);
		
		return "goods/goods_all_detail";
	}
	
	@GetMapping("goods_best.do")
	public String goods_best_list(String page, Model model) {
		if (page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		map.put("start", (curpage*12)-11);
		map.put("end", curpage*12);
		List<GoodsVO> list=service.goodsBestListData(map);
		for (GoodsVO vo:list) {
			String name=vo.getName();
			if(name.length()>16) {
				name=name.substring(0,16)+"...";
				vo.setName(name);
			} else {
				vo.setName(name);
			}
		}
		
		int totalpage=service.goodsBestTotalPage();
		
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("list", list);
		
		return "goods/goods_best";
	}
	
	@GetMapping("goods_best_detail.do")
	public String goods_best_detail(int no, Model model) {
		GoodsVO vo=service.goodsBestDetailData(no);
		
		model.addAttribute("vo", vo);
		
		return "goods/goods_best_detail";
	}
	
	@GetMapping("goods_special.do")
	public String goods_special_list(String page, Model model) {
		if (page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		map.put("start", (curpage*12)-11);
		map.put("end", curpage*12);
		List<GoodsVO> list=service.goodsSpecialListData(map);
		for (GoodsVO vo:list) {
			String name=vo.getName();
			if(name.length()>16) {
				name=name.substring(0,16)+"...";
				vo.setName(name);
			} else {
				vo.setName(name);
			}
		}
		
		int totalpage=service.goodsSpecialTotalPage();
		
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("list", list);
		
		return "goods/goods_special";
	}
	
	@GetMapping("goods_special_detail.do")
	public String goods_special_detail(int no, Model model) {
		GoodsVO vo=service.goodsSpecialDetailData(no);
		
		model.addAttribute("vo", vo);
		
		return "goods/goods_special_detail";
	}
	
	@GetMapping("goods_new.do")
	public String goods_new_list(String page, Model model) {
		if (page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		map.put("start", (curpage*12)-11);
		map.put("end", curpage*12);
		List<GoodsVO> list=service.goodsNewListData(map);
		for (GoodsVO vo:list) {
			String name=vo.getName();
			if(name.length()>16) {
				name=name.substring(0,16)+"...";
				vo.setName(name);
			} else {
				vo.setName(name);
			}
		}
		
		int totalpage=service.goodsNewTotalPage();
		final int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("list", list);
		
		return "goods/goods_new";
	}
	
	@GetMapping("goods_new_detail.do")
	public String goods_new_detail(int no, Model model) {
		GoodsVO vo=service.goodsNewDetailData(no);
		
		model.addAttribute("vo", vo);
		
		return "goods/goods_new_detail";
	}
	
}
