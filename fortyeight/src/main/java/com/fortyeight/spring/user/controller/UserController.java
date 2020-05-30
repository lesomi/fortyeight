package com.fortyeight.spring.user.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fortyeight.spring.common.PagingFactory;
import com.fortyeight.spring.market.model.vo.Market;
import com.fortyeight.spring.user.model.service.UserService;
import com.fortyeight.spring.user.model.vo.User;
import com.fortyeight.spring.user.model.vo.UserDealHistory;
import com.fortyeight.spring.user.model.vo.UserDipsList;

@Controller
@SessionAttributes({ "loginUser" })
public class UserController {
	// 유저 테이블 관련 클래스

	@Autowired
	private UserService service;
	@Autowired
	private BCryptPasswordEncoder encoder; // 단방향 암호화
	@Autowired
	private Logger logger = LoggerFactory.getLogger(UserController.class);

	// 회원가입 화면 전환
	@RequestMapping("/user/agreeUser.do")
	public String agreeUser() {
		return "user/agreeUser";
	}

	// 로그인
	@RequestMapping("/user/login.do")
	public String login(String userId, String password, Model model) {
		User login = service.selectLogin(userId);

		String page = "";
		if ( login != null && encoder.matches(password, login.getPassword()) && login.getStatus().equals("N") ) {
			// 로그인 성공
			model.addAttribute("loginUser", login);
			page = "redirect:/";
		} else {
			// 로그인 실패
			model.addAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
			model.addAttribute("loc", "/");
			page = "common/msg";
		}

		return page;
	}

	// 로그아웃
	@RequestMapping("/user/logout.do")
	public String logout(SessionStatus status, HttpSession session) {
		if (!status.isComplete()) {// 세션이 만료되지 않았다면
			status.setComplete();// 로그아웃
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
		File f = new File(path);

		if (!f.exists()) { // 파일이 없으면 생성한다.
			f.mkdirs();
		}

		// 파일 저장 로직 : 파일 이름이 중복적으로 저장되면 안 되기 때문에 rename 처리가 필요하다.
		if (!upFile.isEmpty()) {
			// 파일명 생성
			String ori = upFile.getOriginalFilename();
			String ext = ori.substring(ori.lastIndexOf('.'));

			// 파일 이름 리네임
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rnd = (int) (Math.random() * 1000);
			String rename = sdf.format(System.currentTimeMillis()) + "_" + rnd + ext; // 새 이름 부여

			// 리네임 파일 저장
			try {
				upFile.transferTo(new File(path + "/" + rename)); // 파일을 실제로 저장
			} catch (IOException e) {
				e.printStackTrace();
			}
			u.setOriProfile(ori);
			u.setRenameProfile(rename);
		}
		// 비밀번호 암호화
		System.out.println("암호화 되기 전 비밀번호 : " + u.getPassword());
		u.setPassword(encoder.encode(u.getPassword())); // 단방향 암호화
//		String password = AESEncrypt.encrypt(u.getPassword()); // 양방향 암호화
		System.out.println("암호화된 비밀번호 : " + u.getPassword());
		
		/*
		 * // 전화번호 암호화 System.out.println("암호화 되기 전 전화번호 : "+u.getPhone());
		 * u.setPhone(encoder.encode(u.getPhone())); // 단방향 암호화 String phone =
		 * AESEncrypt.encrypt(u.getPhone()); // 양방향 암호화
		 * System.out.println("암호화된 전화번호 : "+phone);
		 */
		
//		u = new User(0, u.getUserId(), password, u.getNickName(), u.getEmail(), phone, u.getDealAddr(), null, null, 0,
//				u.getOriProfile(), u.getRenameProfile());

		System.out.println("form으로 넘어오는 값이 있는가? " + u);

		// DB에 값 저장
		int result = service.insertUser(u);
		logger.debug("회원가입이 성공했습니까? 0이면 false, 1이면 true " + result);

		// 페이지 분기처리
		String page = "";
		if (result > 0) {
			model.addAttribute("msg", "회원가입이 완료되었습니다!");
			model.addAttribute("loc", "/");
			page = "common/msg";
		} else {
			model.addAttribute("msg", "회원가입이 실패되었습니다. 다시 진행해주세요.");
			model.addAttribute("loc", "/user/insertUser.do"); // 회원가입 화면전환
			page = "common/msg";
		}
		return page;
	}

//	[회원가입] - 아이디 체크 ajax(첫번째 ajax 활용)
	@RequestMapping("/user/checkId.do")
	@ResponseBody
	public void checkId(String userId, ServletOutputStream out) {
//		DB에 접속해서 user 정보를 가져온다.
		User login = service.selectLogin(userId);
		System.out.println("가져온 user값이 있는가?" + login);

		/* id값 분기처리 */
		/* login이 null이 아니면? 아이디 사용 불가! */
		boolean flag = login != null ? false : true;

		try {
			out.print(flag);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

//	[회원가입] - 닉네임 체크 ajax(세번째 ajax 활용)
	@RequestMapping("/user/checkNick.do")
	@ResponseBody
	public boolean checkNick(String nickName) {
		User u = service.selectNick(nickName);
		boolean flag = u != null ? false : true;
		System.out.println("가져온 user의 닉네임 값이 있는가?" + flag);
		return flag;
	}

//	[회원가입] - 전화번호 체크 ajax(〃)
	@RequestMapping("/user/checkPhone.do")
	@ResponseBody
	public boolean checkPhone(String phone) {
		User u = service.selectPhone(phone);
		boolean flag = u != null ? false : true;
		System.out.println("가져온 user의 전화번호 값이 있는가?" + flag);
		return flag;
	}

	// [회원가입] -이메일 체크 ajax(〃)
	@RequestMapping("/user/checkEmail.do")
	@ResponseBody
	public Map<String, Object> checkEmail(String email) {
		User u = service.selectEmail(email);
		boolean flag = u != null ? false : true;
		System.out.println("email이 있나요?"+flag);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user", u);
		map.put("flag", flag);
		return map;
	}

	// 아이디/비밀번호 찾기 페이지 이동
	@RequestMapping("/user/find.do")
	public String find() {
		return "user/findUser";
	}

	// 아이디찾기 화면 전환용
	@RequestMapping("/user/findUserId.do")
	public String findUserId() {
		return "user/findUserId";
	}

	// 비밀번호 찾기 화면 전환용
	@RequestMapping("/user/findUserPw.do")
	public String findUserPw() {
		return "user/findUserPw";
	}

	// 비밀번호 찾기 아이디, 이메일 확인
	@RequestMapping("/user/findUserPwck.do")
	@ResponseBody
	public boolean findUserPwCk(String userId, String email) {
		Map<String, String> pwCk = new HashMap<String, String>();
		pwCk.put("userId", userId);
		pwCk.put("email", email);
		User u = service.selectPwCk(pwCk);
		boolean flag = u != null ? true : false;
		return flag;
	}

//	------------------------

	// 마이페이지 전환
	@RequestMapping("/user/mypage.do")
	public ModelAndView mypage(String userId, ModelAndView mv) {
		int buySu = service.buyHistory(userId); // 사용자 구매내역 
		mv.setViewName("user/mypage");
		return mv;
	}

	// 회원정보수정 전환
	@RequestMapping("/user/updateUser.do")
	public String userUpdate(int userNo) {
		return "user/updateUser";
	}
	
	// 마이페이지 - 회원정보수정(현재 비밀번호)
	@RequestMapping("/user/selectPassword.do")
	@ResponseBody
	public boolean selectPassword(String pwNow, HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser");
		System.out.println("세션을 가져오는가? "+loginUser);
		System.out.println("입력한 비밀번호 값도 가져오는가? "+pwNow);
		User u = service.selectLogin(loginUser.getUserId());
		// 입력한 비밀번호와 현재 비밀번호 비교
		boolean flag = encoder.matches(pwNow, u.getPassword());
		System.out.println("입력한 비밀번호와 현재 비밀번호의 비교 : "+flag);
		return flag;
	}
	
	// 마이페이지 - 회원정보 수정 버튼 누를때 update 처리
	@RequestMapping("/user/updateUserEnd.do")
	public String updateUser(@RequestParam String pwNew, @RequestParam String nickMyName,
							User u, Model model, MultipartFile upFile, HttpSession session) {
		logger.debug("----- 마이페이지 [회원정보수정] 로직 진행 들어옴 -----");
		String path = session.getServletContext().getRealPath("/resources/upload/user"); // 저장경로
		File f = new File(path);

		if (!f.exists()) { // 파일이 없으면 생성한다.
			f.mkdirs();
		}

		// 파일 저장 로직 : 파일 이름이 중복적으로 저장되면 안 되기 때문에 rename 처리가 필요하다.
		if (!upFile.isEmpty()) {
			// 파일명 생성
			String ori = upFile.getOriginalFilename();
			String ext = ori.substring(ori.lastIndexOf('.'));

			// 파일 이름 리네임
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rnd = (int) (Math.random() * 1000);
			String rename = sdf.format(System.currentTimeMillis()) + "_" + rnd + ext; // 새 이름 부여

			// 리네임 파일 저장
			try {
				upFile.transferTo(new File(path + "/" + rename)); // 파일을 실제로 저장
			} catch (IOException e) {
				e.printStackTrace();
			}
			u.setOriProfile(ori);
			u.setRenameProfile(rename);
		}
		
		u.setPassword(encoder.encode(pwNew)); // 비밀번호 암호화
		
		u = new User(u.getUserNo(), u.getUserId(), u.getPassword(), nickMyName, u.getEmail(), u.getPhone(), u.getDealAddr(), u.getEnrollDate(), u.getStatus(),
					u.getReportcount(), u.getOriProfile(), u.getRenameProfile());
		System.out.println("업데이트하려는 유저는? "+u);
		int result = service.updateUser(u);
		
		// 페이지 분기처리
		String page="";
		if (result > 0) {
			model.addAttribute("msg","회원정보수정이 완료되었습니다.");
			model.addAttribute("loc","/user/mypage.do");
			
			// 세션에 있는 값을 update한 값으로 변경하자
			String userId = u.getUserId();
			User user = service.selectLogin(userId); // 변경된 유저의 값을 가져온다.
			System.out.println("변경된 유저의 값은 ? : "+user);
			// 변경된 유저의 값을 불러와서 model에 담는다(세션값)
			model.addAttribute("loginUser", user);
			
			page = "common/msg";
		} else {
			model.addAttribute("msg","회원정보수정이 실패되었습니다. 다시 수정하세요.");
			model.addAttribute("loc","/user/updateUser.do");
			page = "common/msg";
		}
		return page;
	}
	
	// 마이페이지-비밀번호변경 화면으로 전환
	@RequestMapping("/user/updateUserPassword.do")
	public String updateUserPassword(int userNo) {
		return "user/updateUserPassword";
	}
	
	
	// 마이페이지 - 회원탈퇴 화면 전환
	@RequestMapping("/user/deleteUser.do")
	public String deleteUser(int userNo) {
		return "user/deleteUser";
	}
	
	// 마이페이지 - 회원탈퇴
	@RequestMapping("/user/deleteUserEnd.do")
	public String deleteUserEnd(int userNo, Model model, SessionStatus status) {
		System.out.println("회원탈퇴하는 유저 번호 : "+userNo);
		int result = service.deleteUser(userNo); // 진짜 삭제하는게 아니라, status값을 N->Y 으로 update할것.
		
		String page = "";
		if(result>0) {
			if (!status.isComplete()) {// 세션이 만료되지 않았다면
				status.setComplete();// 로그아웃
			}
			model.addAttribute("msg","회원탈퇴가 완료되었습니다. 다음에 또 만나요!");
			model.addAttribute("loc","/");
			page = "common/msg";
		}
		else {
			model.addAttribute("msg","회원탈퇴가 실패되었습니다. 다시 진행하세요.");
			model.addAttribute("loc","/user/deleteUser.do");
			page = "common/msg";
		}
		return page;
	}
	
	
	// 마이페이지 - 거래내역 화면 전환
	@RequestMapping("/user/selectDealHistory.do")
	public String selectDealHistory(int userNo, @RequestParam String dealStatus, @RequestParam String mkType, Model m,
									@RequestParam(required=false, defaultValue="1") int cPage,
									@RequestParam(required=false, defaultValue="5") int numPerPage) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userNo", userNo);
		map.put("dealStatus", dealStatus);
		map.put("mkType", mkType);
		// 거래내역 가져오기
		List<UserDealHistory> list  = service.selectDealHistory(map, cPage, numPerPage);
		System.out.println("거래내역을 가져오는가? : "+list);
		// 페이징처리
		int totalData = service.selectDealHistoryCount(map);
		
		m.addAttribute("history",list);
		m.addAttribute("total", totalData);
		m.addAttribute("dealStatus", dealStatus);
		m.addAttribute("mkType", mkType);
		m.addAttribute("pageBar", PagingFactory.getMyPageDealHistory(totalData, cPage, numPerPage, "/spring/user/selectDealHistory.do",
						userNo, mkType, dealStatus));
		
		return "user/selectDealHistory";
	}
	
	// 마이페이지 - 찜목록 화면 전환
	@RequestMapping("/user/selectDipsList.do")
	public String selectDipsList(int userNo, @RequestParam String mkType, Model m,
								@RequestParam(required=false, defaultValue="1") int cPage,
								@RequestParam(required=false, defaultValue="5") int numPerPage) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userNo", userNo);
		map.put("mkType", mkType);
		// 찜목록 가져오기
		List<UserDipsList> list  = service.selectDipsList(map, cPage, numPerPage);
		System.out.println("찜목록을 가져오는가? : "+list);
		// 페이징처리
		int totalData = service.selectDipsListCount(map);
		
		m.addAttribute("dipsList",list);
		m.addAttribute("total", totalData);
		m.addAttribute("mkType",mkType);
		m.addAttribute("pageBar", PagingFactory.getPagingDipsList(totalData, cPage, numPerPage, "/spring/user/selectDipsList.do", userNo, mkType));
		return "user/selectDipsList";
	}
}
