package com.sist.vo;

import java.util.Date;

import lombok.Setter;

import lombok.Getter;

/*
 * 	PH_NO         NOT NULL NUMBER        
	ORDER_NUM     NOT NULL NUMBER        
	RGDATE        NOT NULL DATE          
	COUNT         NOT NULL NUMBER        
	STATUS                 VARCHAR2(100) 
	PH_PRICE      NOT NULL NUMBER        
	DELIVERY_NAME          VARCHAR2(100) 
	NAME          NOT NULL VARCHAR2(100) 
	ZIPCODE                VARCHAR2(100) 
	ADDR                   VARCHAR2(100) 
	ADDR_DETAIL            VARCHAR2(100) 
	TEL                    VARCHAR2(100) 
	EXPECT_PAY             DATE          
	USER_NO       NOT NULL NUMBER        
	SG_NO                  NUMBER        
	FG_NO         NOT NULL NUMBER 
 */

@Getter
@Setter
public class PayHistoryVO {
	private int ph_no, order_num, count, ph_price, user_no, sg_no, fg_no;
	private String status, delivery_name, name, zipcode, addr, addr_detail, tel, rgday, epday, dbday;
	private Date rgdate, expect_pay;
}
