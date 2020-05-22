package com.fortyeight.spring.chatting.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

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
	private Map<Integer,WebSocketSession> clients=new HashMap<Integer, WebSocketSession>();
	
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
		
		switch(msg.getChatType()) {
			case "new":addClient(msg,session);break;
			case "msg":sendMessage(msg,session);break;
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.debug("사용자 접속 끊김");
		Set<Map.Entry<Integer, WebSocketSession>> entry=clients.entrySet();
		Iterator<Map.Entry<Integer, WebSocketSession>> it=entry.iterator();
		while(it.hasNext()) {
			Map.Entry<Integer, WebSocketSession> client=it.next();
			if(!client.getValue().isOpen()) { //client의 session이 열려있지않으면
				it.remove();
			}
		}
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
	
	//클라이언트 등록하기
	private void addClient(Chatting msg,WebSocketSession session) {
		clients.put(msg.getSender(), session);
		log.info("접속자 : "+clients);
		
		//사용자에게 접속 축하 메세지 발송
		Chatting serverMsg=new Chatting(0,"new",1,0,null,"채팅 접속 성공",0);
		sendMessage(serverMsg, session);
	}
	
	private void sendMessage(Chatting msg,WebSocketSession session) {
		Set<Map.Entry<Integer, WebSocketSession>> entry=clients.entrySet();
		for(Map.Entry<Integer, WebSocketSession> client : entry) {
			try {
				client.getValue().sendMessage(new TextMessage(mapper.writeValueAsString(msg)));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
}
