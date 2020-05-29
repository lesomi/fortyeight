package com.fortyeight.spring.user.model.service;

import java.util.List;
import java.util.Map;

import com.fortyeight.spring.user.model.vo.User;
import com.fortyeight.spring.user.model.vo.UserDipsList;

public interface UserService {
	User selectLogin(String userId); //로그인
	User selectNick(String nickName); // 회원가입-닉네임찾기
	User selectPhone(String phone); // 회원가입-전화번호찾기
	User selectEmail(String email); // 회원가입-이메일찾기
	int insertUser(User u); // 회원가입 DB 저장
	User selectPwCk(Map<String,String> pwCk);
	int updatePassword(Map<String,Object> map);
	int updateUser(User u); // 회원정보수정
	int deleteUser(int userNo); // 회원탈퇴
	List<UserDipsList> selectDipsList(Map<String, Object> map); // 마이페이지-찜목록
	int selectDipsListCount(Map<String, Object> map); // 마이페이지-찜목록 페이징
}
