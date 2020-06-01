package com.fortyeight.spring.market.model.service;

import java.util.List;
import java.util.Map;

import com.fortyeight.spring.market.model.vo.Dips;
import com.fortyeight.spring.market.model.vo.Market;
import com.fortyeight.spring.market.model.vo.MarketViewImg;
import com.fortyeight.spring.market.model.vo.MkCommCount;
import com.fortyeight.spring.market.model.vo.MkComment;
import com.fortyeight.spring.market.model.vo.MkImg;

public interface MarketService {
	int insertMarket(Market mk, List<MkImg> files); // 글 등록
	
	Market selectView(int mkNo); // 마켓 상세화면
	List<Dips> selectMkDips(Map<String, Integer> map); // 마켓 상세뷰 찜 리스트
	List<Dips> selectDips(Map<String, String> map); // 마켓 상세뷰 찜 리스트(ajax쪽 메소드)
	int insertDips(Map<String, String> map); // 마켓 뷰 찜 추가
	int deleteDips(Map<String, String> map); // 마켓 뷰 찜 삭제
	int updateReservation(Map<String, String> map); // 마켓 뷰 거래상태 변경(예약중)
	int updateBuying(Map<String, String> map); // 마켓 뷰 거래상태 변경(구매중) -실제값:판매중
	int updateComplete(Map<String, String> map); // 마켓 뷰 거래상태 변경(구매완료) -실제값:판매완료
	
	String selectMkViewNick(int mkNo); // 마켓 상세 닉네임
	MarketViewImg selectMkViewImg(int mkNo); // 마켓 뷰 '이미지'만 출력
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
	
	Market updateMarket(Map<String, Object> map); // 마켓 수정 화면으로 전환하기 위해 필요한 데이터(마켓)
	String selectMkImg(int mkNo); // 마켓 수정 화면으로 전환하기 위해 필요한 데이터(마켓이미지)
}
