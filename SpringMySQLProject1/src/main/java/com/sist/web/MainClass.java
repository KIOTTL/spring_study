package com.sist.web;

import java.util.*;
import com.sist.dao.*;

public class MainClass {
	public static void main(String[] args) {
		MemberDAO dao=new MemberDAO();
		List<MemberVO> list=dao.memberListData();
		for(MemberVO vo:list) {
			System.out.println(vo.getNo()+" "+vo.getName()+" "+vo.getSex()+" "+vo.getContent());
		}
	}
}
