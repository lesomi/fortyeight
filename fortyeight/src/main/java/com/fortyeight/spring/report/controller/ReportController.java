package com.fortyeight.spring.report.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fortyeight.spring.common.PagingFactory;
import com.fortyeight.spring.report.model.service.ReportService;
import com.fortyeight.spring.report.model.vo.Report;

@Controller
public class ReportController {
	
	@Autowired
	private ReportService service;
	
	@RequestMapping("/report/insertReport.do")
	public String insertReport(Report r,int mkNo,Model m) {
		r=new Report(0,r.getUserNo(),mkNo,r.getReportText(),r.getReportContent(),null,0);
		
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
	
	@RequestMapping("/report/reportList.do")
	public ModelAndView selectReport(ModelAndView mv,
			@RequestParam(required=false, defaultValue="1") int cPage,
			@RequestParam(required=false, defaultValue="10") int numPerPage) {
		List<Report> list=service.selectReport(cPage,numPerPage);
		
		mv.addObject("report",list);
		
		int totalData=service.selectReportCount();
		
		//mv.addObject("pageBar",PagingFactory.getPage(totalData, cPage, numPerPage, "/spring/report/reportList.do"));
		mv.addObject("pageBar",PagingFactory.getPage(totalData, cPage, numPerPage, "/20PM_FortyEight_final/report/reportList.do")); //서버용
		
		mv.setViewName("admin/reportList");
		
		return mv;
	}
	
}
