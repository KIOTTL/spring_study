package com.sist.aop;

import java.util.List;

import org.aspectj.lang.ProceedingJoinPoint;

import com.sist.dao.MovieVO;

// getConnection => Before
// disConnection => After
// 기능 수행시 시간 출력 ==> Around
public class MovieAspect {
	public Object around(ProceedingJoinPoint jp) throws Throwable {
		Object obj=null;
		long start=0;
		long end=0;
		try {
			start=System.currentTimeMillis();	// 시작 시간
			System.out.println("Client 요청 메서드 : "+jp.getSignature().getName());
			// 메서드 호출
			obj=jp.proceed();	// invoke
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			end=System.currentTimeMillis();
			System.out.println("수행 시간 : "+(end-start)); 
		}
		return obj;
	}
	
	public void afterReturning(Object obj) throws Throwable {
		List<MovieVO> list=(List<MovieVO>)obj;
		for(MovieVO vo:list) {
			System.out.println(vo.getMno()+". "+vo.getTitle()+" ("+vo.getGenre()+")");
		}
	}
	
	public void afterThrowing(Throwable ex) throws Throwable {
		System.out.println(ex.getMessage());
	}
}
