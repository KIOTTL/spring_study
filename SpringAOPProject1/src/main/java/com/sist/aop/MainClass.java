package com.sist.aop;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


/*
 * 	aspect : 공통모듈
 * 	JoinPoint : 시점(언제 호출할지)
 * 		- Before
 * 		- After
 * 		- AfterThrowing
 * 		- AfterReturning
 * 		- Around
 * 
 *  	public String movieListData(){
 *  		-------- Before
 *  		try {
 *  		  -------- Around ==> 수행시간, setAutoCommit(false)
 *			   소스코딩
 *			  -------- Around ==> commit
 *  		} catch(Exception ex) {
 *  		  ----------- AfterThrowing ==> rollback
 *  		} finally {
 *  		  ----------- After ==> setAutoCommit(true)
 *  		}
 * 	
 * 			return 값; --------- AfterReturning
 *  	}
 * 	PoinrCut : 어떤 메서드에 적용
 * 			   execution("* com.sist.main.MovieDAO.*(..)")
 * 			             --- 리턴형(전체)	   모든 메서드 -- --- 모든 매개변수
 * 			   within("com.sist.main.*") ==> 패키지에 있는 모든 클래스 적용
 * 	Advice : 기능 (JoinPoint+PointCut)
 * 	Weaving : 통합 => Proxy 패턴 (대리자)
 */
public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext app=new ClassPathXmlApplicationContext("app1.xml");
		MovieDAO dao=(MovieDAO)app.getBean("dao");
		dao.movieDetailData();
		dao.movieFindData();
		dao.movieListData();
	}

}
