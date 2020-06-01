package com.fortyeight.spring.common;

public class PagingFactory {
	
	
	public static String getPage(int totalData, int cPage, int numPerPage, String url) { // 외부에 의해 변경되는 매개변수들!
		
		String pageBar="";
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		int totalPage=(int)Math.ceil((double)totalData/numPerPage);
				
		
		pageBar+="<ul class='pagination "
				+ "justify-content-center pagination-sm'>";
		if(pageNo==1) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
			pageBar+="</li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#' tabindex='-1'>다음</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>다음</a>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";
		pageBar+="<script>";
		pageBar+="function fn_paging(cPage){";
		pageBar+="location.href='"+url+"?cPage='+cPage";
		pageBar+="}";
		pageBar+="</script>";
		
		
		return pageBar;
	}
	
	
	// 마켓 댓글 페이징처리
	public static String getMarketComment(int totalData, int cPage, int numPerPage, String url, int mkNo) { 
		
		String pageBar="";
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		int totalPage=(int)Math.ceil((double)totalData/numPerPage);
				
		
		pageBar+="<ul class='pagination "
				+ "justify-content-center pagination-sm'>";
		if(pageNo==1) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
			pageBar+="</li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#' tabindex='-1'>다음</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>다음</a>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";
		pageBar+="<script>";
		pageBar+="function fn_paging(cPage){";
		pageBar+="location.href='"+url+"?mkNo="+mkNo+"&cPage='+cPage";
		pageBar+="}";
		pageBar+="</script>";
		
		
		return pageBar;
	}
	
	// 마이페이지-찜목록 리스트 페이징
		public static String getPagingDipsList(int totalData, int cPage, int numPerPage, String url, int userNo, String mkType) { 
			
			String pageBar="";
			int pageBarSize=5;
			int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
			int pageEnd=pageNo+pageBarSize-1;
			int totalPage=(int)Math.ceil((double)totalData/numPerPage);
					
			
			pageBar+="<ul class='pagination "
					+ "justify-content-center pagination-sm'>";
			if(pageNo==1) {
				pageBar+="<li class='page-item disabled'>";
				pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
				pageBar+="</li>";
			}
			
			while(!(pageNo>pageEnd||pageNo>totalPage)) {
				if(cPage==pageNo) {
					pageBar+="<li class='page-item active'>";
					pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
					pageBar+="</li>";
				}else {
					pageBar+="<li class='page-item'>";
					pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
					pageBar+="</li>";
				}
				pageNo++;
			}
			
			if(pageNo>totalPage) {
				pageBar+="<li class='page-item disabled'>";
				pageBar+="<a class='page-link' href='#' tabindex='-1'>다음</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>다음</a>";
				pageBar+="</li>";
			}
			pageBar+="</ul>";
			pageBar+="<script>";
			pageBar+="function fn_paging(cPage){";
			pageBar+="location.href='"+url+"?userNo="+userNo+"&mkType="+mkType+"&cPage='+cPage";
			pageBar+="}";
			pageBar+="</script>";
			
			
			return pageBar;
		}
	
	
	// 마켓 댓글 페이징처리
		public static String getMyPageDealHistory(int totalData, int cPage, int numPerPage, String url, int userNo, String mkType, String dealStatus) { 
			
			String pageBar="";
			int pageBarSize=5;
			int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
			int pageEnd=pageNo+pageBarSize-1;
			int totalPage=(int)Math.ceil((double)totalData/numPerPage);
					
			
			pageBar+="<ul class='pagination "
					+ "justify-content-center pagination-sm'>";
			if(pageNo==1) {
				pageBar+="<li class='page-item disabled'>";
				pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
				pageBar+="</li>";
			}
			
			while(!(pageNo>pageEnd||pageNo>totalPage)) {
				if(cPage==pageNo) {
					pageBar+="<li class='page-item active'>";
					pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
					pageBar+="</li>";
				}else {
					pageBar+="<li class='page-item'>";
					pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
					pageBar+="</li>";
				}
				pageNo++;
			}
			
			if(pageNo>totalPage) {
				pageBar+="<li class='page-item disabled'>";
				pageBar+="<a class='page-link' href='#' tabindex='-1'>다음</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>다음</a>";
				pageBar+="</li>";
			}
			pageBar+="</ul>";
			pageBar+="<script>";
			pageBar+="function fn_paging(cPage){";
			pageBar+="location.href='"+url+"?userNo="+userNo+"&mkType="+mkType+"&dealStatus="+dealStatus+"&cPage='+cPage";
			pageBar+="}";
			pageBar+="</script>";
			
			
			return pageBar;
		}
		
		
		// 마켓 카테고리 페이징처리
		public static String getMarketCategoryPaging(int totalData, int cPage, int numPerPage, String url, String category) { 
			
			String pageBar="";
			int pageBarSize=5;
			int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
			int pageEnd=pageNo+pageBarSize-1;
			int totalPage=(int)Math.ceil((double)totalData/numPerPage);
					
			
			pageBar+="<ul class='pagination "
					+ "justify-content-center pagination-sm'>";
			if(pageNo==1) {
				pageBar+="<li class='page-item disabled'>";
				pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
				pageBar+="</li>";
			}
			
			while(!(pageNo>pageEnd||pageNo>totalPage)) {
				if(cPage==pageNo) {
					pageBar+="<li class='page-item active'>";
					pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
					pageBar+="</li>";
				}else {
					pageBar+="<li class='page-item'>";
					pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
					pageBar+="</li>";
				}
				pageNo++;
			}
			
			if(pageNo>totalPage) {
				pageBar+="<li class='page-item disabled'>";
				pageBar+="<a class='page-link' href='#' tabindex='-1'>다음</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>다음</a>";
				pageBar+="</li>";
			}
			pageBar+="</ul>";
			pageBar+="<script>";
			pageBar+="function fn_paging(cPage){";
			pageBar+="location.href='"+url+"?category="+category+"&cPage='+cPage";
			pageBar+="}";
			pageBar+="</script>";
			
			
			return pageBar;
		}
}
