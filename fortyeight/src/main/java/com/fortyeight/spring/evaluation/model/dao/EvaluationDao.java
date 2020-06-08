package com.fortyeight.spring.evaluation.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.fortyeight.spring.market.model.vo.Market;

public interface EvaluationDao {
	List<Market> selectUser(SqlSessionTemplate session, Map<String, Object> map); // 평가정보 화면에 필요한 마켓정보 가져오기
}
