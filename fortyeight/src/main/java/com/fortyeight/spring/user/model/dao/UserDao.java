package com.fortyeight.spring.user.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.fortyeight.spring.user.model.vo.User;
import com.fortyeight.spring.user.model.vo.UserDipsList;

public interface UserDao {
	User selectLogin(SqlSessionTemplate session,String userId); //로그인
	User selectNick(SqlSessionTemplate session,String nickName); // 회원가입-닉네임찾기
	User selectPhone(SqlSessionTemplate session, String phone); // 회원가입-전화번호찾기
	User selectEmail(SqlSessionTemplate session,String email); // 회원가입-이메일찾기
	int insertUser(SqlSessionTemplate session, User u); // 회원가입
	User selectPwCk(SqlSessionTemplate session,Map<String,String> pwCk);
	int updatePassword(SqlSessionTemplate session,Map<String,Object> map);
	int updateUser(SqlSessionTemplate session, User u); // 회원정보수정
	int deleteUser(SqlSessionTemplate session, int userNo); // 회원탈퇴
	List<UserDipsList> selectDipsList(SqlSessionTemplate session, Map<String, Object> map); // 마이페이지-찜목록
	int selectDipsListCount(SqlSessionTemplate session, Map<String, Object> map); // 마이페이지-찜목록 페이징
}
