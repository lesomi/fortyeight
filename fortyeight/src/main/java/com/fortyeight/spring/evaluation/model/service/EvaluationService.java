package com.fortyeight.spring.evaluation.model.service;

import java.util.List;
import java.util.Map;

import com.fortyeight.spring.market.model.vo.Market;
import com.fortyeight.spring.user.model.vo.User;

public interface EvaluationService {
	List<Market> selectUser(Map<String, Object> map); // 평가정보 화면에 필요한 마켓정보 가져오기
	User selectUserNickName(Map<String, Object> map); // 평가정보 화면에 필요한 닉네임, 프로필, 주소 가져오기
}
