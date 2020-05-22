package com.fortyeight.spring.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.fortyeight.spring.user.controller.UserController;

@Controller
public class boardController {
	
	@Autowired
	private BoardService service;
	@Autowired
	private Logger logger = LoggerFactory.getLogger(UserController.class);
}
