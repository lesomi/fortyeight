package com.fortyeight.spring.market.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.ui.Model;

import com.fortyeight.spring.market.model.vo.Market;
import com.fortyeight.spring.market.model.vo.MkCommCount;
import com.fortyeight.spring.market.model.vo.MkComment;
import com.fortyeight.spring.market.model.vo.MkImg;

public interface MarketDao {
	int insertMarket(SqlSessionTemplate session, Market mk); // 마켓 글 등록1
	int insertMarket(SqlSessionTemplate session, MkImg mi); // 마켓 글 등록2
	
	Market selectView(SqlSessionTemplate session,int mkNo); //마켓 상세화면 출력
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
}
