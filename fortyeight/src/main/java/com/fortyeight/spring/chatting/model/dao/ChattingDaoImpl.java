package com.fortyeight.spring.chatting.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fortyeight.spring.chatting.model.vo.Chatting;

@Repository
public class ChattingDaoImpl implements ChattingDao {

	@Override
	public int insertChatting(SqlSessionTemplate session, Chatting msg) {
		return session.insert("chatting.insertChatting",msg);
	}

	@Override
	public List<Chatting> selectChatting(SqlSessionTemplate session, int userNo) {
		return session.selectList("chatting.selectChatting",userNo);
	}

}
