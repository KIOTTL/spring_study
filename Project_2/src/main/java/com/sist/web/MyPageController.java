package com.sist.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.dao.MyPageDAO;

@Controller
public class MyPageController {
	@Autowired
	private MyPageDAO dao;
	
	@GetMapping("mypage/mypage.do")
	public String mypage_mypage(Model model, HttpSession session) {
		
		model.addAttribute("main_jsp", "../mypage/mypage.jsp");
		
		return "main/main";
	}
}
