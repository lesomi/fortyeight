package com.fortyeight.spring.user.model.service;

import java.util.List;
import java.util.Map;

import com.fortyeight.spring.market.model.vo.Market;
import com.fortyeight.spring.user.model.vo.User;
import com.fortyeight.spring.user.model.vo.UserDealHistory;
import com.fortyeight.spring.user.model.vo.UserDipsList;

public interface UserService {
	User selectLogin(String userId); //로그인
	User selectNick(String nickName); // 회원가입-닉네임찾기
	User selectPhone(String phone); // 회원가입-전화번호찾기
	User selectEmail(String email); // 회원가입-이메일찾기
	int insertUser(User u); // 회원가입 DB 저장
	User selectPwCk(Map<String,String> pwCk);
	int updatePassword(Map<String,Object> map);
	
	// 마이페이지 화면전환 시 
	int buySu(int userNo); // 사용자 구매내역
	int sellSu(int userNo); // 사용자 구매내역
	int dipsSu(int userNo); // 사용자 찜목록 수
	int ingSu(int userNo); // 사용자 거래진행내역 수
	
	int updatePasswordEnd(User u); // 비밀번호 수정
	int updateUser(User u); // 회원정보수정
	int deleteUser(int userNo); // 회원탈퇴
	List<UserDipsList> selectDipsList(Map<String, Object> map, int cPage, int numPerPage); // 마이페이지-찜목록
	int selectDipsListCount(Map<String, Object> map); // 마이페이지-찜목록 페이징
	List<UserDealHistory> selectDealHistory(Map<String, Object> map, int cPage, int numPerPage); // 마이페이지-거래내역
	int selectDealHistoryCount(Map<String, Object> map); // 마이페이지-거래내역 페이징
}
