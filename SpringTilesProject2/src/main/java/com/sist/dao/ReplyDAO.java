package com.sist.dao;

import org.springframework.stereotype.Repository;

import java.util.*;
import java.sql.*;
import com.sist.vo.*;

import oracle.jdbc.OracleTypes;



@Repository
public class ReplyDAO {
	private Connection conn;
	private CallableStatement cs;	// 프로시저 호출 클래스
	private final String URL="jdbc:oracle:thin:@183.98.140.90:1521:XE";
	
	public ReplyDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch(Exception ex) {}
	}
	
	public void getConnection() {
		try {
			conn=DriverManager.getConnection(URL, "hr", "happy");
		} catch(Exception ex) {}
	}
	
	public void disConnection() {
		try {
			if(cs!=null) cs.close();
			if(conn!=null) conn.close();
		} catch(Exception ex) {}
	}
	
	// 댓글 추가
	/*
	 * 	CREATE OR REPLACE PROCEDURE replyInsert(
		    pCno spring_reply2.cno%TYPE,
		    pType spring_reply2.type%TYPE,
		    pId spring_reply2.id%TYPE,
		    pName spring_reply2.name%TYPE,
		    pMsg spring_reply2.msg%TYPE
		)
		IS
		BEGIN
		    INSERT INTO spring_reply2 VALUES(
		        (SELECT NVL(MAX(no)+1,1) FROM spring_reply2),
		        pCno, pType, pId, pName, pMsg, SYSDATE
		    );
		    COMMIT;
		END;
		/
	 */
	public void replyInsert(ReplyVO vo) {
		try {
			getConnection();
			String sql="{CALL replyInsert(?,?,?,?,?)}";
			cs=conn.prepareCall(sql);
			cs.setInt(1, vo.getCno());
			cs.setInt(2, vo.getType());
			cs.setString(3, vo.getId());
			cs.setString(4, vo.getName());
			cs.setString(5, vo.getMsg());
			cs.executeQuery();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnection();
		}
	}
	
	// 댓글 읽기
	/*
	 * 	CREATE OR REPLACE PROCEDURE replyListData(
		    pCno spring_reply2.cno%TYPE,
		    pType spring_reply2.type%TYPE,
		    pResult OUT SYS_REFCURSOR
		)
		IS
		BEGIN
		    OPEN pResult FOR
		      SELECT no, cno, type, id, name, msg, TO_CHAR(regdate, 'YYYY-MM-DD HH24:MI:SS')
		      FROM spring_reply2
		      WHERE cno=pCno AND type=pType
		      ORDER BY no DESC;
		END;
		/
	 */
	public List<ReplyVO> replyListData(ReplyVO vo) {
		List<ReplyVO> list=new ArrayList<ReplyVO>();
		try {
			getConnection();
			String sql="{CALL replyListData(?,?,?)}";
			cs=conn.prepareCall(sql);
			cs.setInt(1, vo.getCno());
			cs.setInt(2, vo.getType());
			cs.registerOutParameter(3, OracleTypes.CURSOR);
			cs.executeQuery();
			ResultSet rs=(ResultSet)cs.getObject(3);
			// NUMBER = int
			// VARCHAR2 CHAR CLOB = String
			// DATE = Date
			// CURSOR = ResultSet
			/*
			 * 	SELECT no, cno, type, id, name, msg, TO_CHAR(regdate, 'YYYY-MM-DD HH24:MI:SS')
      			FROM spring_reply2
			 */
			while(rs.next()) {
				ReplyVO rvo=new ReplyVO();
				rvo.setNo(rs.getInt(1));
				rvo.setCno(rs.getInt(2));
				rvo.setType(rs.getInt(3));
				rvo.setId(rs.getString(4));
				rvo.setName(rs.getString(5));
				rvo.setMsg(rs.getString(6));
				rvo.setDbday(rs.getString(7));
				
				list.add(rvo);
			}
			rs.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnection();
		}
		
		return list;
	}
	
	// 댓글 삭제
	/*
	 * 	CREATE OR REPLACE PROCEDURE replyDelete(
		    pNo spring_reply2.no%TYPE
		)
		IS
		BEGIN
		    DELETE FROM spring_reply2
		    WHERE no=pNo;
		    COMMIT;
		END;
		/
	 */
	public void replyDelete(int no) {
		try {
			getConnection();
			String sql="{CALL replyDelete(?)}";
			cs=conn.prepareCall(sql);
			cs.setInt(1, no);
			cs.executeQuery();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnection();
		}
	}
	
	// 댓글 수정
	/*
	 * 	CREATE OR REPLACE PROCEDURE replyUpdate(
		    pNo spring_reply2.no%TYPE,
		    pMsg spring_reply2.msg%TYPE
		)
		IS
		BEGIN
		    UPDATE spring_reply2 SET
		    msg=pMsg
		    WHERE no=pNo;
		    COMMIT;
		END;
		/
	 */
	public void replyUpdate(ReplyVO vo) {
		try {
			getConnection();
			String sql="{CALL replyUpdate(?,?)}";
			cs=conn.prepareCall(sql);
			cs.setInt(1, vo.getNo());
			cs.setString(2, vo.getMsg());
			cs.executeQuery();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnection();
		}
	}
	
}
