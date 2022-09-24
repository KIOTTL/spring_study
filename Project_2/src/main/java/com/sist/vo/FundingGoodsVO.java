package com.sist.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

/*
 * 	FG_NO       NOT NULL NUMBER         
	TITLE       NOT NULL VARCHAR2(500)  
	IMG         NOT NULL VARCHAR2(2000) 
	SUB_IMG     NOT NULL VARCHAR2(2000) 
	PRICE       NOT NULL NUMBER         
	CONTENT     NOT NULL CLOB           
	GOAL_AMOUNT NOT NULL NUMBER         
	NOW_AMOUNT           NUMBER         
	OPEN_DATE   NOT NULL DATE           
	CLOSE_DATE  NOT NULL DATE           
	SPONSOR              NUMBER         
	LIKE_COUNT           NUMBER         
	FC_NO       NOT NULL NUMBER         
	USER_NO     NOT NULL NUMBER   
 */

@Getter
@Setter
public class FundingGoodsVO {
	private int fg_no, price, goal_amount, now_amount, sponsor, like_count, fc_no, user_no, leftday, rate;
	private String title, img, sub_img, content, dbday, category, id;
	private Date open_date, close_date;
}
