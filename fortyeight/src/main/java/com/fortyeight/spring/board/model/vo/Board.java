package com.fortyeight.spring.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Board {
	private int boardNo;
	private int userNo;
	private String boardTitle;
	private String boardContent;
	private Date boardDate;
	private String boardType;
	private String deleted;
}
