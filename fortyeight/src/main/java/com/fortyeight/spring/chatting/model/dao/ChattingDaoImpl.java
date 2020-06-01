package com.fortyeight.spring.chatting.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fortyeight.spring.chatting.model.vo.Chatting;

@Repository
public class ChattingDaoImpl implements ChattingDao {

	@Override
	public int insertChatting(SqlSessionTemplate session, Chatting msg) {
		return session.insert("chatting.insertChatting",msg);
	}

}
