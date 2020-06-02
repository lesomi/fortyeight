package com.fortyeight.spring.report.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.fortyeight.spring.report.model.service.ReportService;

@Controller
public class ReportController {
	
	@Autowired
	private ReportService service;
}
