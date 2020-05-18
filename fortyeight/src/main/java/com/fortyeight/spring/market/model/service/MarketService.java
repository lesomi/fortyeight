package com.fortyeight.spring.market.model.service;

import java.util.List;

import com.fortyeight.spring.market.model.vo.Market;
import com.fortyeight.spring.market.model.vo.MkImg;

public interface MarketService {
	int insertMarket(Market mk, List<MkImg> files); // 글 등록
	List<Market> marketList(int cPage, int numPerPage); // 리스트 출력(팝니다)
	int selectMarketCount(); // 팝니다 paging 처리
}
