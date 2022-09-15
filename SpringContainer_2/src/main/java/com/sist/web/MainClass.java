package com.sist.web;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import java.util.*;

public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext app=new ClassPathXmlApplicationContext("app.xml");
//		EmpDAO dao=(EmpDAO)app.getBean("dao");
		EmpDAO dao=app.getBean("dao",EmpDAO.class);
		System.out.println("dao="+dao);
		EmpDAO dao1=app.getBean("dao",EmpDAO.class);
		System.out.println("dao1="+dao);
		EmpDAO dao2=app.getBean("dao",EmpDAO.class);
		System.out.println("dao2="+dao);
		/*
		 * app.xml (7)
		 * <bean id="dao" class="com.sist.web.EmpDAO" scope="prototype" => 주소 다 다름, 안쓰면 자동 scope="singletone"
		 */
		
		List<EmpVO> list=dao.empListData();
		for (EmpVO vo:list) {
			System.out.println(vo.getEmp()+" "+vo.getEname()+" "+vo.getJob()+" "+vo.getHiredate().toString()
								+" "+vo.getSal());
		}
	}

}
