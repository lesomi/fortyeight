package com.fortyeight.spring.report.model.service;

import java.util.List;

import com.fortyeight.spring.report.model.vo.Report;

public interface ReportService {
	int insertReport(Report r);
	List<Report> selectReport(int cPage, int numPerPage);
	int selectReportCount();
}
