package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.UserVO;
import com.sist.vo.*;

/*
 * USER_NO     NOT NULL NUMBER        
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
public interface MyPageMapper {
	
	@Select("SELECT user_no, id, name, email, tel, card_number, card_date, bank_name, zipcode, addr "
			+ "FROM user2_2 "
			+ "WHERE id=#{id}")
	public UserVO mypageProfile(String id);
	
	@Select("SELECT fg_no, title, img, goal_amount, TO_CHAR(close_date, 'YYYY.MM.DD') as dbday, num "
			+ "FROM (SELECT fg_no, title, img, goal_amount, close_date, rownum as num "
			+ "FROM (SELECT fg_no, title, img, goal_amount, close_date "
			+ "FROM funding_goods2_2 WHERE user_no=#{user_no} ORDER BY open_date ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<FundingGoodsVO> mypageProject(Map map);
	
	@Select("SELECT CEIL(COUNT (*)/5.0) FROM funding_goods2_2 "
			+ "WHERE user_no=#{user_no}")
	public int mypageProjectTotalPage(int user_no);
	
	@Select("SELECT COUNT(*) FROM funding_goods2_2 "
			+ "WHERE user_no=#{user_no}")
	public int mypageProjectCount(int user_no);
	
//	@Select("SELECT ph_no, rgdate, ph_price, expect_pay, user_no, fg_no "
//			+ "FROM pay_history2_2 WHERE user_no='#{user_no}' AND expect_pay<SYSDATE")
//	public List<PayHistoryVO> mypagePaying(int user_no);

	@Select("SELECT ph_no, TO_CHAR(rgdate, 'YYYY.MM.DD') as rgday, ph_price, TO_CHAR(expect_pay, 'YYYY.MM.DD') as epday, user_no, fg_no "
			+ "FROM pay_history2_2 WHERE user_no=#{user_no} AND expect_pay<SYSDATE")
	public List<PayHistoryVO> mypagePaying(int user_no);

	@Select("SELECT ph_no, TO_CHAR(rgdate, 'YYYY.MM.DD') as rgday, ph_price, TO_CHAR(expect_pay, 'YYYY.MM.DD') as epday, TO_CHAR(expect_pay+10, 'YYYY.MM.DD') as dbday, user_no, fg_no "
			+ "FROM pay_history2_2 WHERE user_no=#{user_no} AND expect_pay>=SYSDATE")
	public List<PayHistoryVO> mypagePayingFin(int user_no);
	
	@Select("SELECT COUNT(*) FROM pay_history2_2 "
			+ "WHERE user_no=#{user_no} AND expect_pay<SYSDATE")
	public int mypagePayingCount(int user_no);

	@Select("SELECT COUNT(*) FROM pay_history2_2 "
			+ "WHERE user_no=#{user_no} AND expect_pay>=SYSDATE")
	public int mypagePayingFinCount(int user_no);
	
	@Select("SELECT fg_no, title, img, sponsor, CEIL(close_date-SYSDATE) as leftday, now_amount, CEIL((now_amount/goal_amount)*100) as rate, fc_no, user_no FROM funding_goods2_2 WHERE fg_no=#{fg_no}")
	public FundingGoodsVO fundingData(int fg_no);
	
	@Select("SELECT * FROM user2_2 WHERE user_no=#{user_no}")
	public UserVO userData(int user_no);
	
	@Select("SELECT * FROM like2_2 WHERE user_no=#{user_no}")
	public List<LikeVO> mypageLike(int user_no);
	
}
