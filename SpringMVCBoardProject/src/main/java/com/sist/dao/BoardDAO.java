package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.BoardMapper;

// 스프링 클래스 관리 제외 (~VO(사용자 정의 데이터형), Mapper(interface))
@Repository
public class BoardDAO {
	// 인터페이스를 구현한 클래스의 주소값 스프링에 요청
	@Autowired
	private BoardMapper mapper;
	
	/*
	 * @Select("SELECT no, subject, name, TO_CHAR(regdate, 'YYYY-MM-DD') as dbday, hit, num "
	 * + "FROM (SELECT no, subject, name, regdate, hit, rownum as num " +
	 * "FROM (SELECT no, subject, name, regdate, hit " +
	 * "FROM spring_board ORDER BY no DESC)) " +
	 * "WHERE num BETWEEN #{start} AND #{end}")
	 */
	public List<BoardVO> boardListData(Map map) {
		return mapper.boardListData(map);
	}
	
	/* @Select("SELECT CEIL(COUNT(*)/10.0 FROM spring_board") */
	public int boardTotalPage() {
		return mapper.boardTotalPage();
	}
	
	/*
	 * @SelectKey(keyProperty = "no", resultType = int.class, before = true,
	 * statement = "SELECT NVL(MAX(no)+1,1) as no FROM spring_board")
	 * 
	 * @Insert("INSERT INTO spring_board VALUES( " +
	 * "#{no}, #{name}, #{subject}, #{content}, #{pwd}, SYSDATE, 0)")
	 */
	public void boardInsert(BoardVO vo) {
		mapper.boardInsert(vo);
	}
	
	/*
	 * @Update("UPDATE spring_board SET " + "hit=hit+1 " + "WHERE no=#{no}")
	 * @Select("SELECT no, name, subject, content, TO_CHAR(regdate, 'YYYY-MM-DD) as dbday, hit "
	 * + "FROM spring_board " + "WHERE no=#{no}")
	 */
	 
	public BoardVO boardDetailData(int no) {
		mapper.hitIncrement(no);
		return mapper.boardDetailData(no);	
	}
	
	/*
	 * @Select("SELECT no, name, subject, content, TO_CHAR(regdate, 'YYYY-MM-DD) as dbday, hit "
	 * + "FROM spring_board " + "WHERE no=#{no}")
	 */
	public BoardVO boardUpdateData(int no) {
		return mapper.boardDetailData(no);	
	}
	
	/*
	 * @Update("UPDATE spring_board SET " +
	 * "name=#{name}, subject=#{subject}, content=#{content} " + "WHERE no=#{no}")
	 * 
	 * @Select("SELECT pwd FROM spring_board " + "WHERE no=#{no}")
	 */
	public boolean boardUpdate(BoardVO vo) {
		boolean bCheck=false;
		String db_pwd=mapper.boardGetPassword(vo.getNo());	// vo.getNo => type=hidden
		if(db_pwd.equals(vo.getPwd())) {
			bCheck=true;
			mapper.boardUpdate(vo);
		} else {
			bCheck=false;
		}
		
		return bCheck;
	}
	
	public List<BoardVO> boardFindData(Map map) {
		return mapper.boardFindData(map);
	}
	
	public BoardVO boardDeleteData(int no) {
		return mapper.boardDetailData(no);	
	}
	
	public boolean boardDelete(BoardVO vo) {
		boolean bCheck=false;
		String db_pwd=mapper.boardGetPassword(vo.getNo());
		if(db_pwd.equals(vo.getPwd())) {
			bCheck=true;
			mapper.boardDelete(vo.getNo());
		} else {
			bCheck=false;
		}
		System.out.println(bCheck);
		
		return bCheck;
	}
	
}
















