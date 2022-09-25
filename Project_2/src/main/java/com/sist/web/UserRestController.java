package com.sist.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.UserDAO;
import com.sist.vo.UserVO;

@RestController
public class UserRestController {
	@Autowired
	private UserDAO dao;
	
	@GetMapping(value = "user/login_ok.do", produces = "text/plain;charset=utf-8")
	public String user_login_ok(String id, String pwd, boolean ck, HttpSession session, HttpServletResponse response) {
		String result="";
		UserVO vo=dao.isLogin(id, pwd);
		if(vo.getMsg().equals("OK")) {
			session.setAttribute("user_no", vo.getUser_no());
			session.setAttribute("id", id);
			session.setAttribute("admin", vo.getAdmin());
			
			if (ck==true) {
				Cookie cookie=new Cookie("id", id);
				cookie.setPath("/");
				cookie.setMaxAge(60*60*24);
				response.addCookie(cookie);
				
				cookie=new Cookie("admin", vo.getAdmin());
				cookie.setPath("/");
				cookie.setMaxAge(60*60*24);
				response.addCookie(cookie);
				
			}
		}
		JSONObject obj=new JSONObject();
		obj.put("msg", vo.getMsg());
		obj.put("admin", vo.getAdmin());
		result=obj.toJSONString();
		
		return result;
	}
	
}
