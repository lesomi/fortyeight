package com.fortyeight.spring.evaluation.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fortyeight.spring.market.model.vo.Market;
import com.fortyeight.spring.user.model.vo.User;

@Repository
public class EvaluationDaoImpl implements EvaluationDao {

	// 평가정보 화면에 필요한 마켓정보 가져오기
	@Override
	public List<Market> selectUser(SqlSessionTemplate session, Map<String, Object> map) {
		return session.selectList("evaluation.selectUser", map);
	}

	// 평가정보 화면에 필요한 닉네임,프로필,주소 가져오기
	@Override
	public User selectUserNickName(SqlSessionTemplate session, Map<String, Object> map) {
		return session.selectOne("evaluation.selectUserNickName", map);
	}

	
}
