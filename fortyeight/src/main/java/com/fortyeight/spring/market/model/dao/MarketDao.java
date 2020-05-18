package com.fortyeight.spring.market.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.fortyeight.spring.market.model.vo.Market;
import com.fortyeight.spring.market.model.vo.MkImg;

public interface MarketDao {
	int insertMarket(SqlSessionTemplate session, Market mk); // 마켓 글 등록1
	int insertMarket(SqlSessionTemplate session, MkImg mi); // 마켓 글 등록2
}
