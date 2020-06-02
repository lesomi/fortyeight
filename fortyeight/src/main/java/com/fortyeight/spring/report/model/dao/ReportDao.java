package com.fortyeight.spring.report.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.fortyeight.spring.report.model.vo.Report;

public interface ReportDao {
	int insertReport(SqlSessionTemplate session,Report r);
	List<Report> selectReport(SqlSessionTemplate session,int cPage,int numPerPage);
	int selectReportCount(SqlSessionTemplate session);
}
