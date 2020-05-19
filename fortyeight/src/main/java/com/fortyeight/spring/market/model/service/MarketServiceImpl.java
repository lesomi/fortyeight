package com.fortyeight.spring.market.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fortyeight.spring.common.MyException;
import com.fortyeight.spring.market.model.dao.MarketDao;
import com.fortyeight.spring.market.model.vo.Market;
import com.fortyeight.spring.market.model.vo.MkImg;
import com.fortyeight.spring.user.model.service.UserServiceImpl;

@Service
public class MarketServiceImpl implements MarketService {
	
	@Autowired
	private MarketDao dao;
	@Autowired
	private SqlSessionTemplate session;
	@Autowired
	private Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	
	// market 글 등록 - 트랜잭션 처리 필요
	@Override
	public int insertMarket(Market mk, List<MkImg> files) throws MyException {
		logger.debug("----- market 글 등록 메소드에 진입했어요! -----");
		// 1. market insert
		int result = dao.insertMarket(session, mk);
		logger.debug(""+mk.getMkNo());
		System.out.println("----- service Impl에서 market 추가한 result값은? : " +result+" -----");
		
		// 입력값이 없을 경우 예외처리하기
		if(result == 0) {
			throw new MyException("[ERROR : market 등록 에러]");
		}

		// 2. files insert
		if(!files.isEmpty()) {
			for(MkImg mi : files) {
				mi.setMkNo(mk.getMkNo());
				result = dao.insertMarket(session, mi);
				
				if(result == 0) {
					throw new MyException("[ERROR : MkImg 등록 에러]");
				}
				System.out.println("----- service Impl에서 files 추가한 result값은? : " +result+" -----");
			}
		}
		return result;
	}

	// [팝니다] List 출력
	@Override
	public List<Market> marketList(int cPage, int numPerPage) {
		return dao.marketList(session, cPage, numPerPage);
	}

	// [팝니다] paging
	@Override
	public int selectMarketCount() {
		return dao.selectMarketCount(session);
	}

	//팝니다 상세
	@Override
	public Market selectView(int mkNo) {
		return dao.selectView(session,mkNo);
	}
	
	
	
}
