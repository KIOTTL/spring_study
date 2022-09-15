package com.sist.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sist.mapper.*;

@Repository
public class ReplyDAO {
	@Autowired
	private ReplyMapper mapper;
	
	public List<ReplyVO> replyListData(ReplyVO vo) {
		return mapper.replyListData(vo);
	}
	
	public void replyInsert(ReplyVO vo) {
		mapper.replyInsert(vo);
	}
	
	public void replyUpdate(ReplyVO vo) {
		mapper.replyUpdate(vo);
	}
	
	// 대댓글
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void replyReplyInsert(int pno, ReplyVO vo) {
		ReplyVO pvo=mapper.replyParentInfoData(pno);
		mapper.replyGroupStepIncrement(pvo);
		vo.setGroup_id(pvo.getGroup_id());
		vo.setGroup_step(pvo.getGroup_step()+1);
		vo.setGroup_tab(pvo.getGroup_tab()+1);
		vo.setRoot(pno);
		mapper.replyReplyInsert(vo);
		mapper.replyDepthIncrement(pno);
	}
	
	@Transactional
	public void replyDelete(int no) {
		ReplyVO vo=mapper.replyInfoData(no);
		if(vo.getDepth()==0) {
			mapper.replyDelete(no);
		} else {
			mapper.replyMsgUpdate(no);
		}
		mapper.replyDepthDecrement(vo.getRoot());
	}
}
