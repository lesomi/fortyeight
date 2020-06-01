package com.fortyeight.spring.chatting.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fortyeight.spring.chatting.model.dao.ChattingDao;
import com.fortyeight.spring.chatting.model.vo.Chatting;

@Service
public class ChattingServiceImpl implements ChattingService {
	
	@Autowired
	private ChattingDao dao;
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertChatting(Chatting msg) {
		return dao.insertChatting(session,msg);
	}
}
