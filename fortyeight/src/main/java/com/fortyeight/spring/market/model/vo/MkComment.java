package com.fortyeight.spring.market.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MkComment {
	// 마켓 댓글 관련 객체
	private int mkCommNo;
	private int userNo;
	private String nickName;
	private int mkRef; // 마켓 원글 번호
	private int commLevel;
	private String commContent;
	private int mkCommRef; // 댓글 원 번호
	private Date commDate;
}
