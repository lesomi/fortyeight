package com.fortyeight.spring.board.model.service;

import java.util.List;

import com.fortyeight.spring.board.model.vo.Board;
import com.fortyeight.spring.board.model.vo.BoardComment;

public interface BoardService {
	List<Board> selectList(int cPage,int numPerPage);
	int selectBoardCount();
	int insertBoard(Board b);
	Board selectBoardView(int boardNo);
	int deleteBoard(int boardNo);
	int updateBoard(Board b);
	int insertBoardComm(BoardComment bc);
	List<BoardComment> selectBoardComm(int boardNo,int cPage,int numPerPage);
	int selectboardCommCount(int boardNo);
	int deleteBoardComm(int boardCommNo);
}
