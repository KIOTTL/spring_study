package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

/*
 * 	USER_NO     NOT NULL NUMBER        
	ID          NOT NULL VARCHAR2(200) 
	PWD         NOT NULL VARCHAR2(300) 
	ADMIN       NOT NULL VARCHAR2(50)  
	NAME                 VARCHAR2(100) 
	EMAIL                VARCHAR2(300) 
	TEL                  VARCHAR2(300) 
	BDAY                 VARCHAR2(300) 
	CARD_NUMBER          VARCHAR2(500) 
	CARD_DATE            VARCHAR2(500) 
	CARD_PWD             VARCHAR2(500) 
	ZIPCODE              VARCHAR2(100) 
	ADDR                 VARCHAR2(300) 
	ADDR_DETAIL          VARCHAR2(300) 
 */

@Getter
@Setter
public class UserVO {
	private int user_no;
	private String id, pwd, admin, name, email, tel, bday, card_number, card_date, card_pwd, zipcode, addr, addr_detail, bank_name, msg, tel1, tel2, tel3, nowpwd,
					cn1, cn2, cn3, cn4;
}
