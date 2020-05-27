package com.fortyeight.spring.market.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MarketViewImg {
	// MARKET, MKIMG 테이블 관련 객체
	private int mkNo;
	private String renameMkImg;
}
