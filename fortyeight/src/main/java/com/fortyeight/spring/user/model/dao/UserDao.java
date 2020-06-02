package com.fortyeight.spring.user.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.fortyeight.spring.market.model.vo.Market;
import com.fortyeight.spring.user.model.vo.User;
import com.fortyeight.spring.user.model.vo.UserDealHistory;
import com.fortyeight.spring.user.model.vo.UserDipsList;

public interface UserDao {
	User selectLogin(SqlSessionTemplate session,String userId); //로그인
	User selectNick(SqlSessionTemplate session,String nickName); // 회원가입-닉네임찾기
	User selectPhone(SqlSessionTemplate session, String phone); // 회원가입-전화번호찾기
	User selectEmail(SqlSessionTemplate session,String email); // 회원가입-이메일찾기
	int insertUser(SqlSessionTemplate session, User u); // 회원가입
	User selectPwCk(SqlSessionTemplate session,Map<String,String> pwCk);
	int updatePassword(SqlSessionTemplate session,Map<String,Object> map);
	
	// 마이페이지 진입시
	int buySu(SqlSessionTemplate session, int userNo); // 사용자 거래내역
	int sellSu(SqlSessionTemplate session, int userNo); // 사용자 판매내역
	int dipsSu(SqlSessionTemplate session, int userNo); // 사용자 찜목록 수
	int ingSu(SqlSessionTemplate session, int userNo); // 사용자 거래진행내역 수
	
	int updatePasswordEnd(SqlSessionTemplate session, User u); // 비밀번호 변경
	int updateUser(SqlSessionTemplate session, User u); // 회원정보수정
	int deleteUser(SqlSessionTemplate session, int userNo); // 회원탈퇴
	List<UserDipsList> selectDipsList(SqlSessionTemplate session, Map<String, Object> map, int cPage, int numPerPage); // 마이페이지-찜목록
	int selectDipsListCount(SqlSessionTemplate session, Map<String, Object> map); // 마이페이지-찜목록 페이징
	List<UserDealHistory> selectDealHistory(SqlSessionTemplate session, Map<String, Object> map, int cPage, int numPerPage); // 마이페이지-거래내역
	int selectDealHistoryCount(SqlSessionTemplate session, Map<String, Object> map); // 마이페이지-거래내역 페이징
	
	int updateUserDealAddrEnd(SqlSessionTemplate session, Map<String, Object> map);// 마이페이지-거래주소 변경
	
	int updateReportCount(SqlSessionTemplate session,int userNo); //유저 신고 횟수 증가
	int updateReportProcess(SqlSessionTemplate session,int reportNo);//신고 처리
}
