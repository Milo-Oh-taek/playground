package com.playground.mapper;

import java.util.List;

import com.playground.domain.ReplyVO;

public interface ReplyMapper {

	public List<ReplyVO> replyList(int bno);
	
	public void replyNew(ReplyVO replyVO);
	
	public void replyDelete(int rno);
}
