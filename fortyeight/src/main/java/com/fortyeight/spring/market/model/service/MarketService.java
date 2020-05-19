package com.fortyeight.spring.market.model.service;

import java.util.List;
import java.util.Map;

import com.fortyeight.spring.market.model.vo.Market;
import com.fortyeight.spring.market.model.vo.MkImg;

public interface MarketService {
	int insertMarket(Market mk, List<MkImg> files); // 글 등록
	
	// -----
	List<Market> marketList(Map<String, String> map, int cPage, int numPerPage); // 리스트 출력(팝니다)
	int selectMarketCount(Map<String, String> map); // 팝니다 paging 처리
	/*
	 * List<Market> searchMarket(Map<String, String> map); // 제목검색
	 */
}
