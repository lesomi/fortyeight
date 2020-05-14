package com.fortyeight.spring.user.controller;

import java.io.IOException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.fortyeight.spring.user.model.service.UserService;
import com.fortyeight.spring.user.model.vo.User;

@Controller
@SessionAttributes({"loginUser"})
public class UserController {
	//유저 테이블 관련 클래스
	
	@Autowired
	private UserService service;
	@Autowired
	private BCryptPasswordEncoder encoder;
	@Autowired
	private Logger logger = LoggerFactory.getLogger(UserController.class);
	
	//회원가입 화면 전환
	@RequestMapping("/user/agreeUser.do")
	public String agreeUser() {
		return "user/agreeUser";
	}
	
	//로그인
	@RequestMapping("/user/login.do")
	public String login(String userId,String password,Model model) {
		User login=service.selectLogin(userId);
		
		if(login !=null && encoder.matches(password, login.getPassword())) { 
			//로그인 성공
			model.addAttribute("loginUser",login);
		}else {
			//로그인 실패
			model.addAttribute("msg","아이디 또는 비밀번호가 일치하지 않습니다.");
		}
		model.addAttribute("loc","/");
		
		return "common/msg";
	}
	
	//로그아웃
	@RequestMapping("/user/logout.do")
	public String logout(SessionStatus status,HttpSession session) {
		if(!status.isComplete()) {//세션이 만료되지 않았다면
			status.setComplete();//로그아웃
		}
		
		return "redirect:/";
	}
	
//	[동의]버튼 누르면, [회원가입] 화면으로 전환
	@RequestMapping("/user/insertUser.do")
	public String insertUser() {
		return "user/insertUser";
	}
	
//	회원가입
	@RequestMapping("/user/insertUserEnd.do")
	public String insertUserEnd(User u, Model model, MultipartFile upFile, HttpSession session) {
		
		logger.debug("----- 회원가입 로직 진행 들어옴 -----");
		String path = session.getServletContext().getRealPath("/resources/upload/user"); // 저장경로
		
		
		
		
		
		
		// 비밀번호 암호화
		System.out.println("암호화 되기 전 비밀번호 : "+u.getPassword());
		u.setPassword(encoder.encode(u.getPassword()));
		System.out.println("암호화된 비밀번호 : "+u.getPassword());
		
		// 전화번호 암호화
		System.out.println("암호화 되기 전 전화번호 : "+u.getPhone());
		u.setPhone(encoder.encode(u.getPhone()));
		System.out.println("암호화된 전화번호 : "+u.getPhone());
		
		// DB에 값 저장
		int result = service.insertUser(u);
		logger.debug("회원가입이 성공했습니까? 0이면 false, 1이면 true "+result);
		
		// 페이지 분기처리
		String page = "";
		if(result>0) {
			model.addAttribute("msg","회원가입이 완료되었습니다!");
			page = "redirect:/";
		}
		else {
			model.addAttribute("msg","회원가입이 실패되었습니다. 다시 진행해주세요.");
			model.addAttribute("loc","/user/insertUser.do"); // 회원가입 화면전환
			page = "common/msg";
		}
		return page;
	}
	
	//아이디/비밀번호 찾기 페이지 이동
	@RequestMapping("/user/find.do")
	public String find() {
		return "user/findUser";
	}
	
//	[회원가입] - 아이디 체크 ajax(첫번째 ajax 활용)
	@RequestMapping("/user/checkId.do")
	@ResponseBody
	public void checkId(String userId, ServletOutputStream out) {
//		DB에 접속해서 user 정보를 가져온다.
		User login = service.selectLogin(userId);
		System.out.println("가져온 user값이 있는가?"+login);
		
		/* id값 분기처리 */
		/* login이 null이 아니면? 아이디 사용 불가! */
		boolean flag = login!=null? false : true;
		
		try {
			out.print(flag);			
		}
		catch(IOException e) {
			e.printStackTrace();
		}
	}
	
//	[회원가입] - 닉네임 체크 ajax(세번째 ajax 활용)
	@RequestMapping("/user/checkNick.do")
	@ResponseBody
	public boolean checkNick(String nickName) {
		User u = service.selectNick(nickName);
		boolean flag = u!=null? false: true;
		System.out.println("가져온 user의 닉네임 값이 있는가?" + flag);
		return flag;
	}
	
//	[회원가입] - 전화번호 체크 ajax(〃)
	@RequestMapping("/user/checkPhone.do")
	@ResponseBody
	public boolean checkPhone(String phone) {
		User u = service.selectPhone(phone);
		boolean flag = u!=null? false: true;
		System.out.println("가져온 user의 전화번호 값이 있는가?" + flag);
		return flag;
	}
	
	// [회원가입] -이메일 체크 ajax(〃)
	@RequestMapping("/user/checkEmail.do")
	@ResponseBody
	public boolean checkEmail(String email) {
		User u=service.selectEmail(email);
		boolean flag = u!=null? false : true;
		return flag;
	}
	
	//아이디찾기 화면 전환용
	@RequestMapping("/user/findUserId.do")
	public String findUserId() {
		return "user/findUserId";
	}
	
	//비밀번호 찾기 화면 전환용
	@RequestMapping("/user/findUserPw.do")
	public String findUserPw() {
		return "user/findUserPw";
	}
}
