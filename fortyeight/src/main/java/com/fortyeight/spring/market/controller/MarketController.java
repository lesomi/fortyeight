package com.fortyeight.spring.market.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fortyeight.spring.common.PagingFactory;
import com.fortyeight.spring.market.model.service.MarketService;
import com.fortyeight.spring.market.model.vo.Market;
import com.fortyeight.spring.market.model.vo.MkImg;
import com.fortyeight.spring.user.controller.UserController;
import com.fortyeight.spring.user.model.vo.User;

@Controller
public class MarketController {
	// 마켓 테이블 관련 클래스
	
	@Autowired
	private MarketService service;
	@Autowired
	private Logger logger = LoggerFactory.getLogger(UserController.class);
	
	// [팝니다] 화면으로 전환
	// 카테고리, 제목, 정렬 등 검색도 포함
	@RequestMapping("/market/selMarket.do")
	public ModelAndView sellMarket(ModelAndView mv,
									@RequestParam Map<String, String> map,
									@RequestParam(required=false, defaultValue="1") int cPage,
									@RequestParam(required=false, defaultValue="6") int numPerPage) {
		
		// Print list
		List<Market> list = service.marketList(map, cPage, numPerPage);
		
		
		// paging
		int totalData = service.selectMarketCount(map);
		
		logger.debug("--------- [ 조회 결과 ] ----------"
					+"\n 1. market list : "+list
					+"\n 2. totalData : "+totalData
					+"\n------------------------------");
		// data 저장
		mv.addObject("list",list);
		// paging 저장
		mv.addObject("total",totalData);
		
		// category 분기처ㅣ
		mv.addObject("pageBar",PagingFactory.getPage(totalData, cPage, numPerPage, "/spring/market/selMarket.do?category=all"));
//		mv.addObject("realTime",RealTimeFactory.formatTimeString());
		
		mv.setViewName("market/marketSellList");
		return mv;
	}
	
	// [삽니다] 화면으로 전환
	@RequestMapping("/market/buyMarket.do")
	public String buyMarket() {
		return "market/marketBuyList";
	}
	
	// [삽니다/팝니다] 작성 버튼 눌렀을 때 글작성 화면으로 전황
	@RequestMapping("/market/writeBuySell.do")
	public String writeSell() {
		return "market/marketWrite";
	}
	
	// [삽니다/팝니다] 글 작성하기(insert)
	@RequestMapping("/market/writeBuySellEnd.do")
	public String writeBuySellEnd(Market mk, Model m, MultipartFile upFile, HttpSession session) {
		logger.debug("----- 마켓 글 작성 로직 진행 들어옴 -----");
		String path = session.getServletContext().getRealPath("/resources/upload/market"); // 저장경로
		
		// 파일을 담을 객체 생성(여러개일 수 있음)
		List<MkImg> files = new ArrayList();
		
		File f = new File(path);
		
		if(!f.exists()) { // 파일이 없으면 생성한다.
			f.mkdirs();
		}
		
		// 파일 저장 로직 : 파일 이름이 중복적으로 저장되면 안 되기 때문에 rename 처리가 필요하다.
		if(!upFile.isEmpty()) {
			// 파일명 생성
			String ori = upFile.getOriginalFilename();
			String ext = ori.substring(ori.lastIndexOf('.'));
			
			// 파일 이름 리네임
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rnd = (int)(Math.random()*1000);
			String rename = sdf.format(System.currentTimeMillis())+"_"+rnd+ext; // 새 이름 부여
			
			// 리네임 파일 저장
			try {
				upFile.transferTo(new File(path+"/"+rename)); // 파일을 실제로 저장
			}
			catch(IOException e) {
				e.printStackTrace();
			}
			
			// 담을 객체 생성
			MkImg imgName = new MkImg();
			imgName.setOriMkImg(ori);
			imgName.setRenameMkImg(rename);
			// mk.setOrimkFile(ori);
			// mk.setRenamemkFile(rename);
			
			files.add(imgName);
		}
		
		// ----
		
		// 세션 갖고오기
		User loginUser = (User)session.getAttribute("loginUser");
		
		// 가져온 값 확인하기
		System.out.println("--------------------------"
						   +"\n userNo : "+loginUser.getUserNo() 
						   +"\n type : "+mk.getMkType()
						   +"\n title : "+mk.getMkTitle()
						   +"\n dealAddr : "+loginUser.getDealAddr()
						   +"\n category : "+mk.getCategory()
						   +"\n price : "+mk.getMkPrice()
						   +"\n dealType : "+mk.getDealType()
						   +"\n content : "+mk.getMkContent()
						   +"\n oriFile : "+mk.getOrimkFile()
						   +"\n renameFile : "+mk.getRenamemkFile()
						   +"\n--------------------------");
		
		mk = new Market(0, loginUser.getUserNo(), mk.getMkTitle(), mk.getDealAddr(), mk.getCategory(), mk.getMkPrice(), mk.getMkType(), 
						mk.getDealType(), mk.getMkContent(), null, null, null);
		
		// DB에 값 저장
		int result = 0;
		try {
			result = service.insertMarket(mk, files);
		}
		catch(RuntimeException e) {
			e.printStackTrace();
			for(MkImg mm : files) {
				File delF = new File(path+"/"+mm.getRenameMkImg());
				if(delF.exists()) {
					delF.delete();
				}
			}
		}
		
		if(result>0 && mk.getMkType().equals("팝니다")) {
			// 데이터 저장완료
			m.addAttribute("msg","[팝니다] 마켓 글 등록이 완료되었습니다!");
			m.addAttribute("loc","/market/selMarket.do"); // 팝니다 화면
		}
		else if(result>0 && mk.getMkType().equals("삽니다")) {
			m.addAttribute("msg","[삽니다] 마켓 글 등록이 완료되었습니다!");
			m.addAttribute("loc","/market/buyMarket.do"); // 삽니다 화면
		}
		else {
			m.addAttribute("msg","----- [ERROR : 마켓 글 등록이 실패했습니다.] -----");
			m.addAttribute("loc","/market/writeBuySell.do");
		}
		return "common/msg";
	}
	
	@RequestMapping("/market/marketView.do")
	public String marketView(int mkNo,Model m) {
		Market mk=service.selectView(mkNo);
		m.addAttribute("mk",mk);
		
		return "market/marketView";
	}
}
