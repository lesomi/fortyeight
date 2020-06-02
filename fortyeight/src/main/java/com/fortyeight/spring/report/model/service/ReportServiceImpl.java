package com.fortyeight.spring.report.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fortyeight.spring.report.model.dao.ReportDao;
import com.fortyeight.spring.report.model.vo.Report;

@Service
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	private ReportDao dao;
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public int insertReport(Report r) {
		return dao.insertReport(session,r);
	}

	@Override
	public List<Report> selectReport(int cPage, int numPerPage) {
		return dao.selectReport(session,cPage,numPerPage);
	}

	@Override
	public int selectReportCount() {
		return dao.selectReportCount(session);
	}
	
}
