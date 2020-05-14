package com.fortyeight.spring.common;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class LoggerConfig {
	// logger bean 등록
	@Bean
	public Logger getLogger() {
		return LoggerFactory.getLogger(LoggerConfig.class);
	}
}
