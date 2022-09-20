package com.sist.aop;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.sist.manager.MusicManager;
import com.sist.service.SeoulService;
import com.sist.vo.MusicVO;
import com.sist.vo.SeoulVO;

@Aspect
@Component
public class CommonsAOP {
   @Autowired
   private SeoulService service;
   
   @Autowired
   private MusicManager mgr;
   
   @After("execution(* com.sist.web.*Controller.*(..))")
   public void after() {
	   // 현재 사용중인 request를 얻어 온다 
	   HttpServletRequest request=
			   ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
	   Map map=new HashMap();
	   map.put("table_name", "seoul_location");
	   List<SeoulVO> sList=service.seoulTop5(map);
	   
	   map.put("table_name", "seoul_nature");
	   List<SeoulVO> nList=service.seoulTop5(map);
	   
	   List<MusicVO> mList=mgr.musicTop5();
	   
	   request.setAttribute("sList", sList);
	   request.setAttribute("nList", nList);
	   
	   request.setAttribute("mList", mList);;
   }
}