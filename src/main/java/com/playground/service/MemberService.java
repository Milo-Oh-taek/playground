package com.playground.service;

import com.playground.domain.MemberVO;

public interface MemberService {

	public int checkId(String userid);
	
	public void memberNew(MemberVO memberVO);
	
	public void authNew(String userid);
}
