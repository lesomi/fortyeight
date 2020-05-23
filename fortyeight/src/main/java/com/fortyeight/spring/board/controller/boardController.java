package com.fortyeight.spring.board.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fortyeight.spring.board.model.service.BoardService;
import com.fortyeight.spring.board.model.vo.Board;
import com.fortyeight.spring.common.PagingFactory;
import com.fortyeight.spring.user.controller.UserController;

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
}
