package com.playground.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playground.domain.MeetingVO;
import com.playground.mapper.CommonMapper;

@Service
public class CommonServiceImpl implements CommonService{
	
	@Autowired
	private CommonMapper commonMapper;

	@Override
	public List<MeetingVO> newMeetingList() {
		// TODO Auto-generated method stub
		return commonMapper.newMeetingList();
	}

	@Override
	public List<MeetingVO> myList1(String userid) {
		// TODO Auto-generated method stub
		return commonMapper.myList1(userid);
	}

	@Override
	public List<MeetingVO> myList2(String userid) {
		// TODO Auto-generated method stub
		return commonMapper.myList2(userid);
	}

	@Override
	public List<MeetingVO> hotMeetingList() {
		// TODO Auto-generated method stub
		return commonMapper.hotMeetingList();
	}

}
