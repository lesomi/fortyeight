package com.fortyeight.spring.report.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Report {
	private int reportNo;
	private int userNo;
	private String reportText;
	private String reportContent;
}
