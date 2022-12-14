package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	// 목록
	@GetMapping("board/list.do")
	public String board_list(String page, Model model) {
		if (page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		map.put("start", (curpage*10)-9);
		map.put("end", curpage*10);
		List<BoardVO> list=dao.boardListData(map);
		int totalpage=dao.boardTotalPage();
		
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("list", list);
		
		return "board/list";
				
	}
	
	// 추가 => 입력 폼 보여주기
	@GetMapping("board/insert.do")
	public String board_insert() {
		return "board/insert";
	}
	//@RequestMapping => GET/POST (Spring 4.3이상)
	@PostMapping("board/insert_ok.do")
	public String board_insert_ok(BoardVO vo) {
		// vo => 커맨드 객체
		dao.boardInsert(vo);
		
		return "redirect:list.do";
	}
	
	// detail.do?no=${vo.no }
	@GetMapping("board/detail.do")
	public String board_detail(int no, Model model) {
		BoardVO vo=dao.boardDetailData(no);
		
		model.addAttribute("vo", vo);
		
		return "board/detail";
	}
	
	// update.do?no=${vo.no }
	@GetMapping("board/update.do")
	// @ResponseBody => 승격 => @RestController
	public String board_update(int no, Model model) {
		BoardVO vo=dao.boardUpdateData(no);
		
		model.addAttribute("vo", vo);
		
		return "board/update";
	}
	
	@PostMapping("board/find.do")
	public String board_find(String[] fd, String ss, Model model) {
		Map map=new HashMap();
		map.put("fsArr", fd);
		map.put("ss", ss);
		List<BoardVO> list=dao.boardFindData(map);
		
		model.addAttribute("list", list);
		
		return "board/find";
	}
	
	@GetMapping("board/delete.do")
	public String board_delete(int no, Model model) {
		BoardVO vo=dao.boardDeleteData(no);
		
		model.addAttribute("vo",vo);
		
		return "board/delete";
	}
	
}

















