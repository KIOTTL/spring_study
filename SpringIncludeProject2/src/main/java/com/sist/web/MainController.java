package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.dao.GoodsDAO;
import com.sist.dao.GoodsVO;

// Model => DispatcherServlet으로부터 위임을 받아서 요청 처리
@Controller
public class MainController {
	@Autowired	// 스프링에서 생성한 객체를 자동으로 주소값 얻어 온다
	private GoodsDAO dao;
	
	// 요청의 종류 => 요구사항 분석 => 구분
	@GetMapping("main/main.do")		// if => index, if 를 추가
	public String main_main(String page, Model model) {
		CommonsController.commonsData("goods_all", page, model, dao);
		
		model.addAttribute("main_jsp", "../goods/home.jsp");
		
		return "main/main";
	}
}
