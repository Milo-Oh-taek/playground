package com.playground.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.playground.domain.MeetingCri;
import com.playground.domain.MeetingVO;
import com.playground.domain.MmemberVO;
import com.playground.domain.MpicVO;


public interface MeetingService {

	public List<MeetingVO> meetingList(MeetingCri meetingCri);
	
	public MeetingVO meetingGet(int mno);
	
	public int meetingNew(MeetingVO meetingVO);
	
	public int saveFile(MultipartFile mpic, MpicVO mpicVO);
	
	public int updateFile(MultipartFile mpic, MpicVO mpicVO);
	
	public int mnoSearch(String idValue);
	
	public int joinChk(MmemberVO mmemberVO);
	
	public void meetingJoin(MmemberVO mmemberVO);
	
	public void meetingQuit(MmemberVO mmemberVO);
	
	public int memCnt(int mno);
	
	public int meetingModify(MeetingVO meetingVO);
	
	public void meetingDelete(int mno);
}
