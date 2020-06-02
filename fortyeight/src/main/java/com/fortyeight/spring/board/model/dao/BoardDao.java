package com.fortyeight.spring.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.fortyeight.spring.board.model.vo.Board;
import com.fortyeight.spring.board.model.vo.BoardComment;

public interface BoardDao {
	List<Board> selectList(SqlSessionTemplate session,int cPage,int numPerPage);
	int selectBoardCount(SqlSessionTemplate session);
	int insertBoard(SqlSessionTemplate session,Board b);
	Board selectBoardView(SqlSessionTemplate session, int boardNo);
	int deleteBoard(SqlSessionTemplate session,int boardNo);
	int updateBoard(SqlSessionTemplate session,Board b);
	int insertBoardComm(SqlSessionTemplate session,BoardComment bc);
	List<BoardComment> selectBoardComm(SqlSessionTemplate session,int boardNo,int cPage,int numPerPage);
	int selectboardCommCount(SqlSessionTemplate session,int boardNo);
	int deleteBoardComm(SqlSessionTemplate session, int boardCommNo);
}
