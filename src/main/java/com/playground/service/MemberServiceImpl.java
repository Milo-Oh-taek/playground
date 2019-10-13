package com.playground.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playground.domain.MemberVO;
import com.playground.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberMapper memberMapper;

	@Override
	public int checkId(String userid) {
		// TODO Auto-generated method stub
		return memberMapper.checkId(userid);
	}

	@Override
	public void memberNew(MemberVO memberVO) {
		// TODO Auto-generated method stub
		
		memberMapper.memberNew(memberVO);
	}

	@Override
	public void authNew(String userid) {
		// TODO Auto-generated method stub
		
		memberMapper.authNew(userid);
	}

}
