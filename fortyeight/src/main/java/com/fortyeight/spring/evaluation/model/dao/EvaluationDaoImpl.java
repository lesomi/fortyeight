package com.fortyeight.spring.evaluation.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fortyeight.spring.market.model.vo.Market;

@Repository
public class EvaluationDaoImpl implements EvaluationDao {

	// 평가정보 화면에 필요한 마켓정보 가져오기
	@Override
	public List<Market> selectUser(SqlSessionTemplate session, Map<String, Object> map) {
		return session.selectList("evaluation.selectUser", map);
	}

}
