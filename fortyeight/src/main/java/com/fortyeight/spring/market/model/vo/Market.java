package com.fortyeight.spring.market.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Market {
	private int mkNo; // 마켓번호
	private int userNo; // 유저번호
	private String mkTitle; // 제목
	private String dealAddr; // 거래주소
	private String category; // 카테고리
	private int mkPrice; // 가격
	private String mkType; // 삽니다, 팝니다
	private String dealType; // 거래타입(택배,직거래)
	private String mkContent; // 게시글 내용
	private String dealStatus; // 판매상태(판매중/예약중/판매완료)
	
	// 마켓 등록 시 필요한 객체
	private String orimkFile; // 원래이름
	private String renamemkFile; // 변경이름
	
	private int commCount;// 댓글 수
	
	// 마켓 리스트 불러올때 필요한 객체
	private String renameMkImg;
}
