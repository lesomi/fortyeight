package com.fortyeight.spring.report.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fortyeight.spring.report.model.service.ReportService;
import com.fortyeight.spring.report.model.vo.Report;

@Controller
public class ReportController {
	
	@Autowired
	private ReportService service;
	
	@RequestMapping("/report/insertReport.do")
	public String insertReport(Report r,int mkNo,Model m) {
		r=new Report(0,r.getUserNo(),r.getReportText(),r.getReportContent());
		
		int result=service.insertReport(r);
		
		if(result>0) {
			m.addAttribute("msg","신고가 완료되었습니다.");
			m.addAttribute("loc","/market/marketView.do?mkNo="+mkNo);
		}else {
			m.addAttribute("msg","신고 실패");
			m.addAttribute("loc","/market/marketView.do?mkNo="+mkNo);
		}
		
		return "common/msg";
	}
	
}
