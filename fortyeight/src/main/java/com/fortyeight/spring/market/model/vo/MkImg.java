package com.fortyeight.spring.market.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MkImg {
	// 마켓 글 등록시 이미지 관련 객체
	private int mkImgNo;
	private int mkNo;
	private String oriMkImg;
	private String renameMkImg;
}
