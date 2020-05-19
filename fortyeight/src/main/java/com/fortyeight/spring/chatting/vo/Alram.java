package com.fortyeight.spring.chatting.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Alram {
	private String type;
	private String msg;
	private int sender;
	private int receiver;
}
