package com.fortyeight.spring.chatting.model.service;

import java.util.List;

import com.fortyeight.spring.chatting.model.vo.Chatting;

public interface ChattingService {
	int insertChatting(Chatting msg);
	List<Chatting> selectChatting(int userNo);
}
