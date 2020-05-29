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
import com.fortyeight.spring.chatting.model.vo.Alram;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AlramServer extends TextWebSocketHandler {
	
	@Autowired
	ObjectMapper mapper;
	
	private Map<Integer,WebSocketSession> clients=new HashMap<Integer, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.debug("사용자접속 -alram");
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.debug(message.getPayload());
		Alram msg=getMessage(message.getPayload());
		
		switch(msg.getType()) {
			case "new":addClient(msg,session);break;
			case "msg":sendMessage(msg);break;
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.debug("사용자 접속 끊김 -alram");
		Set<Map.Entry<Integer, WebSocketSession>> entry=clients.entrySet();
		Iterator<Map.Entry<Integer, WebSocketSession>> it=entry.iterator();
		while(it.hasNext()) {
			Map.Entry<Integer, WebSocketSession> client=it.next();
			if(!client.getValue().isOpen()) { //client의 session이 열려있지않으면
				it.remove();
			}
		}
	}
	
	private Alram getMessage(String msg) {
		Alram message=null;
		
		try {
			message=mapper.readValue(msg, Alram.class);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return message;
	}
	
	public void addClient(Alram msg,WebSocketSession session) {
		clients.put(msg.getSender(), session);
		log.info("접속자 : "+clients);
	}
	
	public void sendMessage(Alram msg) {
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
