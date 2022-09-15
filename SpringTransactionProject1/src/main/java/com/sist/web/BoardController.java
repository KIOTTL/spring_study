package com.sist.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.sist.dao.BoardDAO;
import com.sist.dao.BoardVO;

@Controller
public class BoardController {
	@Autowired
	private BoardDAO dao;
	
	@GetMapping("board/list.do")
	public String board_list(String page, Model model) {
		if (page==null)
			page="1";
		int curpage=Integer.parseInt(page);	// 400 (bad request) => 모든 데이터 String 가능
		List<BoardVO> list=dao.boardListData(curpage);
		int totalpage=dao.boardTotalPage();
		
		model.addAttribute("list", list);
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		
		int count=dao.boardCount();
		count=count-((10*curpage)-10);
		model.addAttribute("count", count);
		
		return "board/list";
	}
	
	@GetMapping("board/insert.do")
	public String board_insert() {	// 입력 폼
		
		return "board/insert";
	}
	
	@PostMapping("board/insert_ok.do")
	public String board_insert_ok(BoardVO vo) {
		dao.boardInsert(vo);
		
		return "redirect:list.do";	// 재전송 (request 전송x) => sendRedirect()
	}
	
	@GetMapping("board/detail.do")
	public String board_detail(int no, Model model) {
		BoardVO vo=dao.boardDetailData(no);
		model.addAttribute("vo", vo);
		
		return "board/detail";
	}
	
	@GetMapping("board/reply.do")
	public String board_reply(int no, Model model) {
		model.addAttribute("no", no);
		
		return "board/reply";
	}
	
	@PostMapping("board/reply_ok.do")
	public String board_reply_ok(int pno, BoardVO vo) {
		dao.boardReplyInsert(pno, vo);
		
		return "redirect:list.do";
	}
	
	@GetMapping("board/update.do")
	public String board_update(int no, Model model) {
		BoardVO vo=dao.boardUpdateData(no);
		
		model.addAttribute("vo", vo);
		
		return "board/update";
	}
	
	@PostMapping("board/update_ok.do")
	public String board_update_ok(BoardVO vo, Model model) {
		boolean bCheck=dao.boardUpdate(vo);
		
		model.addAttribute("bCheck", bCheck);
		model.addAttribute("no", vo.getNo());
		
		return "board/update_ok";
	}
	
	@GetMapping("board/delete.do")
	public String board_delete(int no, Model model) {
		model.addAttribute("no", no);
		
		return "board/delete";
	}
	
	@PostMapping("board/delete_ok.do")
	public String board_delete_ok(int no, String pwd, Model model) {
		boolean bCheck=dao.boardDelete(no, pwd);
		
		model.addAttribute("bCheck", bCheck);
		
		return "board/delete_ok";
	}
	
}
