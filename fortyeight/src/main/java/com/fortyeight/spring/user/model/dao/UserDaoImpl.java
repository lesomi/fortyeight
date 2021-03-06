package com.fortyeight.spring.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fortyeight.spring.user.model.vo.User;

@Repository
public class UserDaoImpl implements UserDao {

	//로그인
	@Override
	public User selectLogin(SqlSessionTemplate session, String userId) {
		return session.selectOne("user.selectLogin",userId);
	}

//	[회원가입] -닉네임찾기
	@Override
	public User selectNick(SqlSessionTemplate session, String nickName) {
		return session.selectOne("user.selectNick",nickName);
	}
	
//	[회원가입] -전화번호찾기
	@Override
	public User selectPhone(SqlSessionTemplate session, String phone) {
		return session.selectOne("user.selectPhone",phone);
	}

	// [회원가입] - 이메일찾기
	@Override
	public User selectEmail(SqlSessionTemplate session, String email) {
		return session.selectOne("user.selectEmail",email);
	}
}
