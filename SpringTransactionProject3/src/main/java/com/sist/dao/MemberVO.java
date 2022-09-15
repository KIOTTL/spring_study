package com.sist.dao;

import lombok.Getter;
import lombok.Setter;

/*
 * 	ID   NOT NULL VARCHAR2(20) 
	PWD  NOT NULL VARCHAR2(10) 
	NAME NOT NULL VARCHAR2(34) 
 */

@Getter
@Setter
public class MemberVO {
	private String id, pwd, name;
}
