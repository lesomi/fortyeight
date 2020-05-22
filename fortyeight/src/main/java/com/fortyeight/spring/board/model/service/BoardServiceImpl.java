package com.fortyeight.spring.board.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fortyeight.spring.board.model.dao.BoardDao;
import com.fortyeight.spring.user.model.service.UserServiceImpl;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao dao;
	@Autowired
	private SqlSessionTemplate session;
	@Autowired
	private Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
}
