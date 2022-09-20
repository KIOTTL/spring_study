package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.*;
import com.sist.mapper.*;
import com.sist.vo.*;

/*
 * 	1. 스프링 : 클래스를 모아서 관리 (의존성이 낮은 프로그램 = 유지보수시 다른 클래스에 영향이 없는 프로그램)
 * 			  =========== 사용자 정의, 라이브러리(컨테이너)
 * 			   클래스 : 컴포넌트 (기능을 가지고 있는 클래스)
 * 		컨테이너에 대한 종류, 역할
 * 			BeanFactory
 * 				 |
 * 		 ApplicationContext - AnnotationConfigApplicationContext(자바로 환경설정)
 * 				 |
 * 		WebApplicationContext - AnnotationConfigWebApplicationContext
 * 
 * 	2. 클래스를 모아서 관리
 * 		사용자 요청 => 클래스 찾기 (DL) => getBean()
 * 		클래스 관리를 하기 위해 필요한 데이터 첨부 => DI
 * 
 * 	3. MVC (스프링 라이브러리)
 *     ==> 자바 / 오라클 / JSP / 스프링 / AWS
 *     스프링 생명주기 (객체 생명주기 관리 : 생성 ~ 소멸)
 *     	IoC (제어의 역전) : 스프링을 통해서 객체를 가지고 온다
 *     					 ========== 지금은 DI로 통합 (객체와 객체의 연관 관계 설계)
 *     	1. 클래스 메모리 할당 (모든 클래스) => 생성자를 통해서 필요한 데이터 주입
 *     		1) 한개씩 생성
 *     			<bean id="구분자" class="패키지.클래스명">
 *     		2) 패키지 단위로 생성
 *     			<context:component-scan base-package="패키지명">
 *     								    ---------------------
 *     									메모리 할당 대상 (선택)
 *     									@Controller : 웹 화면 변경 / 사용자 요청 처리 / JSP에 출력할 데이터 전송
 *     												  --------
 *     												  forward (request를 유지하면서 새로운 데이터 추가)
 *     												  => request 대신 Model(전송객체)
 *     														==> addAttribute()
 *     														==> return "경로명/파일명";
 *     												  redirect : request를 초기화, 기존에 만든 파일로 이동
 *     														==> Model 사용 불가 (재전송)
 *     														==> return "redirect:~.do";
 *     												  핵심 : 매개변수 (사용자가 요청한 데이터)
 *     												  웹 : C/S (Client/Server) ==> 리턴형(String, void)
 *     									@RestController : 사용자 요청 처리 / 다른 프로그램에 데이터 전송
 *     														=> 자바 스크립트, Kotlin, C#
 *     														=> JSON (자바스크립트 객체 표현법)
 *     														=> {키:값, 키:값, ...} => 키는 멤버변수
 *     														=> let sa={"sabun":1, "name":"홍길동"}
 *     														=> sa.sabun, sa.name
 *     													 	=> 일반 데이터 (OK, NOPWD), VO단위(JSONObject), List단위(JSONArray)
 *     																				      {}                [{},{}]
 *     														=> Spring-Boot는 자동으로 JSON
 *     										Get/Post => @GetMapping/@PostMapping => Get+Post=@RequestMapping
 *     										@DeleteMapping (삭제), @PutMapping (Update)
 *     									@Component : 일반 클래스 (AOP, Intercepter, MainClass, ~Manager)
 *     									@Repository : DAO(데이터베이스)
 *     									@Service : BI(DAO통합)
 *     									@ControllerAdvice : 통합 예외처리
 *     
 *     									==> 메모리 할당 제외
 *     										~VO : 사용자 정의 데이터형
 *     										~Mapper : 인터페이스
 *     	2. Setter DI
 *     		어노테이션으로 메모리 할당시 DI를 사용할 수 없다
 *     		----------------------------------
 *     		DI)
 *     			= 일반 데이터 주입(X) => properties파일을 만들어서 사용 가능
 *     			= 객체 주소 주입 => @Autowired
 *     			<bean id="" class="" p:~="">
 *     			일반 변수 : p:name=""
 *     			주소값 : p:ds-ref="id명"
 *     	3. 대기
 *     	----------------- 객체 생성 (사용자가 호출시)
 *     	4. 사용자가 필요한 위치에서 객체 요청
 *     	--------------------------------------
 *     	5. 객체 소별
 *     
 * 	     기능
 * 		  1) DI : setterDI, constructor DI
 * 				  methodDI (객체 생성시 : init-method, 객체 소멸시 : destroy-method)
 * 		  2) AOP : 공통모듈 (모든 Web에서 사용) => 자동 호출
 * 				   ============	
 * 					Join Point : 첨부할 위치
 * 						Before
 * 						After
 * 						After-Returning
 * 						After-Throwing
 * 						Around
 * 					Point Cut : 메서드 대상
 * 				   ============ + Advice
 * 				   ====================== Aspect
 * 						
 * 		  3) MVC : 사용자 요청 ~.do ===> DispatcherServlet === @Controller, @RestController
 * 														   == 구분자 (GetMapping, PostMapping)
 * 															| 사용자가 보내준 요청 데이터를 매개변수로 받을 수 있다
 * 															| 처리 결과값을 보낸다
 * 														   ViewResolver : JSP를 찾는 역할
 * 															==> 경로명/파일명
 * 															|
 * 														   JSP
 * 		  4) ORM (MyBatis)
 * 				= XML 버전 많이 사용
 * 				= 어노테이션 버전으로 변경
 * 				4버전 (혼합), 5버전 (순수 자바)
 */
// MyBatis
@Repository
public class SeoulDAO {
	@Autowired
	private SeoulMapper mapper;
	
	public List<SeoulVO> seoulListData(Map map) {
		return mapper.seoulListData(map);
	}
	
	public int seoulTotalPage(Map map) {
		return mapper.seoulTotalPage(map);
	}
	
	public SeoulVO seoulDetailData(Map map) {
		mapper.hitIncrement(map);
		return mapper.seoulDetailData(map);
	}
	
	public MemberVO isLogin(String id, String pwd) {
		MemberVO vo=new MemberVO();
		int count=mapper.memberIdCheck(id);
		if(count==0) {
			vo.setMsg("NOID");
		} else {
			MemberVO rvo=mapper.memberInfoData(id);
			if(pwd.equals(rvo.getPwd())) {
				vo.setMsg("OK");
				vo.setName(rvo.getName());
				vo.setId(id);
			} else {
				vo.setMsg("NOPWD");
			}
		}
		
		return vo;
	}
}
