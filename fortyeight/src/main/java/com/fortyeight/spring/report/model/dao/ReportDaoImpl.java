package com.fortyeight.spring.report.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fortyeight.spring.report.model.vo.Report;

@Repository
public class ReportDaoImpl implements ReportDao {

	@Override
	public int insertReport(SqlSessionTemplate session, Report r) {
		return session.insert("report.insertReport",r);
	}

	@Override
	public List<Report> selectReport(SqlSessionTemplate session,int cPage, int numPerPage) {
		return session.selectList("report.selectReport",null, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int selectReportCount(SqlSessionTemplate session) {
		return session.selectOne("report.selectReportCount");
	}

}
