package com.fortyeight.spring.market.model.service;

import java.util.List;

import com.fortyeight.spring.market.model.vo.Market;
import com.fortyeight.spring.market.model.vo.MkImg;

public interface MarketService {
	int insertMarket(Market mk, List<MkImg> files);
}
