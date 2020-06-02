package com.fortyeight.spring.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fortyeight.spring.board.model.vo.Board;
import com.fortyeight.spring.board.model.vo.BoardComment;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Override
	public List<Board> selectList(SqlSessionTemplate session, int cPage, int numPerPage) {
		return session.selectList("board.selectList",null, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int selectBoardCount(SqlSessionTemplate session) {
		return session.selectOne("board.selectBoardCount");
	}

	@Override
	public int insertBoard(SqlSessionTemplate session, Board b) {
		return session.insert("board.insertBoard",b);
	}

	@Override
	public Board selectBoardView(SqlSessionTemplate session, int boardNo) {
		return session.selectOne("board.selectBoardView",boardNo);
	}

	@Override
	public int deleteBoard(SqlSessionTemplate session, int boardNo) {
		return session.update("board.deleteBoard",boardNo);
	}

	@Override
	public int updateBoard(SqlSessionTemplate session, Board b) {
		return session.update("board.updateBoard",b);
	}

	@Override
	public int insertBoardComm(SqlSessionTemplate session, BoardComment bc) {
		return session.insert("board.insertBoardComm",bc);
	}

	@Override
	public List<BoardComment> selectBoardComm(SqlSessionTemplate session, int boardNo,int cPage,int numPerPage) {
		return session.selectList("board.selectBoardComm",boardNo, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int selectboardCommCount(SqlSessionTemplate session, int boardNo) {
		return session.selectOne("board.selectboardCommCount",boardNo);
	}

	@Override
	public int deleteBoardComm(SqlSessionTemplate session, int boardCommNo) {
		return session.delete("board.deleteBoardComm",boardCommNo);
	}

}
