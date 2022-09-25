package com.sist.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sist.dao.UserDAO;
import com.sist.vo.UserVO;

@Controller
public class UserController {
	@Autowired
	private UserDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@GetMapping("user/login.do")
	public String user_login(Model model) {
		model.addAttribute("main_jsp", "../user/login.jsp");
		
		return "main/main";
	}
	
	@GetMapping("user/logout.do")
	public String user_logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:../main/main.do";
	}
	
	@GetMapping("user/join.do")
	public String user_join(Model model) {
		model.addAttribute("main_jsp", "../user/join.jsp");
		
		return "main/main";
	}
	
	@PostMapping("user/join_ok.do")
	public String user_join_ok(UserVO vo) {
		String en=encoder.encode(vo.getPwd());
		vo.setPwd(en);
		dao.userJoinInsert(vo);
		
		return "redirect:../main/main.do";
	}
	
	@PostMapping("user/id_check.do")
	@ResponseBody
	public String user_id_check(String id) {
		String result="";
		int count=dao.userIdCount(id);
		if(count==0) {
			result="YES";
		} else {
			result="NO";
		}
		
		return result;
	}
	
	@PostMapping("user/tel_check.do")
	@ResponseBody
	public String user_tel_check(String tel) {
		String result="";
		int count=dao.userTelCount(tel);
		int count2=tel.indexOf('-');
		
		if(count==0 && count2!=-1) {
			result="YES";
		} else if (count!=0) {
			result="NO";
		} else if (count2==-1) {
			result="NO2";
		}
	
		return result;
	}
	
//	@PostMapping("user/update.do")
//	@ResponseBody
//	public String user_update(UserVO vo) {
//		String en=encoder.encode("1234");
//		vo.setId("park");
//		vo.setPwd(en);
//		dao.userUpdate(vo);
//		
//		return "redirect:../main/main.do";
//	}
}
