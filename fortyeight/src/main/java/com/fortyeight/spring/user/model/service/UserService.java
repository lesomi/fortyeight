package com.fortyeight.spring.user.model.service;

import com.fortyeight.spring.user.model.vo.User;

public interface UserService {
	User selectLogin(String userId); //로그인
	User selectNick(String nickName); // 회원가입-닉네임찾기
	User selectPhone(String phone); // 회원가입-전화번호찾기
	User selectEmail(String email); // 회원가입-이메일찾기
}
