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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fortyeight.spring.common.PagingFactory;
import com.fortyeight.spring.market.model.service.MarketService;
import com.fortyeight.spring.market.model.vo.Dips;
import com.fortyeight.spring.market.model.vo.Market;
import com.fortyeight.spring.market.model.vo.MarketViewImg;
import com.fortyeight.spring.market.model.vo.MkCommCount;
import com.fortyeight.spring.market.model.vo.MkComment;
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
		
		// 리스트 불러오기(마켓, 마켓이미지)
		List<Market> list = service.marketList(map, cPage, numPerPage);
		// paging
		int totalData = service.selectMarketCount(map);
		// 댓글 수 출력(팝니다)
		List<MkCommCount> comm = service.marketSellCommentCount();
		
		logger.debug("--------- [ 판매글 조회 결과 ] ----------"
					+"\n 1. market list : "+list
					+"\n 2. totalData : "+totalData
					+"\n------------------------------");
		logger.debug("--------- [ 구매글 댓글 수 조회 결과 ] ----------"
					+ "\n 1. commCount : "+comm);
		
		// data 저장
		mv.addObject("list",list);
		// paging 저장
		mv.addObject("total",totalData);
		// 댓글수 저장
		mv.addObject("comm", comm);
		// map 보내기
		mv.addObject("cateMap",map.get("category"));
		mv.addObject("inputTitle", map.get("title"));
		
		System.out.println("category : "+map.get("category"));
		
		// category 분기처리
		mv.addObject("pageBar",PagingFactory.getPage(totalData, cPage, numPerPage, "/spring/market/selMarket.do"));
//		mv.addObject("realTime",RealTimeFactory.formatTimeString());
		
		mv.setViewName("market/marketSellList");
		return mv;
	}
	
	// [삽니다] 화면으로 전환
	@RequestMapping("/market/buyMarket.do")
	public ModelAndView buyMarket(ModelAndView mv,
									@RequestParam Map<String, String> map,
									@RequestParam(required=false, defaultValue="1") int cPage,
									@RequestParam(required=false, defaultValue="6") int numPerPage) {
		// 리스트 불러오기(마켓, 마켓이미지)
		List<Market> list = service.marketBuyList(map, cPage, numPerPage);
		// paging
		int totalData = service.selectMarketBuyCount(map);
		// 댓글 수 출력(삽니다)
		List<MkCommCount> comm = service.marketCommentCount();
		
		logger.debug("--------- [ 구매글 조회 결과 ] ----------"
				+"\n 1. market list : "+list
				+"\n 2. totalData : "+totalData
				+"\n------------------------------");
		logger.debug("--------- [ 구매글 댓글 수 조회 결과 ] ----------"
				+ "\n 1. commCount : "+comm);
		
		// data 저장
		mv.addObject("list",list);
		// paging 저장
		mv.addObject("total",totalData);
		// 댓글수 저장
		mv.addObject("comm", comm);
		// map 보내기
		mv.addObject("cateMap",map.get("category"));
		mv.addObject("inputTitle", map.get("title"));
		System.out.println("category : "+map.get("category"));
		
		mv.addObject("pageBar",PagingFactory.getPage(totalData, cPage, numPerPage, "/spring/market/buyMarket.do"));
		
		mv.setViewName("market/marketBuyList");
		return mv;
	}
	
	
	// 마켓 글작성 화면으로 전황
	@RequestMapping("/market/writeBuySell.do")
	public String writeSell() {
		return "market/marketWrite";
	}
	
	// 마켓 글 작성하기(insert)
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
						mk.getDealType(), mk.getMkContent(), null, null, null, 0, null);
		
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
	// 마켓 상세화면과 댓글 리스트 출력 - select
	@RequestMapping("/market/marketView.do")
	public ModelAndView marketView(int mkNo,ModelAndView mv,
							@RequestParam(required=false, defaultValue="1") int cPage,
							@RequestParam(required=false, defaultValue="10") int numPerPage) {
		Market mk=service.selectView(mkNo); // 마켓리스트
		
		List<Dips> dips=service.selectDips(mkNo);
		
		// ---- ㅆ
		MarketViewImg mviBuy = service.selectMkViewImg(mkNo); // 마켓이미지 불러오기(삽니다)
		System.out.println("[삽니다]마켓이미지는 잘 가져오는가? "+mviBuy);
		
		String nickName = service.selectMkViewNick(mkNo); // 마켓뷰 작성자 '닉네임'만 불러오기
		System.out.println("해당 마켓뷰의 작성자 닉네임은? : "+nickName);
		
		List<MkComment> list = service.selectComment(mkNo, cPage, numPerPage); // 댓글리스트
		int totalData = service.selectCommentCount(mkNo); // 페이징처리
		
		mv.addObject("list",list);
		mv.addObject("total", totalData);
		mv.addObject("nickName", nickName); // 마켓뷰 작성자 '닉네임'만 담기
		mv.addObject("mviBuy", mviBuy); // 마켓뷰 이미지 담기
		mv.addObject("pageBar",PagingFactory.getMarketComment(totalData, cPage, numPerPage, "/spring/market/marketView.do", mkNo));
		
		// ---- ㅆ
				
		mv.addObject("mk",mk);
		mv.addObject("dips",dips);
		mv.addObject("mkNo", mkNo);
		
		mv.setViewName("market/marketView"); 
		return mv;
	}
	
	// 마켓 댓글 삭제 -delete
	@RequestMapping("/market/marketCommentDelete.do")
	@ResponseBody
	public boolean marketCommentDelete(@RequestParam Map<String, String> map) {
		logger.debug("----- [댓글 삭제 controller 진입!] -----");
		System.out.println("값을 가져왔는가? : "+map);
		System.out.println("--------------------------------");
		
		int result = service.marketCommentDelete(map);
		System.out.println("----- [댓글 삭제 결과] -----"
						 + "result : "+result
						 + "-----------------------");
		boolean flag = result!=0? true : false; // true : 삭제, false : 삭제안함
		System.out.println(""+flag);
		return flag;
	}
	
	// 마켓 댓글 등록 - insert
	@RequestMapping("/market/marketCommentInsert.do")
	@ResponseBody
	public boolean marketCommentInsert(@RequestParam Map<String, String> map) {
		logger.debug("----- [댓글 등록 controller 진입!] -----");
		System.out.println("값을 가져왔는가? : "+map);
		System.out.println("--------------------------------");
		int result = service.marketCommentInsert(map);
		System.out.println("----- [댓글 등록 결과] -----"
						 + "result : "+result
						 + "-----------------------");
		boolean flag = result!=0? true : false; // true : 등록, false : 등록안함
		return flag;
	}
}
