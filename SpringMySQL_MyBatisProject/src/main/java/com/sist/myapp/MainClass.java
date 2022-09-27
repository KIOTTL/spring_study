package com.sist.myapp;

import java.util.*;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sist.dao.*;

public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext app=new ClassPathXmlApplicationContext("app.xml");
		MemberDAO dao=(MemberDAO)app.getBean("memberDAO");
		List<MemberVO> list=dao.memberListData();
		for(MemberVO vo:list) {
			System.out.println(vo.getNo()+" "+vo.getName()+" "+vo.getSex()+" "+vo.getContent());
		}
	}

}
