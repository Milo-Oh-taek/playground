package com.playground.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.playground.domain.MeetingCri;
import com.playground.domain.MeetingVO;
import com.playground.domain.MmemberVO;
import com.playground.domain.MpicVO;
import com.playground.mapper.MeetingMapper;
import com.playground.mapper.MpicMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MeetingServiceImpl implements MeetingService{
	
	static final String UPLOAD_PATH = "/img/";
	
	@Autowired
	MeetingMapper meetingMapper;
	
	@Autowired
	MpicMapper mpicMapper;
	
	MpicVO mpicVO = new MpicVO();

	@Override
	public List<MeetingVO> meetingList(MeetingCri meetingCri) {
		// TODO Auto-generated method stub
		return meetingMapper.meetingList(meetingCri);
	}

	@Override
	public MeetingVO meetingGet(int mno) {
		// TODO Auto-generated method stub
		return meetingMapper.meetingGet(mno);
	}

	@Override
	public int meetingNew(MeetingVO meetingVO) {
		// TODO Auto-generated method stub
		
		meetingMapper.meetingNew(meetingVO);
		
		return 1;
		
	}
	@Override
	public int meetingModify(MeetingVO meetingVO) {
		// TODO Auto-generated method stub
		
		meetingMapper.meetingModify(meetingVO);
		
		return 1;
		
	}
	

	@Override
	public int saveFile(MultipartFile mpic, MpicVO mpicVO) {
		// TODO Auto-generated method stub
		
		String fakeName = mpicVO.getFakename();
		
		File saveFile = new File(UPLOAD_PATH, fakeName);
		
		if(!saveFile.exists()){
			saveFile.mkdirs();
	    }
		
		try {
			mpic.transferTo(saveFile);
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		mpicMapper.mpicNew(mpicVO);
		
		return 1;
	}
	@Override
	public int updateFile(MultipartFile mpic, MpicVO mpicVO) {
		// TODO Auto-generated method stub
		
		String fakeName = mpicVO.getFakename();
		
		File saveFile = new File(UPLOAD_PATH, fakeName);
		
		if(!saveFile.exists()){
			saveFile.mkdirs();
	    }
		
		try {
			mpic.transferTo(saveFile);
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		mpicMapper.mpicUpdate(mpicVO);
		
		return 1;
	}

	@Override
	public int mnoSearch(String idValue) {
		// TODO Auto-generated method stub
		int mno = meetingMapper.mnoSearch(idValue);
		
		return mno;
	}

	@Override
	public int joinChk(MmemberVO mmemberVO) {
		// TODO Auto-generated method stub
		return meetingMapper.joinChk(mmemberVO);
	}

	@Override
	public void meetingJoin(MmemberVO mmemberVO) {
		// TODO Auto-generated method stub
		meetingMapper.meetingJoin(mmemberVO);
	}

	@Override
	public void meetingQuit(MmemberVO mmemberVO) {
		// TODO Auto-generated method stub
		meetingMapper.meetingQuit(mmemberVO);
	}

	@Override
	public int memCnt(int mno) {
		// TODO Auto-generated method stub
		return meetingMapper.memCnt(mno);
	}

	@Override
	public void meetingDelete(int mno) {
		// TODO Auto-generated method stub
		meetingMapper.meetingDelete(mno);
	}

}
