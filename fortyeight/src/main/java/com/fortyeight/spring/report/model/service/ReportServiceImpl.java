package com.fortyeight.spring.report.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fortyeight.spring.report.model.dao.ReportDao;

@Service
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	private ReportDao dao;
	@Autowired
	SqlSessionTemplate session;
}
