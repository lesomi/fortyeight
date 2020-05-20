package com.fortyeight.spring.chatting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChattingController {
	@RequestMapping("/chattingView.do")
	public String chattingView() {
		return "chatting/chattingView";
	}
}
