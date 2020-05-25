package com.fortyeight.spring.user.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
	private int userNo; // 번호
	private String userId; // 아이디 
	private String password; // 패스워드(양방향)
	private String nickName; // 닉네임
	private String email; // 이메일
	private String phone; // 휴대폰(양방향)
	private String dealAddr; // 거래주소
	private Date enrollDate; // 가입일자
	private String status; // 탈퇴여부
	private int reportcount; // 신고횟수
	private String oriProfile; // 프로필 기존
	private String renameProfile; // 프로필 리네임
}
