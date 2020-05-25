package com.fortyeight.spring.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fortyeight.spring.board.model.vo.Board;

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

}
