package com.fortyeight.spring.user.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
	private int userNo;
	private String userId;
	private String password;
	private String nickName;
	private String email;
	private String phone;
	private String dealAddr;
	private Date enrollDate;
	private String status;
	private int reportcount;
	private String profile;
}
