package com.fortyeight.spring.report.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fortyeight.spring.report.model.vo.Report;

@Repository
public class ReportDaoImpl implements ReportDao {

	@Override
	public int insertReport(SqlSessionTemplate session, Report r) {
		return session.insert("report.insertReport",r);
	}

}
