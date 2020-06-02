package com.fortyeight.spring.report.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.fortyeight.spring.report.model.vo.Report;

public interface ReportDao {
	int insertReport(SqlSessionTemplate session,Report r);
}
