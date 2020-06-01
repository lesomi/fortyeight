package com.fortyeight.spring.chatting.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fortyeight.spring.chatting.model.service.ChattingService;
import com.fortyeight.spring.chatting.model.vo.Chatting;

@Controller
public class ChattingController {
	
	@Autowired
	private ChattingService service;
	
	@RequestMapping("/chattingView.do")
	public String chattingView() {
		return "chatting/chattingView";
	}
	
	@RequestMapping("/chatting/chattingList.do")
	public ModelAndView chattingList(int userNo,ModelAndView mv) {
		List<Chatting> list=service.selectChatting(userNo);
		
		mv.addObject("chat",list);
		mv.setViewName("chatting/chattingList");
		
		return mv;
	}
	
}
