package com.fortyeight.spring.user.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fortyeight.spring.market.model.vo.Market;
import com.fortyeight.spring.user.model.dao.UserDao;
import com.fortyeight.spring.user.model.vo.User;
import com.fortyeight.spring.user.model.vo.UserDealHistory;
import com.fortyeight.spring.user.model.vo.UserDipsList;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao dao;
	@Autowired
	private SqlSessionTemplate session;
	@Autowired
	private Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
	//로그인
	@Override
	public User selectLogin(String userId) {
		return dao.selectLogin(session,userId);
	}

//	[회원가입] - 닉네임 찾기
	@Override
	public User selectNick(String nickName) {
		return dao.selectNick(session,nickName);
	}

//	[회원가입] - 전화번호찾기
	@Override
	public User selectPhone(String phone) {
		return dao.selectPhone(session,phone);
	}
	
	// [회원가입] - 이메일 찾기
	@Override
	public User selectEmail(String email) {
		return dao.selectEmail(session,email);
	}

	// 회원가입
	@Override
	public int insertUser(User u) {
		return dao.insertUser(session, u);
		
	}

	@Override
	public User selectPwCk(Map<String,String> pwCk) {
		return dao.selectPwCk(session,pwCk);
	}

	@Override
	public int updatePassword(Map<String, Object> map) {
		return dao.updatePassword(session,map);
	}

	// 회원정보 수정
	@Override
	public int updateUser(User u) {
		return dao.updateUser(session,u);
	}

	// 회원탈퇴
	@Override
	public int deleteUser(int userNo) {
		return dao.deleteUser(session, userNo);
	}

	// 마이페이지-찜목록
	@Override
	public List<UserDipsList> selectDipsList(Map<String, Object> map) {
		return dao.selectDipsList(session, map);
	}

	// 마이페이지-찜목록 페이징
	@Override
	public int selectDipsListCount(Map<String, Object> map) {
		return dao.selectDipsListCount(session, map);
	}

	// 마이페이지-거래내역
	@Override
	public List<UserDealHistory> selectDealHistory(Map<String, Object> map) {
		return dao.selectDealHistory(session, map);
	}

	// 마이페이지-거래내역 페이징
	@Override
	public int selectDealHistoryCount(Map<String, Object> map) {
		return dao.selectDealHistoryCount(session, map);
	}
	
	
}
