package com.fortyeight.spring.common;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class JavaMailController {
	// 자바 메일 컨트롤러
	@Autowired
	private JavaMailSender mailSender;
	
	// mailSending 코드
	@RequestMapping(value="/user/insertMailSending.do")
	@ResponseBody
	public StringBuffer mailSending(HttpServletRequest request, String email) {
		
		// 인증 번호 생성기
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 10; i++) {
			int rIndex = rnd.nextInt(3);
			switch (rIndex) {
			case 0:
				// a-z
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
		System.out.println("인증번호 생성이 잘 되었는가?"+temp);
	
		String setfrom = "TFEight248@gmail.com"; // 이사팔 계정
//		String tomail = request.getParameter(email); // 받는 사람 이메일
		String title = "안녕하세요! 즐거운 거래, Forty-Eight입니다."; // 제목
		String content ="본인의 사용중인 이메일 인증을 위한 인증번호 키 입니다. →→→ "+temp; // 내용
	
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	
			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(email); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용
	
			mailSender.send(message);
		} 
		catch (Exception e) {
			e.printStackTrace();
			System.out.println("adf");
		}
		
		return temp;
	}
}
