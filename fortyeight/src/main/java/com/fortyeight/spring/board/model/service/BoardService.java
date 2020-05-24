package com.fortyeight.spring.board.model.service;

import java.util.List;

import com.fortyeight.spring.board.model.vo.Board;

public interface BoardService {
	List<Board> selectList(int cPage,int numPerPage);
	int selectBoardCount();
	int insertBoard(Board b);
}
