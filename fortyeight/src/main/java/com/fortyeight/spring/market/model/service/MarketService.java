package com.fortyeight.spring.market.model.service;

import java.util.List;
import java.util.Map;

import com.fortyeight.spring.market.model.vo.Market;
import com.fortyeight.spring.market.model.vo.MkImg;

public interface MarketService {
	int insertMarket(Market mk, List<MkImg> files); // 글 등록
	
	Market selectView(int mkNo);
	
	// ----- 팝니다
	List<Market> marketList(Map<String, String> map, int cPage, int numPerPage); // 리스트 출력(팝니다)
	int selectMarketCount(Map<String, String> map); // 팝니다 paging 처리
	// ----- 삽니다
	List<Market> marketBuyList(Map<String, String> map, int cPage, int numPerPage);
	int selectMarketBuyCount(Map<String, String> map);
}
