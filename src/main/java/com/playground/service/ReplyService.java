package com.playground.service;

import java.util.List;

import com.playground.domain.ReplyVO;

public interface ReplyService {

	public void replyNew(ReplyVO replyVO);
	
	public List<ReplyVO> replyList(int bno);
	
	public void replyDelete(int rno);
}
