package com.fortyeight.spring.market.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.fortyeight.spring.market.model.vo.Market;
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

	/*
	 * // 제목검색
	 * 
	 * @Override public List<Market> searchMarket(SqlSessionTemplate session,
	 * Map<String, String> map) { return session.selectList("market.searchMarket",
	 * map); }
	 */

	
	
	

}
