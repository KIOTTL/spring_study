package com.sist.spring2;

public class HelloImp1 implements Hello{

	@Override
	public void sayHello() {	// 수정시 본인만 에러 => 결합성 낮음
		// TODO Auto-generated method stub
		System.out.println("인터페이스 이용");
	}
	
}
