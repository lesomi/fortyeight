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
}
