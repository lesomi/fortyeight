package com.fortyeight.spring.board.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fortyeight.spring.board.model.service.BoardService;
import com.fortyeight.spring.board.model.vo.Board;
import com.fortyeight.spring.board.model.vo.BoardComment;
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
		System.out.println(list);
		
		//mv.addObject("pageBar",PagingFactory.getPage(totalData, cPage, numPerPage, "/spring/board/boardList.do"));
		mv.addObject("pageBar",PagingFactory.getPage(totalData, cPage, numPerPage, "/20PM_FortyEight_final/board/boardList.do")); //서버용
		
		mv.setViewName("board/boardList");
		
		return mv;
	}
	
	@RequestMapping("/board/insertBoard.do")
	public String writeBoard() {
		return "board/insertBoard";
	}
	
	@RequestMapping("/board/insertBoardEnd.do")
	public String insertBoard(Board b,Model m) {
		b=new Board(0,b.getUserNo(),b.getBoardTitle(),b.getBoardContent(),null,b.getBoardType(),null,null);
		
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
	
	@RequestMapping("/board/boardView.do")
	public ModelAndView boardView(int boardNo, ModelAndView mv,
			@RequestParam(required=false, defaultValue="1") int cPage,
			@RequestParam(required=false, defaultValue="10") int numPerPage) {
		Board b=service.selectBoardView(boardNo);
		List<BoardComment> list=service.selectBoardComm(boardNo,cPage,numPerPage);
		
		int totalData=service.selectboardCommCount(boardNo);
		
		//mv.addObject("pageBar",PagingFactory.getPage(totalData, cPage, numPerPage, "/spring/board/boardView.do"));
		mv.addObject("pageBar",PagingFactory.getPage(totalData, cPage, numPerPage, "/20PM_FortyEight_final/board/boardView.do")); //서버용
		
		mv.addObject("b",b);
		mv.addObject("bc",list);
		mv.setViewName("board/boardView");
		
		return mv;
	}
	
	@RequestMapping("/board/deleteBoard.do")
	public String deleteBoard(int boardNo,Model m) {
		int result=service.deleteBoard(boardNo);
		
		if(result>0) {
			m.addAttribute("msg","게시글이 삭제되었습니다.");
			m.addAttribute("loc","/board/boardList.do");
		}else {
			m.addAttribute("msg","게시글 삭제 실패");
			m.addAttribute("loc","/board/boardView.do?boardNo="+boardNo);
		}
		
		return "common/msg";
	}
	
	@RequestMapping("/board/updateBoard.do")
	public ModelAndView updateBoard(int boardNo,ModelAndView mv) {
		Board b=service.selectBoardView(boardNo);
		
		mv.addObject("b",b);
		mv.setViewName("board/updateBoard");
		
		return mv;
	}
	
	@RequestMapping("/board/updateBoardEnd.do")
	public String updateBoardEnd(Board b,Model m) {
		System.out.println(b);
		
		int result=service.updateBoard(b);
		System.out.println(result);
	
		if(result>0) {
			m.addAttribute("msg","게시글이 수정되었습니다.");
			m.addAttribute("loc","/board/boardView.do?boardNo="+b.getBoardNo());
		}else {
			m.addAttribute("msg","게시글 수정 실패");
			m.addAttribute("loc","/board/updateBoard.do?boardNo="+b.getBoardNo());
		}
		
		return "common/msg";
	}
	
	@RequestMapping("/board/insertBoardComm.do")
	@ResponseBody
	public boolean insertBoardComm(BoardComment bc) {
		bc=new BoardComment(0,bc.getBoardRef(),bc.getUserNo(),0,bc.getCommContent(),0,null,null);
		
		int result=service.insertBoardComm(bc);
		
		Boolean flag=result>0?true:false;
		
		return flag;
	}
	
	@RequestMapping("/board/deleteBoardComm.do")
	@ResponseBody
	public boolean deleteBoardComm(int boardCommNo) {
		int result=service.deleteBoardComm(boardCommNo);
		
		Boolean flag=result>0?true:false;
		
		return flag;
	}
}
