package com.fortyeight.spring.chatting.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.fortyeight.spring.chatting.model.vo.Chatting;

public interface ChattingDao {
	int insertChatting(SqlSessionTemplate session,Chatting msg);
	List<Chatting> selectChatting(SqlSessionTemplate session,int userNo);
}
