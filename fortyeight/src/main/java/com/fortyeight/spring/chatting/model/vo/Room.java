package com.fortyeight.spring.chatting.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Room {
	private int roomNo;
	private int mkNo;
	private int seller;
	private int buyer;
}
