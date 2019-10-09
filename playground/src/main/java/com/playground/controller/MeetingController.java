package com.playground.controller;


import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.playground.domain.MeetingCri;
import com.playground.domain.MeetingVO;
import com.playground.domain.MmemberVO;
import com.playground.domain.MpicVO;
import com.playground.service.MeetingService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/meeting/*")
public class MeetingController {
	
	@Autowired
	MeetingService meetingService;
	
	private static final String UPLOAD_PATH = "C:\\Temp";

	@GetMapping("/list")
	public void meetingList(Model model, MeetingCri meetingCri) {

		if(meetingCri.getCategory()==null||meetingCri.getCategory()=="") {meetingCri.setCategory("zz");}
		if(meetingCri.getDistrict()==null||meetingCri.getDistrict()=="") {meetingCri.setDistrict("zz");}
		if(meetingCri.getSearch()==null||meetingCri.getSearch()==""){meetingCri.setSearch("zz");}
		
		log.info("district :" + meetingCri.getDistrict());
		log.info("category :" + meetingCri.getCategory());
		log.info("search :" + meetingCri.getSearch());
		
		String username = CommonController.currentUserName();
		
		model.addAttribute("username", username);
		
		model.addAttribute("list", meetingService.meetingList(meetingCri));
		
		model.addAttribute("cri", meetingCri);
	}
	
	@GetMapping("/get")
	public void meetingGet(@RequestParam("mno") int mno, Model model) {
		
		String username = CommonController.currentUserName();
		
		model.addAttribute("username", username);
		
		model.addAttribute("meeting", meetingService.meetingGet(mno));
	}
	
	@GetMapping("/new")
	public void meetingNew() {
		
	}
	
	@GetMapping("/joinChk")
	@ResponseBody
	public int checkJoin(@RequestParam("mno")int mno) {
		
		String userid = CommonController.currentUserName();
		
		MmemberVO mmemberVO = new MmemberVO();
		
		mmemberVO.setMno(mno);
		mmemberVO.setUserid(userid);
		
		return meetingService.joinChk(mmemberVO);
	}
	
	@PostMapping("/join")
	public void meetingJoin(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		
		String userid = CommonController.currentUserName();
		
		int mno = Integer.parseInt(request.getParameter("mno"));
		
		MmemberVO mmemberVO = new MmemberVO();
		mmemberVO.setMno(mno);
		mmemberVO.setUserid(userid);
		
		meetingService.meetingJoin(mmemberVO);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		out.println("<script>alert('그룹 가입 완료! 좌측 나의 meeting 목록을 확인하세요'); location.href='/meeting/get?mno="+mno+"';</script>");
				
		out.flush();
	}
	
	@PostMapping("/quit")
	public void meetingQuit(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		
		String userid = CommonController.currentUserName();
		
		int mno = Integer.parseInt(request.getParameter("mno"));
		
		MmemberVO mmemberVO = new MmemberVO();
		mmemberVO.setMno(mno);
		mmemberVO.setUserid(userid);
		
		meetingService.meetingQuit(mmemberVO);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		out.println("<script>alert('해당 그룹에서 탈퇴하였습니다.'); location.href='/meeting/get?mno="+mno+"';</script>");
				
		out.flush();
	}
	
	@GetMapping("/memCnt")
	@ResponseBody
	public int memberCnt(int mno) {
		
		return meetingService.memCnt(mno);
	}
	
	@PostMapping("/new")
	public String meetingNewPost(MeetingVO meetingVO, MultipartFile mpic){
		
		String userid = CommonController.currentUserName();
		
		UUID uuid = UUID.randomUUID();
		
		String idValue = uuid +"";
		
		meetingVO.setIdValue(idValue);
		meetingVO.setOriginalFile(mpic.getOriginalFilename());
		meetingVO.setUserid(userid);
		
		log.info("------------------------------------");
		log.info("파일이름 : " + mpic.getOriginalFilename());
		log.info("파일크기 : " + mpic.getSize());
		
		int result = meetingService.meetingNew(meetingVO);
		
		log.info("Created New Meeting ");
		
		if(result==1) {
			
			int mno = meetingService.mnoSearch(idValue);
			MpicVO mpicVO = new MpicVO();
			
			mpicVO.setMno(mno);
			mpicVO.setSize((int) mpic.getSize());
			mpicVO.setOriname(mpic.getOriginalFilename());
			
			String fakeName = idValue + "_" + mpic.getOriginalFilename();
		
			mpicVO.setFakename(fakeName);
			
			log.info("---------------");
			log.info("Ready to save file");
			log.info("mno : "+ mpicVO.getMno()+" / savename : " +mpicVO.getFakename());
			
			saveFile(mpic, mpicVO);
			
			log.info("---------------");
			log.info("file saved");
		}
		
		return "redirect:/meeting/list";
	
	}
	
	@PostMapping("/modify")
	public String modify(MeetingVO meetingVO, MultipartFile mpic) {
		String userid = CommonController.currentUserName();
		
		if (userid != meetingVO.getUserid()) {
			return "redirect:/meeting/list";
		}
		
		int mno = meetingVO.getMno();
		UUID uuid = UUID.randomUUID();
		
		String idValue = uuid +"";
		
		meetingVO.setIdValue(idValue);
		meetingVO.setOriginalFile(mpic.getOriginalFilename());
		meetingVO.setUserid(userid);
		
		log.info("------------------------------------");
		log.info("파일이름 : " + mpic.getOriginalFilename());
		log.info("파일크기 : " + mpic.getSize());
		
		int result = meetingService.meetingModify(meetingVO);
		
		log.info("Created New Meeting ");
		
		if(result==1) {
			
			MpicVO mpicVO = new MpicVO();
			
			mpicVO.setMno(mno);
			mpicVO.setSize((int) mpic.getSize());
			mpicVO.setOriname(mpic.getOriginalFilename());
			
			String fakeName = idValue + "_" + mpic.getOriginalFilename();
		
			mpicVO.setFakename(fakeName);
			
			log.info("---------------");
			log.info("Ready to save file");
			log.info("mno : "+ mpicVO.getMno()+" / savename : " +mpicVO.getFakename());
			
			updateFile(mpic, mpicVO);
			
			log.info("---------------");
			log.info("file saved");
		}
		
		return "redirect:/meeting/list";
	}
	
	@GetMapping("/modify")
	public void meetingModify(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		int mno = Integer.parseInt(request.getParameter("mno"));
		
		String username = CommonController.currentUserName();
		
		MeetingVO mv = meetingService.meetingGet(mno);
		String userid = mv.getUserid();
		
		if(userid != username) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('잘못된 접근입니다.'); location.href='/meeting/list';</script>");
			}
		
		model.addAttribute("info", mv);
		
	}
	
	@GetMapping("/delete")
	public void meetingDelete(HttpServletRequest request, HttpServletResponse response, Model model)throws Exception {
		int mno = Integer.parseInt(request.getParameter("mno"));
		String username = CommonController.currentUserName();
		
		MeetingVO mv = meetingService.meetingGet(mno);
		String userid = mv.getUserid();
		
		if(userid == username) {
			meetingService.meetingDelete(mno);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('삭제되었습니다.');location.href='/meeting/list';</script>");
			
			}else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('잘못된 접근입니다.');location.href='/meeting/list';</script>");
				
			}
	}

	private void saveFile(MultipartFile mpic, MpicVO mpicVO) {
		// TODO Auto-generated method stub
		meetingService.saveFile(mpic, mpicVO);
		
	}
	private void updateFile(MultipartFile mpic, MpicVO mpicVO) {
		// TODO Auto-generated method stub
		meetingService.updateFile(mpic, mpicVO);
		
	}

}
