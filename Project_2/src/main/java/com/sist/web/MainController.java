package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


// Model => DispatcherServlet으로부터 위임을 받아서 요청 처리
@Controller
public class MainController {
	@GetMapping("main/main.do")		// if => index, if 를 추가
	public String main_main(Model model) {
		
		model.addAttribute("main_jsp", "../main/home.jsp");
		
		return "main/main";
	}
}
