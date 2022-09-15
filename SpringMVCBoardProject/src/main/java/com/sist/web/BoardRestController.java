package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.*;

// JavaScript, 일반 데이터, JSON	/	controller는 jsp를 넘겨서 받음 => return값은 항상 파일(경로)명
// update.do, update_ok.jsp(x)
@RestController
public class BoardRestController {
	@Autowired
	private BoardDAO dao;
	
	/*
	 * 	HTML (JavaScript) : text/html
	 * 	JSON : text/plain
	 */
	/* @PostMapping("board/update_ok.do") */
	@PostMapping(value="board/update_ok.do", produces = "text/html; charset=UTF-8")
	public String board_update_ok(BoardVO vo) {
		// 자바 스크립트 전송
		String result="";
		boolean bCheck=dao.boardUpdate(vo);
		if (bCheck==true) {
			result="<script>"
					+"location.href=\"detail.do?no="+vo.getNo()+"\""
					+"</script>";
		} else {
			result="<script>"
					+"alert(\"Password Fail\");"	// 한글 변환하지 않으면 한글 깨짐 (한글깨짐방지=>produces)
					+"history.back();"
					+"</script>";
//			result="redirect:detail.do?no="+vo.getNo();	// 문자로 출력 => controller에서만 사용
		}
		
		return result;
	}
	
	@PostMapping(value="board/delete_ok.do", produces = "text/html; charset=UTF-8")
	public String board_delete_ok(BoardVO vo) {
		String result="";
		boolean bCheck=dao.boardDelete(vo);
		if (bCheck==true) {
			result="<script>"
					+"location.href=\"list.do\""
					+"</script>";
		} else {
			result="<script>"
					+"alert(\"Password Fail\");"	
					+"history.back();"
					+"</script>";			
		}
		
		return result;
	}
}
