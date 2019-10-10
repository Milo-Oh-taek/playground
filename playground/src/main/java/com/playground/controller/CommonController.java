package com.playground.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.playground.domain.MeetingVO;
import com.playground.service.CommonService;

import lombok.extern.log4j.Log4j;

@RequestMapping("/*")
@Controller
@Log4j
public class CommonController {
	
	@Autowired
	private CommonService commonService;

	@GetMapping("/")
	public String main(Model model) {
	
		log.info("welcome");
		
		List<MeetingVO> newMeetingList = commonService.newMeetingList();
		
		model.addAttribute("newMeetingList", newMeetingList);
		
		List<MeetingVO> hotMeetingList = commonService.hotMeetingList();
		
		model.addAttribute("hotMeetingList", hotMeetingList);
		
		return "home";
	}
	
	@GetMapping("/loginPage")
	@PostMapping("/loginPage")
	public void login() {
		log.info("login page");
	}
	
	@PostMapping("/customLogout")
	public void logout() {
		
		log.info("logout");
	}
	
	@GetMapping("/accessError")
	public void accessError() {
		
	}
	
	@GetMapping("/myList1")
	@ResponseBody
	public List<MeetingVO> myList1(){
		
		String userid = currentUserName();
		
		return commonService.myList1(userid);
	}
	@GetMapping("/myList2")
	@ResponseBody
	public List<MeetingVO> myList2(){
		
		String userid = currentUserName();
		
		return commonService.myList2(userid);
	}
	
	
	
	public static String currentUserName() {
			
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			
			User user = (User) authentication.getPrincipal();
			
			return user.getUsername();
		}
	
	
	
	
}
