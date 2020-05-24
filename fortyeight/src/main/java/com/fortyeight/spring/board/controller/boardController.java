package com.fortyeight.spring.board.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fortyeight.spring.board.model.service.BoardService;
import com.fortyeight.spring.board.model.vo.Board;
import com.fortyeight.spring.common.PagingFactory;
import com.fortyeight.spring.user.controller.UserController;
import com.fortyeight.spring.user.model.vo.User;

@Controller
public class boardController {
	
	@Autowired
	private BoardService service;
	@Autowired
	private Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping("/board/boardList.do")
	public ModelAndView selectBoardList(ModelAndView mv,
			@RequestParam(required=false, defaultValue="1") int cPage,
			@RequestParam(required=false, defaultValue="10") int numPerPage) {
		List<Board> list=service.selectList(cPage,numPerPage);
		
		int totalData = service.selectBoardCount();
		
		mv.addObject("board",list);
		
		mv.addObject("pageBar",PagingFactory.getPage(totalData, cPage, numPerPage, "/spring/board/boardList.do"));
		
		mv.setViewName("board/boardList");
		
		return mv;
	}
	
	@RequestMapping("/board/insertBoard.do")
	public String writeBoard() {
		return "board/insertBoard";
	}
	
	@RequestMapping("/board/insertBoardEnd.do")
	public String insertBoard(Board b,Model m) {
		b=new Board(0,b.getUserNo(),b.getBoardTitle(),b.getBoardContent(),null,b.getBoardType(),null);
		
		int result=service.insertBoard(b);
		
		if(result>0 && b.getBoardType().equals("자유")) {
			m.addAttribute("msg","자유글이 등록되었습니다.");
			m.addAttribute("loc","/board/boardList.do");
		}else if(result>0 && b.getBoardType().equals("질문")) {
			m.addAttribute("msg","질문글이 등록되었습니다.");
			m.addAttribute("loc","/board/boardList.do");
		}else {
			m.addAttribute("msg","글 등록 실패");
			m.addAttribute("loc","/board/insertBoard.do");
		}
		
		return "common/msg";
	}
}
