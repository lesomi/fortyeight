package com.fortyeight.spring.user.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDipsList {
	// member, dips, market 관련 테이블 (찜목록 리스트)
	private int mkNo; // 마켓번호(바로가기 버튼을 위한 번호)
	private String mkType; // 삽니다,팝니다
	private String mkTitle; // 마켓 글제목
	private String nickName; // 닉네임
	private Date mkDate; // 마켓 글작성일
}
