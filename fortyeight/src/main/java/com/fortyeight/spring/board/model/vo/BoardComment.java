package com.fortyeight.spring.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardComment {
	private int boardCommNo;
	private int boardRef;
	private int userNo;
	private int commLevel;
	private String commContent;
	private int boardCommRef;
	private Date commDate;
	private String nickName;
}
