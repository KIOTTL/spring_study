package com.sist.spring1;

// 1. new 사용 x
// 	  new를 사용하면 결합성이 높은 프로그램 (유지보수 힘듦)
//	  Class.forName() 사용
public class Hello {
	public void sayHello(String name) {
		System.out.println(name+"님 안녕하세요");
	}
}
