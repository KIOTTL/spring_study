package com.sist.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Delete;
import org.snu.ids.ha.index.Keyword;
import org.snu.ids.ha.index.KeywordExtractor;
import org.snu.ids.ha.index.KeywordList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.sist.dao.DataBoardDAO;
import com.sist.dao.DataBoardVO;
import com.sist.dao.DataVO;

@Controller
@RequestMapping("databoard/")	// 공통부분
public class DataBoardController {
	@Autowired
	private DataBoardDAO dao;
	
	@GetMapping("list.do")
	public String databoard_list(String page, Model model) {
		// Model 전송 객체 ==> request를 list.jsp로 전송 (가급적이면 request를 사용하지 않는다(request 안에 IP))
		if (page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		// 해당 페이지의 데이터값
		Map map=new HashMap();
		int rowSize=10;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		map.put("start", start);
		map.put("end", end);
		List<DataBoardVO> list=dao.boardListData(map);
		// 총 페이지
		int totalpage=dao.boardTotalPage();
		// list.jsp로 받은 데이터 전송 ==> 화면에 출력
		model.addAttribute("list", list);
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		
		return "databoard/list";
	}
	
	@GetMapping("insert.do")
	public String databoard_insert() {
		return "databoard/insert";
	}
	
	@PostMapping("insert_ok.do")
	public String databoard_insert_ok(DataBoardVO vo) {
		List<MultipartFile> list=vo.getFiles();
		String path="c:\\download\\";
		try {
			if (list==null) {	// 파일 업로드가 안 된 경우
				vo.setFilename("");
				vo.setFilesize("");
				vo.setFilecount(0);
			} else {	// 업로드가 된 경우
				String temp1="";
				String temp2="";
				for (MultipartFile mf:list) {
					String filename=mf.getOriginalFilename();	// 사용자가 선택한 파일명
					mf.transferTo(new File(path+filename)); 
					// 업로드
					temp1+=filename+",";
					File f=new File(path+filename);
					long len=f.length();
					temp2+=len+",";
				}
				temp1=temp1.substring(0,temp1.lastIndexOf(","));	// 가장 뒤 , 제거
				temp2=temp2.substring(0,temp2.lastIndexOf(","));
				vo.setFilename(temp1);
				vo.setFilesize(temp2);
				vo.setFilecount(list.size());
			}
			dao.boardInsert(vo);
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return "redirect:list.do";
	}
	
	@GetMapping("detail.do")
	// 파일명(크기 bytes)
	public String databoard_detail(int no, Model model) {
		// DAO 연동 => 다운로드
		DataBoardVO vo=dao.databoardDetailData(no);
		model.addAttribute("vo", vo);
		
		if (vo.getFilecount()!=0) {
			List<String> fList=new ArrayList<String>();
			List<String> sList=new ArrayList<String>();
			StringTokenizer st=new StringTokenizer(vo.getFilename(), ",");
			while(st.hasMoreTokens()) {
				fList.add(st.nextToken());
			}
			
			st=new StringTokenizer(vo.getFilesize(), ",");
			while(st.hasMoreTokens()) {
				sList.add(st.nextToken());
			}
			
			model.addAttribute("fList", fList);
			model.addAttribute("sList", sList);
		}
		
		String data=vo.getContent();
		data=data.replaceAll("[0-9]", "");
		data=data.replaceAll("[a-zA-Z]", "");
		KeywordExtractor ke=new KeywordExtractor();
		KeywordList kl=ke.extractKeyword(data, true);
		List<DataVO> list=new ArrayList<DataVO>();
		for (int i=0; i<kl.size(); i++) {
			Keyword kwrd=kl.get(i);
			if (kwrd.getCnt()>2) {	// 2번이상 언급
				DataVO dvo=new DataVO();
				dvo.setWord(kwrd.getString());
				dvo.setCount(kwrd.getCnt());
				list.add(dvo);
			}
		}
		
		model.addAttribute("list", list);
		
		return "databoard/detail";
	}
	
	@GetMapping("download.do")
	public void databoard_download(String fn, HttpServletResponse response) {
		try {
			File file=new File("c:\\download\\"+fn);
			response.setContentLength((int)file.length());
			response.setHeader("Content-Disposition", "attachment;filename="+URLEncoder.encode(fn,"UTF-8"));
			
			// 다운로드 창
			BufferedInputStream bis=new BufferedInputStream(new FileInputStream(file));	// 서버
			BufferedOutputStream bos=new BufferedOutputStream(response.getOutputStream());	// 클라이언트
			byte[] buffer=new byte[1024];
			int i=0;	// 읽은 바이트 수
			while((i=bis.read(buffer, 0, 1024))!=-1) {	// -1(EOF)
				bos.write(buffer, 0, i);
			}
			bis.close();
			bos.close();
		} catch(Exception ex) {}
	}
	
	@GetMapping("update.do")
	public String databoard_update(int no, Model model) {
		DataBoardVO vo=dao.databoardUpdateData(no);
		model.addAttribute("vo", vo);
		
		return "databoard/update";
	}
	
	@GetMapping("delete.do")
	public String databoard_delete(int no, Model model) {
		model.addAttribute("no", no);
		
		return "databoard/delete";
	}
	
}

