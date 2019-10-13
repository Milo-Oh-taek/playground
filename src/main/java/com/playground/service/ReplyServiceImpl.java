package com.playground.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playground.domain.ReplyVO;
import com.playground.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	ReplyMapper replyMapper;

	@Override
	public void replyNew(ReplyVO replyVO) {
		// TODO Auto-generated method stub
		
		replyMapper.replyNew(replyVO);
	}

	@Override
	public List<ReplyVO> replyList(int bno) {
		// TODO Auto-generated method stub
		return replyMapper.replyList(bno);
	}

	@Override
	public void replyDelete(int rno) {
		// TODO Auto-generated method stub
		replyMapper.replyDelete(rno);
	}

}
