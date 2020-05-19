package com.fortyeight.spring.chatting.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fortyeight.spring.chatting.vo.Chatting;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ChattingServer extends TextWebSocketHandler {
	
	//세션관리용 객체 생성
	private Map<String,WebSocketSession> clients=new HashMap<String, WebSocketSession>();
	
	@Autowired
	ObjectMapper mapper;

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.debug("사용자 접속");
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.debug(message.getPayload());
		Chatting msg=getMessage(message.getPayload());
		
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionClosed(session, status);
	}
	
	private Chatting getMessage(String chatting) {
		Chatting message=null;
		
		try {
			message=mapper.readValue(chatting, Chatting.class);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return message;
	}
	
}
