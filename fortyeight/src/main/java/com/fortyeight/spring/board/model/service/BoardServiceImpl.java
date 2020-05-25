package com.fortyeight.spring.board.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fortyeight.spring.board.model.dao.BoardDao;
import com.fortyeight.spring.board.model.vo.Board;
import com.fortyeight.spring.user.model.service.UserServiceImpl;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao dao;
	@Autowired
	private SqlSessionTemplate session;
	@Autowired
	private Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Override
	public List<Board> selectList(int cPage, int numPerPage) {
		return dao.selectList(session,cPage,numPerPage);
	}

	@Override
	public int selectBoardCount() {
		return dao.selectBoardCount(session);
	}

	@Override
	public int insertBoard(Board b) {
		return dao.insertBoard(session,b);
	}

	@Override
	public Board selectBoardView(int boardNo) {
		return dao.selectBoardView(session,boardNo);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return dao.deleteBoard(session,boardNo);
	}
}
