package com.playground.controller;

import java.io.PrintWriter;
import java.util.List;

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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.playground.domain.BoardVO;
import com.playground.domain.Criteria;
import com.playground.domain.LikeVO;
import com.playground.domain.PageMaker;
import com.playground.service.BoardService;


@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
		
	@GetMapping("/list")
	public void boardList(Criteria cri, Model model) {
		
		model.addAttribute("boardList", boardService.boardList(cri));
		
		int total = boardService.getTotal(cri);
		
		model.addAttribute("pageMaker", new PageMaker(cri, total));
		
	}
	
	@GetMapping("/new")
	public void boardNew() {
		
		
		
	}
	
	@PostMapping("/new")
	public ModelAndView boardNew(BoardVO boardVO) {
		
		String username = CommonController.currentUserName();
		
		boardVO.setWriter(username);
		
		boardService.boardNew(boardVO);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("msg", "글이 등록되었습니다");
		modelAndView.setViewName("redirect:/board/list");
		
		return modelAndView;
	}
	
	@GetMapping("/get")
	public void boardGet(@RequestParam("bno") int bno, Model model) {
		
		boardService.updateViewCnt(bno);
		
		String username = CommonController.currentUserName();
		
		model.addAttribute("username", username);
		
		model.addAttribute("boardGet", boardService.boardGet(bno));
		
		
	}
	
	@GetMapping("/modify")
	public void boardModify(HttpServletRequest request, HttpServletResponse response, Model model)throws Exception {
		int bno = Integer.parseInt(request.getParameter("bno"));
		String username = CommonController.currentUserName();
		
		BoardVO bv = boardService.boardGet(bno);
		String writer = bv.getWriter();
		
		if(writer != username) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('잘못된 접근입니다.'); location.href='/board/list';</script>");
		}
		model.addAttribute("boardGet", bv);
	}
	
	@PostMapping("/modify")
	public String boardModify(BoardVO boardVO, RedirectAttributes rttr) {
		
		boardService.boardModify(boardVO);
		
		return "redirect:/board/list";
	}
	
	@PostMapping("/delete")
	public String boardDelete(int bno) {
		
		boardService.boardDelete(bno);
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/like")
	@ResponseBody
	public void like(@RequestParam("bno")int bno) {
		
		String userid = CommonController.currentUserName();
		LikeVO likeVO = new LikeVO();
		
		likeVO.setBno(bno);
		likeVO.setUserid(userid);
		
		boardService.like(likeVO);
	}
	@GetMapping("/unlike")
	@ResponseBody
	public void unlike(@RequestParam("bno")int bno) {
		
		String userid = CommonController.currentUserName();
		LikeVO likeVO = new LikeVO();
		
		likeVO.setBno(bno);
		likeVO.setUserid(userid);
		
		boardService.unlike(likeVO);
	}
	@GetMapping("/getLike")
	@ResponseBody
	public int getLike(@RequestParam("bno")int bno) {
				
		return boardService.getLike(bno);
	}
	
	@GetMapping("/likeChk")
	@ResponseBody
	public int likeChk(@RequestParam("bno")int bno) {
		String userid = CommonController.currentUserName();
		LikeVO likeVO = new LikeVO();
		
		likeVO.setBno(bno);
		likeVO.setUserid(userid);
	
		return boardService.likeChk(likeVO);
	}
	
	@GetMapping("/bestList")
	@ResponseBody
	public List<BoardVO> bestList(){
		
		return boardService.bestList();
	}
	
	
	
	
	

}
