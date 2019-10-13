package com.playground.mapper;

import com.playground.domain.MemberVO;

public interface MemberMapper {

	public int checkId(String userid);
	
	public void memberNew(MemberVO memberVO);
	
	public void authNew(String userid);
}
