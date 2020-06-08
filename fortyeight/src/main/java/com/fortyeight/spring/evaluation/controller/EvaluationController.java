package com.fortyeight.spring.evaluation.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fortyeight.spring.evaluation.model.service.EvaluationService;
import com.fortyeight.spring.market.model.vo.Market;
import com.fortyeight.spring.user.controller.UserController;

@Controller
public class EvaluationController {
	// 사용자 평가정보 관련 컨트롤러
	
	@Autowired
	private EvaluationService service;
	@Autowired
	private Logger logger = LoggerFactory.getLogger(UserController.class);
	
	// 사용자의 평가정보 화면으로 이동
	@RequestMapping("/evaluation/selectUser.do")
	public ModelAndView selectUser(@RequestParam Map<String, Object> map, ModelAndView mv) {
		logger.debug("----- [마켓 게시글을 작성한 사용자의 평가정보 화면으로 이동합니다.] -----");
		System.out.println("가져온 유저번호 : "+map);
		List<Market> list = service.selectUser(map); // 해당하는 번호의 market, member(nickName) 가져오기
		System.out.println("해당하는 유저번호의 list의 값은?");
		mv.addObject("list",list);
		mv.setViewName("evaluation/userInformation");
		return mv;
	}
}
