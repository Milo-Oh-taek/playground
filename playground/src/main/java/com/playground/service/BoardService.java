package com.playground.service;

import java.util.List;

import com.playground.domain.BoardVO;
import com.playground.domain.Criteria;
import com.playground.domain.LikeVO;


public interface BoardService {

	public List<BoardVO> boardList(Criteria cri);
	
	public void boardNew(BoardVO boardVO);
	
	public BoardVO boardGet(int bno);
	
	public void boardModify(BoardVO boardVO);
	
	public void boardDelete(int bno);
	
	public int getTotal(Criteria cri);
	
	public void updateViewCnt(int bno);
	
	public void like(LikeVO likeVO);
	
	public void unlike(LikeVO likeVO);
	
	public int getLike(int bno);
	
	public int likeChk(LikeVO likeVO);
	
	public List<BoardVO> bestList();
}
