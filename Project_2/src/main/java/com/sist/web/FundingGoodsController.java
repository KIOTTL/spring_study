package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.dao.FundingGoodsDAO;
import com.sist.vo.FundingGoodsVO;

@Controller
public class FundingGoodsController {
	@Autowired
	private FundingGoodsDAO dao;
	
	@GetMapping("funding/soon_list.do")
	public String funding_soon_list(Model model) {
		model.addAttribute("main_jsp", "../funding/soon_list.jsp");
		
		return "main/main";
	}
	
	@GetMapping("funding/list.do")
	public String funding_list(Model model) {
		model.addAttribute("main_jsp", "../funding/list.jsp");
		
		return "main/main";
	}
}
