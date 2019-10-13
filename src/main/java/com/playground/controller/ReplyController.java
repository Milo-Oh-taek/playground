package com.playground.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.playground.domain.ReplyVO;
import com.playground.service.ReplyService;

@RestController
@RequestMapping("/reply/*")
public class ReplyController {
	
	@Autowired
	ReplyService replyService;
	
	@PostMapping("/new")
	public void replyNew(ReplyVO replyVO) {
		
		replyVO.setReplyer(CommonController.currentUserName());
		
		replyService.replyNew(replyVO);
	}
	
	
	@GetMapping("/list")
	public List<ReplyVO> listJson(@RequestParam int bno){
		
		List<ReplyVO> list = replyService.replyList(bno);
		
		return list;
	}
	
	@DeleteMapping("/delete/{rno}")
	public void replyDelete(@PathVariable("rno") int rno) {
		
		
		
		replyService.replyDelete(rno);
	}

}
