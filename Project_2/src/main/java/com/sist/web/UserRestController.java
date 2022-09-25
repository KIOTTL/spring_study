package com.sist.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.UserDAO;
import com.sist.vo.UserVO;

@RestController
public class UserRestController {
	@Autowired
	private UserDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
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
	
	@GetMapping(value = "user/email_update.do", produces = "text/plain;charset=utf-8")
	public String user_email_update(UserVO vo) {
		String result="";
		dao.userEmailUpdate(vo);
		
		return "OK";
	}

	@GetMapping(value = "user/tel_update.do", produces = "text/plain;charset=utf-8")
	public String user_tel_update(UserVO vo) {
		String result="";
		
		vo.setTel(vo.getTel1()+"-"+vo.getTel2()+"-"+vo.getTel3());
		dao.userTelUpdate(vo);
		
		return "OK";
	}
	
	@GetMapping(value = "user/pwd_update.do", produces = "text/plain;charset=utf-8")
	public String user_pwd_update(UserVO vo) {
		String result="";

		String en=encoder.encode(vo.getPwd());
		vo.setPwd(en);
		result=dao.userPwdUpdate(vo);
		
		return result;		
	}
	
	@GetMapping(value = "user/card_update.do", produces = "text/plain;charset=utf-8")
	public String user_card_update(UserVO vo) {
		String result="";
		
		vo.setCard_number(vo.getCn1()+"-"+vo.getCn2()+"-"+vo.getCn3()+"-"+vo.getCn4());
		dao.userCardUpdate(vo);
		
		return "OK";
	}
	
}
