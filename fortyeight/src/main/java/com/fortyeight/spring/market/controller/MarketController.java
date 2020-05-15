package com.fortyeight.spring.market.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MarketController {
	
	// [팝니다] 화면으로 전환
	@RequestMapping("/market/selMarket.do")
	public String selMarket() {
		return "market/marketList";
	}
	
	// [팝니다] 작성 버튼 눌렀을 때 글작성 화면으로 전황
	@RequestMapping("/market/writeSell.do")
	public String writeSell() {
		return "market/marketWrite";
	}
}
