package com.sist.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.dao.FoodDAO;
import com.sist.dao.FoodVO;

/*
 * 	모델 제작 (요청에 처리)
 * 	
 * 	사용자 요청 ------------ DispatcherServlet -------------- HandlerMapping
 * 								|								| Model 클래스를 찾아준다 (요청처리 -> 프로그래머)
 * 						  ViewResolver (경로명, 확장자)			 
 * 						  ----------- View(JSP) : 화면 출력
 * 	1. @Controller : Model을 못 찾거나 (404)일 경우
 * 					 @Controller 유무 확인
 * 					 return => 설정된 JSP가 있는지 확인
 * 	2. 요청 처리에 필요한 모든 객체를 스프링으로 받아서 저장
 * 	   => @Autowired
 * 	3. 요청 URI 받기 => (405)
 * 		@RequestMapping
 * 		@GetMapping
 * 		@PostMapping
 * 	4. 요청 처리 메서드 만들기
 * 		1) 리턴형 (String), void
 * 		2) 매개변수 (사용자가 보내준 모든 데이터형 처리), VO 단위, List 단위, [] 단위
 *         ---------------------------------------------------------- 내장 객체를 요청
 *         	  request, response, session, Model, RedirectAttributes
 *   	3) 매개변수로 등록된 모든 데이터는 DispatcherServlet에서 값 주입
 *   	4) 순서 관계 x
 *   	5) 잘못된 데이터형을 입력했을 경우 (400)
 */

@Controller
public class FoodController {
	@Autowired
	private FoodDAO dao;
	// 스프링에서 생성된 객체를 받아서 사용 => 자동으로 주소값을 얻어 온다
	// 필요한 객체를 멤버로 생성해서 주소값을 받는다
	
	@GetMapping("food/list.do")
	public String food_list(String page, Model model, HttpServletRequest request) {
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=12;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		map.put("start", start);
		map.put("end", end);
		List<FoodVO> list=dao.foodListData(map);
		int totalpage=dao.foodTotalPage();
		
		// cookie
		Cookie[] cookies=request.getCookies();
		List<FoodVO> fList=new ArrayList<FoodVO>();
		if(cookies!=null) {
			for (int i=cookies.length-1; i>=0; i--) {
				if (cookies[i].getName().startsWith("food")) {
					cookies[i].setPath("/");
					String fno=cookies[i].getValue();
					FoodVO vo=dao.foodDetailData(Integer.parseInt(fno));
					fList.add(vo);
				}
			}
		}
		
		model.addAttribute("curpage", curpage);
		model.addAttribute("list", list);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("fList", fList);
		model.addAttribute("size", fList.size());
		
		return "list";
	}
	
	// detail.do?fno=${vo.fno }
	@GetMapping("food/detail.do")
	public String food_detail(int fno, Model model) {
		FoodVO vo=dao.foodDetailData(fno);
		model.addAttribute("vo", vo);
		
		return "detail";
	}
	
	@GetMapping("food/find.do")
	public String food_find() {
		
		return "find";
	}
	
	@GetMapping("food/detail_before.do")
	public String food_detail_before(int fno, HttpServletResponse response) {
		Cookie cookie=new Cookie("food"+fno, String.valueOf(fno));
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		
		return "redirect:detail.do?fno="+fno;
	}
	
	@GetMapping("food/cookie_all_delete.do")
	public String food_cookie_all_delete(HttpServletRequest request, HttpServletResponse response) {
		Cookie[] cookies=request.getCookies();
		for (int i=cookies.length-1; i>=0; i--) {
			if (cookies[i].getName().startsWith("food")) {
				cookies[i].setPath("/");
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
			}
		}
		
		return "redirect:list.do";
	}
	
}

















