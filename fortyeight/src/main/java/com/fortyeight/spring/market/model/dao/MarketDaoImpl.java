package com.fortyeight.spring.market.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.fortyeight.spring.market.model.vo.Dips;
import com.fortyeight.spring.market.model.vo.Market;
import com.fortyeight.spring.market.model.vo.MarketViewImg;
import com.fortyeight.spring.market.model.vo.MkCommCount;
import com.fortyeight.spring.market.model.vo.MkComment;
import com.fortyeight.spring.market.model.vo.MkImg;

@Repository
public class MarketDaoImpl implements MarketDao {

	// 마켓 글 등록 1. market insert
	@Override
	public int insertMarket(SqlSessionTemplate session, Market mk) {
		System.out.println("---- dao Impl ----");
		return session.insert("market.insertMarket", mk);
	}

	// 마켓 글 등록 2. file insert
	@Override
	public int insertMarket(SqlSessionTemplate session, MkImg mi) {
		return session.insert("market.insertMkImg", mi);
	}

	// market list 출력
	@Override
	public List<Market> marketList(SqlSessionTemplate session, Map<String, String> map, int cPage, int numPerPage) {
		return session.selectList("market.marketList", map, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	// [팝니다] paging 
	@Override
	public int selectMarketCount(SqlSessionTemplate session, Map<String, String> map) {
		return session.selectOne("market.selectMarketCount", map);
	}

	//마켓상세화면 출력
	@Override
	public Market selectView(SqlSessionTemplate session, int mkNo) {
		return session.selectOne("market.selectView",mkNo);
	}
	
	//마켓상세뷰 닉네임만 출력
	@Override
	public String selectMkViewNick(SqlSessionTemplate session, int mkNo) {
		return session.selectOne("market.selectMkViewNick", mkNo);
	}

	// 마켓 상세화면 밑 [댓글] 리스트 출력
	@Override
	public List<MkComment> selectComment(SqlSessionTemplate session, int mkNo, int cPage, int numPerPage) {
		return session.selectList("market.selectMkComment", mkNo, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	// 마켓 상세화면 밑 [댓글] 페이징처리
	@Override
	public int selectCommentCount(SqlSessionTemplate session, int mkNo) {
		return session.selectOne("market.selectMkCommentCount", mkNo);
	}

	// 마켓 댓글 삭제
	@Override
	public int marketCommentDelete(SqlSessionTemplate session, Map<String, String> map) {
		return session.delete("market.marketCommentDelete", map);
	}
	
	// 마켓 댓글 추가
	@Override
	public int marketCommentInsert(SqlSessionTemplate session, Map<String, String> map) {
		return session.insert("market.marketCommentInsert", map);
	}

	// [삽니다] 리스트 출력
	@Override
	public List<Market> marketBuyList(SqlSessionTemplate session, Map<String, String> map, int cPage, int numPerPage) {
		return session.selectList("market.marketBuyList", map, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	// [삽니다] 페이징처리
	@Override
	public int selectMarketBuyCount(SqlSessionTemplate session, Map<String, String> map) {
		return session.selectOne("market.selectMarketBuyCount", map);
	}

	//마켓 상세 찜 리스트
	@Override
	public List<Dips> selectMkDips(SqlSessionTemplate session, Map<String, Integer> map) {
		return session.selectList("market.selectDips", map);
	}
	// 마켓 댓글 수(삽니다)
	@Override
	public List<MkCommCount> marketCommentCount(SqlSessionTemplate session) {
		return session.selectList("market.marketBuyCommentCount");
	}

	// 마켓 댓글 수(팝니다)
	@Override
	public List<MkCommCount> marketSellCommentCount(SqlSessionTemplate session) {
		return session.selectList("market.marketSellCommentCount");
	}

	// 마켓상세뷰 이미지 출력
	@Override
	public MarketViewImg selectMkViewImg(SqlSessionTemplate session, int mkNo) {
		return session.selectOne("market.selectMkViewImg", mkNo);
	}

	// 마켓상세뷰 찜 추가
	@Override
	public int insertDips(SqlSessionTemplate session, Map<String, String> map) {
		return session.insert("market.insertDips", map);
	}

	// 마켓상세뷰 찜 리스트 출력(슬기)
	@Override
	public List<Dips> selectDips(SqlSessionTemplate session, Map<String, String> map) {
		return session.selectList("market.selectDipsYSK", map);
	}

	// 마켓상세뷰 찜 삭제
	@Override
	public int deleteDips(SqlSessionTemplate session, Map<String, String> map) {
		return session.delete("market.deleteDips", map);
	}

	

	
	
	

}
