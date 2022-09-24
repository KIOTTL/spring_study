package com.sist.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@GetMapping("member/join.do")
	public String member_join(Model model) {
		model.addAttribute("main_jsp", "../member/join.jsp");
		
		return "main/main";
	}
	
	@PostMapping("member/join_ok.do")
	public String member_join_ok(MemberVO vo) {
		vo.setTel(vo.getTel1()+"-"+vo.getTel2());
		String en=encoder.encode(vo.getPwd());	// 암호화
		vo.setPwd(en);
		dao.memberJoinInsert(vo);
		
		return "redirect:../main/main.do";	// 재전송 (sendRedirect()) => request 초기화
	}
	
	@PostMapping("member/idcheck.do")
	@ResponseBody	// JSP 파일명, .do 전송이 아닌 일반 데이터, JSON 전송 => @RestController
	public String member_idcheck(String id) {
		String result="";
		int count=dao.memberIdCheck(id);
		if(count==0) {
			result="YES";
		} else {
			result="NO";
		}
		
		return result;
	}
	
	@GetMapping("member/login.do")
	public String member_login(Model model) {
		model.addAttribute("main_jsp", "../member/login.jsp");
		
		return "main/main";
	}
	
	@PostMapping("member/login_ok.do")
	@ResponseBody // 다이렉트 (결과값만 보냄)
	public String member_login_ok(String id, String pwd, boolean ck, HttpSession session, HttpServletResponse response) {
		String result="";
		int count=dao.memberIdCheck(id);
		if(count==0) {
			result="NOID";
		} else {
			MemberVO vo=dao.memberJoinInfoData(id);
			if(encoder.matches(pwd, vo.getPwd())) {	//matches(암호화 전, 암호화 후)
				session.setAttribute("id", id);
				session.setAttribute("name", vo.getName());
				session.setAttribute("role", vo.getRole());
				
				if(ck==true) {
					Cookie cookie=new Cookie("id", id);
					cookie.setPath("/");
					cookie.setMaxAge(60*60*24); // 하루
					response.addCookie(cookie);
					/////////////////////////////////
					cookie=new Cookie("name", vo.getName());
					cookie.setPath("/");
					cookie.setMaxAge(60*60*24); // 하루
					response.addCookie(cookie);
					/////////////////////////////////
					cookie=new Cookie("role", vo.getRole());
					cookie.setPath("/");
					cookie.setMaxAge(60*60*24); // 하루
					response.addCookie(cookie);
				}
				
				result="OK";
			} else {
				result="NOPWD";
			}
		}
		
		return result;
	}
	
	@GetMapping("member/logout.do")
	public String member_logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:../main/main.do";
	}
	
	@GetMapping("member/join_before.do")
	public String member_before(Model model) {
		model.addAttribute("main_jsp", "../member/join_before.jsp");
		
		return "main/main";
	}
	
	@GetMapping("member/join_before_ok.do")
	@ResponseBody
	public String member_before_ok(String pwd, HttpSession session) {
		String id=(String)session.getAttribute("id");
		String result="";
		String db_pwd=dao.memberGetPassword(id);
		System.out.println(pwd);
		System.out.println(db_pwd);
		if(encoder.matches(pwd, db_pwd)) {
			result="yes";
		} else {
			result="no";
		}
		
		return result;
	}
	
	@GetMapping("member/join_update.do")
	public String join_update(Model model, HttpSession session) {
		String id=(String)session.getAttribute("id");
		MemberVO vo=dao.memberUpdateData(id);
		
		model.addAttribute("vo", vo);
		model.addAttribute("main_jsp", "../member/join_update.jsp");
		
		return "main/main";
	}
	
	@PostMapping("member/join_update_ok.do")
	public String join_update_ok(MemberVO vo, HttpSession session) {
		vo.setTel(vo.getTel1()+"-"+vo.getTel2());
		
		dao.memberUpdate(vo);
		session.setAttribute("name", vo.getName());
		
		return "redirect:../main/main.do";
	}
	
}
