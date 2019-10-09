package com.playground.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playground.domain.BoardVO;
import com.playground.domain.Criteria;
import com.playground.domain.LikeVO;
import com.playground.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper boardMapper;

	@Override
	public List<BoardVO> boardList(Criteria cri) {
		// TODO Auto-generated method stub
			
		return boardMapper.boardList(cri);
	}

	@Override
	public void boardNew(BoardVO boardVO) {
		// TODO Auto-generated method stub
		
		boardMapper.boardNew(boardVO);
	}

	@Override
	public BoardVO boardGet(int bno) {
		// TODO Auto-generated method stub
		return boardMapper.boardGet(bno);
	}

	@Override
	public void boardModify(BoardVO boardVO) {
		// TODO Auto-generated method stub
		boardMapper.boardModify(boardVO);
	}

	@Override
	public void boardDelete(int bno) {
		// TODO Auto-generated method stub
		
		boardMapper.boardDelete(bno);
		
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return boardMapper.getTotal(cri);
	}

	@Override
	public void updateViewCnt(int bno) {
		// TODO Auto-generated method stub
		
		boardMapper.updateViewCnt(bno);
	}

	@Override
	public void like(LikeVO likeVO) {
		// TODO Auto-generated method stub
		boardMapper.like(likeVO);
	}
	@Override
	public void unlike(LikeVO likeVO) {
		// TODO Auto-generated method stub
		boardMapper.unlike(likeVO);
	}

	@Override
	public int getLike(int bno) {
		// TODO Auto-generated method stub
		return boardMapper.getLike(bno);
	}

	@Override
	public int likeChk(LikeVO likeVO) {
		// TODO Auto-generated method stub
		return boardMapper.likeChk(likeVO);
	}

	@Override
	public List<BoardVO> bestList() {
		// TODO Auto-generated method stub
		return boardMapper.bestList();
	}

}
