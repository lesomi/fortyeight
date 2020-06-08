package com.fortyeight.spring.evaluation.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fortyeight.spring.evaluation.model.dao.EvaluationDao;
import com.fortyeight.spring.market.model.vo.Market;
import com.fortyeight.spring.user.controller.UserController;

@Service
public class EvaluationServiceImpl implements EvaluationService {

	@Autowired
	private EvaluationDao dao;
	@Autowired
	private SqlSessionTemplate session;
	@Autowired
	private Logger logger = LoggerFactory.getLogger(UserController.class);
	
	// 평가정보 화면에 필요한 마켓정보 가져오기
	@Override
	public List<Market> selectUser(Map<String, Object> map) {
		return dao.selectUser(session, map);
	}

}
