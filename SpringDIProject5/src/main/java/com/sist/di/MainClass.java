package com.sist.di;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sist.config.EmpConfig;

public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String[] xml= {"app-context.xml", "app-datasource.xml"};
		ApplicationContext app=new ClassPathXmlApplicationContext(xml);
//		AnnotationConfigApplicationContext app=new AnnotationConfigApplicationContext(EmpConfig.class);
		EmpDAO dao=(EmpDAO)app.getBean("empDAO");	// @Repository("id") id가 없을시 default id => 클래스명 제일 앞글자만 소문자로
		List<EmpVO> list=dao.empListData();
		for (EmpVO vo:list) {
			System.out.println(vo.getEname()+" "+vo.getJob()+" "+vo.getSal());
		}
	}

}
