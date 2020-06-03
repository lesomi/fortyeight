package com.fortyeight.spring.market.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.fortyeight.spring.market.model.vo.Dips;
import com.fortyeight.spring.market.model.vo.Market;
import com.fortyeight.spring.market.model.vo.MarketViewImg;
import com.fortyeight.spring.market.model.vo.MkCommCount;
import com.fortyeight.spring.market.model.vo.MkComment;
import com.fortyeight.spring.market.model.vo.MkImg;

public interface MarketDao {
	int insertMarket(SqlSessionTemplate session, Market mk); // 마켓 글 등록1
	int insertMarket(SqlSessionTemplate session, MkImg mi); // 마켓 글 등록2
	
	Market selectView(SqlSessionTemplate session,int mkNo); //마켓 상세화면 출력
	List<Dips> selectMkDips(SqlSessionTemplate session, Map<String, Integer> map); //마켓 상세 찜 리스트
	List<Dips> selectDips(SqlSessionTemplate session, Map<String, String> map); // 마켓 상세 찜 리스트(ajax 메소드)
	int insertDips(SqlSessionTemplate session, Map<String, String> map); // 마켓 상세뷰 찜 추가
	int deleteDips(SqlSessionTemplate session, Map<String, String> map); // 마켓 상세뷰 찜 삭제
	int updateReservation(SqlSessionTemplate session, Map<String, String> map); // 마켓 뷰 거래상태 변경(예약중)
	int updateBuying(SqlSessionTemplate session, Map<String, String> map); // 마켓 뷰 거래상태 변경(구매중) -실제값:판매중
	int updateComplete(SqlSessionTemplate session, Map<String, String> map); // 마켓 뷰 거래상태 변경(구매완료) -실제값:판매완료
	
	String selectMkViewNick(SqlSessionTemplate session,int mkNo); // 마켓 상세뷰 닉네임만 출력
	MarketViewImg selectMkViewImg(SqlSessionTemplate session,int mkNo); //삽니다 이미지
	MarketViewImg selectMkViewImgSell(SqlSessionTemplate session,int mkNo);//팝니다 이미지
	List<MkComment> selectComment(SqlSessionTemplate session, int mkNo, int cPage, int numPerPage); // 마켓 상세화면 밑 댓글 리스트 출력
	int selectCommentCount(SqlSessionTemplate session, int mkNo); // 마켓 상세화면 밑 댓글 페이징처리
	int marketCommentDelete(SqlSessionTemplate session, Map<String, String> map);// 마켓 댓글 삭제
	int marketCommentInsert(SqlSessionTemplate session, Map<String, String> map); // 마켓 댓글 추가
	
	// ----- 팝니다
	List<Market> marketList(SqlSessionTemplate session, Map<String, String> map, int cPage, int numPerPage); // market list 출력
	int selectMarketCount(SqlSessionTemplate session, Map<String, String> map); // paging
	// ----- 삽니다
	List<Market> marketBuyList(SqlSessionTemplate session, Map<String, String> map, int cPage, int numPerPage);
	int selectMarketBuyCount(SqlSessionTemplate session, Map<String, String> map);
	
	List<MkCommCount> marketCommentCount(SqlSessionTemplate session); // 마켓 댓글 수(삽니다)
	List<MkCommCount> marketSellCommentCount(SqlSessionTemplate session); // 마켓 댓글 수(팝니다)
	
	Market updateMarket(SqlSessionTemplate session, Map<String, Object> map);// 마켓 수정 화면으로 전환하기 위해 필요한 데이터(마켓)
	
	int deleteMarket(SqlSessionTemplate session, int mkNo); //마켓 삭제

	MkImg selectMkImg(SqlSessionTemplate session, int mkNo); // 마켓 수정 화면으로 전환하기 위해 필요한 데이터(마켓이미지)
	
	int updateMarketEnd(SqlSessionTemplate session, Market mk); // 마켓 글 수정1
	int updateMarketEnd(SqlSessionTemplate session, MkImg mi); // 마켓 글 수정2
	int deleteMkImg(SqlSessionTemplate session, int mkNo); // 마켓 글 수정3
}
