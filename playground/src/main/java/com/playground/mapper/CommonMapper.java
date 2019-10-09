package com.playground.mapper;

import java.util.List;

import com.playground.domain.MeetingVO;

public interface CommonMapper {

	public List<MeetingVO> newMeetingList();
	
	public List<MeetingVO> myList1(String userid);
	
	public List<MeetingVO> myList2(String userid);
	
	public List<MeetingVO> hotMeetingList();
}
