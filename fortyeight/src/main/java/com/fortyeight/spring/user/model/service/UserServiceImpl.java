package com.fortyeight.spring.user.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fortyeight.spring.user.model.dao.UserDao;
import com.fortyeight.spring.user.model.vo.User;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao dao;
	@Autowired
	private SqlSessionTemplate session;
	
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
}
