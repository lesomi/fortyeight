package com.fortyeight.spring.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.fortyeight.spring.user.model.vo.User;

public class LoginUserInterceptor extends HandlerInterceptorAdapter {
	// [로그인 후 서비스 이용이 가능합니다] 안내메세지 작성
	
	@Autowired
	private Logger logger;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		User u = (User)request.getAttribute("loginUser");
		
		if(u!=null) {
			request.setAttribute("msg", "로그인 후 서비스 이용이 가능합니다.");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			return false;
		}
		else {
			return super.preHandle(request, response, handler);			
		}
	}
}
