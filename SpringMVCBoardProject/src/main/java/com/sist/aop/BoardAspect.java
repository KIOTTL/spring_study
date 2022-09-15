package com.sist.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class BoardAspect {
	// 시점 => 메서드를 적용하는 위치 => JoinPoint
	// 어떤 메서드 => PointCut
	// JoinPoint + PointCut = Weaving
	@Before("execution(* com.sist.web.*Controller.*(..))")	// 메서드에 진입했을 때 호출
	public void before(JoinPoint jp) {
		String name=jp.getSignature().getName();
		System.out.println(name+" 진입");
	}
	
	@After("execution(* com.sist.web.*Controller.*(..))")	// 메서드를 종료했을 때 호출 => finally => 사이트에서 공통 출력 부분
	public void after(JoinPoint jp) {
		String name=jp.getSignature().getName();
		System.out.println(name+" 정삭적으로 수행 완료");
	}
	
	@AfterReturning(value="execution(* com.sist.web.*Controller.*(..))", returning = "obj")	// 정상수행했을 때 호출 => return값 받아서 처리
	public void afterReturning(String obj) {
		System.out.println(obj+".jsp로 이동 완료");
	}
}
