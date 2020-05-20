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
	private int mkRef;
	private int commLevel;
	private String commContent;
	private Date commDate;
}
