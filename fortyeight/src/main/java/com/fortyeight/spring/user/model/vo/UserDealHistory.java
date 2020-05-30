package com.fortyeight.spring.user.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDealHistory {
	// 거래내역 객체
	private int mkNo; // 마켓번호
	private String mkType; // 삽니다,팝니다
	private String dealStatus; // 판매중,예약중,판매완료
	private String mkTitle; // 글제목
	private String category; // 카테고리
	private int mkPrice; // 가격
	private String dealType; // 직거래,택배
	
}
