package com.playground.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.playground.domain.MemberVO;
import com.playground.service.MemberService;

import lombok.extern.log4j.Log4j;


@RequestMapping("/member/*")
@Log4j
@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@GetMapping("/signup")
	public void signup() {
		
	}
	
	@PostMapping("/signup")
	public String memberNew(MemberVO memberVO) {
		
		memberVO.setUserpw(this.bcryptPasswordEncoder.encode(memberVO.getUserpw()));
		
		memberService.memberNew(memberVO);
		
		memberService.authNew(memberVO.getUserid());
		
		return "redirect:/";
	}
	
	
	@ResponseBody
	@GetMapping("/checkId")
	public int checkId(@RequestParam("userid") String userid) {
		
		log.info(userid);
		
		return memberService.checkId(userid);
	}

}
