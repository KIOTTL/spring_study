package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.sist.dao.ReplyVO;

public interface ReplyMapper {
	@Select("SELECT no,bno,id,name,msg,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday,group_tab,type "
			 +"FROM spring_reply "
			 +"WHERE bno=#{bno} AND type=#{type} "
			 +"ORDER BY group_id DESC , group_step ASC")
	public List<ReplyVO> replyListData(ReplyVO vo);
	
	// MySQL ==> NVL() : IFNULL
	// 			 TO_CHAR : DATE_FORMAT
	// NUMBER : int, double / VARCHAR2 : VARCHAR / CLOB : text
	@SelectKey(keyProperty = "no",resultType = int.class,before = true, 
			  statement = "SELECT NVL(MAX(no)+1,1) as no FROM spring_reply")
	@Insert("INSERT INTO spring_reply(no,bno,id,name,msg,group_id,type) VALUES("
			 +"#{no},#{bno},#{id},#{name},#{msg},(SELECT NVL(MAX(group_id)+1,1) as no FROM spring_reply),#{type})")
	public void replyInsert(ReplyVO vo);
	
	// 수정
	@Update("UPDATE spring_reply SET "
			+ "msg=#{msg} "
			+ "WHERE no=#{no}")
	public void replyUpdate(ReplyVO vo);
	
	/*					group_id   group_step   group_tab
	 * 	AAAA			    1			0			0
	 * 	 => BBBB			1			1			1
	 *       => CCCC		1			2			2
	 *   => DDDD			1			1			1
	 */
	
	// 대댓글
	// pno(상위 번호) = group_id, group_step, group_tab
	@Select("SELECT group_id, group_step, group_tab "
			+ "FROM spring_reply "
			+ "WHERE no=#{no}")
	public ReplyVO replyParentInfoData(int no);
	// group_step 변경
	@Update("UPDATE spring_reply SET "
			 +"group_step=group_step+1 "
			 +"WHERE group_id=#{group_id} AND group_step>#{group_step}")
	  public void replyGroupStepIncrement(ReplyVO vo);
	// insert
	@SelectKey(keyProperty = "no",resultType = int.class,before = true, 
			  statement = "SELECT NVL(MAX(no)+1,1) as no FROM spring_reply")
	@Insert("INSERT INTO spring_reply(no,bno,id,name,msg,group_id,type,group_step,group_tab,root) VALUES("
			 +"#{no},#{bno},#{id},#{name},#{msg},#{group_id},#{type},#{group_step},#{group_tab},#{root})")
	public void replyReplyInsert(ReplyVO vo);
	// depth 변경
	@Update("UPDATE spring_reply SET "
			 +"depth=depth+1 "
			 +"WHERE no=#{no}")
	public void replyDepthIncrement(int no);
	
	// 삭제
	// 1. depth, root 가지고 오기 => depth : 대댓글 개수
	@Select("SELECT depth, root FROM spring_reply "
			+ "WHERE no=#{no}")
	public ReplyVO replyInfoData(int no);
	// 2. depth>0 UPDATE(관리자가 삭제한 댓글입니다), depth==0 DELETE
	@Update("UPDATE spring_reply SET "
			+ "msg='관리자가 삭제한 댓글입니다' "
			+ "WHERE no=#{no}")
	public void replyMsgUpdate(int no);
	
	@Delete("DELETE FROM spring_reply "
			+ "WHERE no=#{no}")
	public void replyDelete(int no);
	// 3. depth 감소
	@Update("UPDATE spring_reply SET "
			+ "depth=depth-1 "
			+ "WHERE no=#{no}")
	public void replyDepthDecrement(int no);
	
}
