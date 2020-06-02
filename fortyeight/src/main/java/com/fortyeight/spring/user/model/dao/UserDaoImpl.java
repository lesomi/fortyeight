package com.fortyeight.spring.user.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fortyeight.spring.market.model.vo.Market;
import com.fortyeight.spring.user.model.vo.User;
import com.fortyeight.spring.user.model.vo.UserDealHistory;
import com.fortyeight.spring.user.model.vo.UserDipsList;


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

	// 회원가입
	@Override
	public int insertUser(SqlSessionTemplate session, User u) {
		return session.insert("user.insertUser", u);
	}

	@Override
	public User selectPwCk(SqlSessionTemplate session, Map<String,String> pwCk) {
		return session.selectOne("user.selectPwCk", pwCk);
	}

	@Override
	public int updatePassword(SqlSessionTemplate session, Map<String, Object> map) {
		return session.update("user.updatePassword",map);
	}

	// 마이페이지 진입시
	// 사용자 거래내역
	@Override
	public int buySu(SqlSessionTemplate session, int userNo) {
		return session.selectOne("user.buySu", userNo);
	}
	
	// 마이페이지 진입시
	// 사용자 판매내역
	@Override
	public int sellSu(SqlSessionTemplate session, int userNo) {
		return session.selectOne("user.sellSu", userNo);
	}
	
	// 마이페이지 진입시
	// 사용자 찜목록 수
	@Override
	public int dipsSu(SqlSessionTemplate session, int userNo) {
		return session.selectOne("user.dipsSu", userNo);
	}
	
	// 마이페이지 진입시
	// 사용자 찜목록 수
	@Override
	public int ingSu(SqlSessionTemplate session, int userNo) {
		return session.selectOne("user.ingSu", userNo);
	}

	// 회원정보수정
	@Override
	public int updateUser(SqlSessionTemplate session, User u) {
		return session.update("user.updateUser", u);
	}

	// 회원탈퇴
	@Override
	public int deleteUser(SqlSessionTemplate session, int userNo) {
		return session.delete("user.deleteUser", userNo);
	}

	// 마이페이지-찜목록
	@Override
	public List<UserDipsList> selectDipsList(SqlSessionTemplate session, Map<String, Object> map, int cPage, int numPerPage) {
		return session.selectList("user.selectDipsList", map, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	// 마이페이지-찜목록 페이징
	@Override
	public int selectDipsListCount(SqlSessionTemplate session, Map<String, Object> map) {
		return session.selectOne("user.selectDipsListCount", map);
	}

	// 마이페이지-거래내역
	@Override
	public List<UserDealHistory> selectDealHistory(SqlSessionTemplate session, Map<String, Object> map, int cPage, int numPerPage) {
		return session.selectList("user.selectDealHistory", map, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	// 마이페이지-거래내역 페이징
	@Override
	public int selectDealHistoryCount(SqlSessionTemplate session, Map<String, Object> map) {
		return session.selectOne("user.selectDealHistoryCount", map);
	}

	// 비밀번호 변경
	@Override
	public int updatePasswordEnd(SqlSessionTemplate session, User u) {
		return session.update("user.updatePasswordEnd", u);
	}

	// 마이페이지-거래주소 변경
	@Override
	public int updateUserDealAddrEnd(SqlSessionTemplate session, Map<String, Object> map) {
		return session.update("user.updateUserDealAddrEnd", map);
	}
	
	
}
