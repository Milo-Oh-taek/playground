package com.playground.mapper;

import java.util.List;

import com.playground.domain.MeetingCri;
import com.playground.domain.MeetingVO;
import com.playground.domain.MmemberVO;

public interface MeetingMapper {

	public List<MeetingVO> meetingList(MeetingCri meetingCri);
	
	public MeetingVO meetingGet(int mno);
	
	public void meetingNew(MeetingVO meetingVO);
	
	public int mnoSearch(String idValue);
	
	public int joinChk(MmemberVO mmemberVO);
	
	public void meetingJoin(MmemberVO mmemberVO);
	
	public void meetingQuit(MmemberVO mmemberVO);
	
	public int memCnt(int mno);
	
	public void meetingModify(MeetingVO meetingVO);
	
	public void meetingDelete(int mno);
}
