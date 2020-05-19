package com.fortyeight.spring.chatting.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Chatting {
	private int chatNo;
	private String chatType;
	private int sender;
	private int receiver;
	private Date chatDate;
	private String chatting;
	private int roomNo;
}
