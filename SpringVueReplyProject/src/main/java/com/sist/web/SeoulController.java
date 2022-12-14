package com.sist.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/*
 * 	@Controller : 화면 변경
 * 	@RestController : 실제 데이터 (요청 결과값 전송) => 예전 버전 (@ResponseBody)
 */

@Controller
public class SeoulController {
	@GetMapping("seoul/list.do")
	public String seoul_list() {
		return "seoul/list"; // Model
	}
	
	@GetMapping("seoul/detail_before.do")
	public String seoul_detail_before(int no, int type, RedirectAttributes ra, HttpServletResponse response) {
		// 쿠키 생성
		String[] cmd= {"", "location", "nature", "shop"};
		Cookie cookie=new Cookie(cmd[type]+no, String.valueOf(no) );
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24); // 하루
		response.addCookie(cookie);
		
		ra.addAttribute("no", no);
		ra.addAttribute("type", type);
		
		return "redirect:../seoul/detail.do"; // RedirectAttributes
	}
	
	@GetMapping("seoul/detail.do")
	public String seoul_detail(int no, int type, Model model) {
		model.addAttribute("no", no);
		model.addAttribute("type", type);
		
		return "seoul/detail";
	}
	
	@GetMapping("seoul/login.do")
	public String seoul_login() {
		return "seoul/login";
	}
	
}
