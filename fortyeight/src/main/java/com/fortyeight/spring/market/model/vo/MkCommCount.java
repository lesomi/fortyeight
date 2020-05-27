package com.fortyeight.spring.market.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MkCommCount {
	// 마켓 댓글 수 객체
	private int mkNo;
	private String category;
	private int commCount;
}
