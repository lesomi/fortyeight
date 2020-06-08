package com.fortyeight.spring.evaluation.model.service;

import java.util.List;
import java.util.Map;

import com.fortyeight.spring.market.model.vo.Market;

public interface EvaluationService {
	List<Market> selectUser(Map<String, Object> map); // 평가정보 화면에 필요한 마켓정보 가져오기
}
