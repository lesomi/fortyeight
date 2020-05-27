package com.fortyeight.spring.market.model.service;

import java.util.List;
import java.util.Map;

import com.fortyeight.spring.market.model.vo.Dips;
import com.fortyeight.spring.market.model.vo.Market;
import com.fortyeight.spring.market.model.vo.MkCommCount;
import com.fortyeight.spring.market.model.vo.MkComment;
import com.fortyeight.spring.market.model.vo.MkImg;

public interface MarketService {
	int insertMarket(Market mk, List<MkImg> files); // 글 등록
	
	Market selectView(int mkNo); // 마켓 상세화면
	List<Dips> selectDips(int mkNo); //마켓 상세 찜 리스
	List<MkComment> selectComment(int mkNo, int cPage, int numPerPage); // 마켓 댓글리스트 출력
	int selectCommentCount(int mkNo); // 댓글리스트 페이징
	int marketCommentDelete(Map<String, String> map); // 댓글 삭제
	int marketCommentInsert(Map<String, String> map);// 댓글 추가
	
	// ----- 팝니다
	List<Market> marketList(Map<String, String> map, int cPage, int numPerPage); // 리스트 출력(팝니다)
	int selectMarketCount(Map<String, String> map); // 팝니다 paging 처리
	// ----- 삽니다
	List<Market> marketBuyList(Map<String, String> map, int cPage, int numPerPage);
	int selectMarketBuyCount(Map<String, String> map);
	
	List<MkCommCount> marketCommentCount(); // 마켓 댓글 수(삽니다)
	List<MkCommCount> marketSellCommentCount(); // 마켓 댓글 수(팝니다)
}
