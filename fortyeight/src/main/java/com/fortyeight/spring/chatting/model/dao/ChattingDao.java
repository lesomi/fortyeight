package com.fortyeight.spring.chatting.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.fortyeight.spring.chatting.model.vo.Chatting;

public interface ChattingDao {
	int insertChatting(SqlSessionTemplate session,Chatting msg);
}
