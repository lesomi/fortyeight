<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	
	<!-- header 설정 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp">
		<jsp:param value="Forty-Eight" name="title"/>
	</jsp:include>
	
	<!-- 토글 -->
    <link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>
	
	<style>
		/* [동네설정] css */
        article#firstArticle {
            /* 크기설정 */
            width: 100%;
            height: 250px;
            /* 배경색상 */
            background-color: rgb(251,195,50);
            /* 포지션 설정 */
            position: relative;
        }
        /* [동네설정] table */
        table#center {
            /* 위치설정 */
            margin: 0 auto;
            z-index: 0;
            position: relative;
            /* 뒤 폰트보다 우선순위 앞으로 */
            z-index: 2;
        }
        /* [동네설정] p 타이틀 css */
        p#nei_setting {
            /* 텍스트 위치 가운데로 정렬 */
            text-align-last: center;
            /* 폰트 설정 */
            font-weight: normal;
            font-size: 20px;
            /* 영역 설정 : 가운데로 떨어지게 !!!! */
            margin-top: 25%;
        }
        /* [동네설정] select태그 css */
        select#nei_select {
            /* 크기설정 */
            width: 250px;
            height: 50px;
            /* 배경 투명도 */
            background-color: rgba(255,255,255,0);
            /* select box 선 설정 */
            border-top: 0px;
            border-left: 0px;
            border-right: 0px;
            border-bottom: 2px solid rgb(66, 66, 66);
            /* 텍스트 위치 가운데로 정렬 */
            text-align-last: center;
            vertical-align: middle;
            /* 폰트 설정 */
            font-weight: normal;
            font-size: 20px;
            /* 파란 선 없애기 */
            outline: none;
            /* select 화살표 이미지 설정 */
            /* background: url("image/arrow.png") no-repeat 95% 50%; */
            /* 뒤 폰트보다 우선순위 앞으로 */
            z-index: 2;
        }
        /* [동네설정] select태그 안의 option태그 css */
        option.clickOption {
            /* 텍스트 위치 가운데로 정렬 */
            text-align-last: center;
            /* 배경설정 */
            background-color: rgba(251,195,50,0.65);
            /* 폰트 설정 */
            font-weight: normal;
            font-size: 20px;
        }

        /* 중고물품 사고팔자 멘트영역 설정 */
        div#fortyeight_div {
            margin-bottom: 50px;
        }
        /* 중고물품 사고팔자 멘트설정 */
        h1#fortyeight_h1 {
            /* 폰트 설정 */
            font-weight: 900;
            font-size: 100px;
            color: rgb(255, 212, 112);
            font-family: 'Jua', sans-serif;
            /* 텍스트 정렬 - 가운데로! */
            text-align: center;
            /* 포지션 설정 */
            position: absolute;
            /* 위치 설정 */
            margin-left: 26%;
            bottom: 0%;
            /* 배경화면처럼 폰트 영역을 맨 뒤로 보내버리기 */
            z-index: 1;
        }

        /* ----------------------------------------------------------------------------------- */
        /* 두번째 article */
        /* 버튼 영역 설정 */
        div#btnDiv {
            /* 위치 */
            margin-top: 50px;
        }
        /* 버튼 리스트 설정 */
        button.firstbtn, button.otherBtn {
            /* 크기 설정 */
            width: 200px;
            height: 50px;
            /* 버튼 색상 설정 */
            background-color: rgba(251,195,50,0);
            /* 폰트 설정 */
            color: rgb(66, 66, 66);
            /* 선 색상 없애기 */
            border: 0;
        }
        /* 버튼 위치 설정 */
        button.firstbtn {
            margin-left: 4%;
        }
        /* 버튼에 마우스를 올렸을 때 */
         button.firstbtn:hover, button.otherBtn:hover {
            color: rgb(66, 66, 66);
            background-color: #fcc029;
        }
        /* 버튼을 마우스로 클릭했을 때 */
         button.firstbtn:active, button.otherBtn:active {
            background-color: #fcc029;
        }
        
        
        /* [판매글작성] 버튼 설정 */
        button#selBtn {
        	width: 100px;
            height: 50px;
            font-weight: bolder;
        	background-color: #FCC029;
        	
        	/* 위치 설정 */
        	position: absolute;
        	right: 19%;
        	top: 102%;
        }
        /* [판매글작성] 버튼에 마우스를 올렸을 때 */
        button#selBtn:hover {
        	font-weight: bolder;
        	color: #FCC029;
        	background-color: rgb(66,66,66);
        	border: 1px rgb(66,66,66);
        }

        /* [필터 적용될 span 설정] */
        a.filterSpan {
        	color: rgb(60,60,60);
        	margin-right: 20px;
        }
        a.filterSpan:hover {
        	color: gray;
        	cursor: pointer;
        	text-decoration: none;
        }
        a#firstSpan {
        	margin-left: 22%;
        }


        /* 영역사이 hr 설정 */
        hr {
            margin-top: 50px;
            color: rgb(66, 66, 66);
        }


        /* 카테고리 타이틀 설정 */
        /* 타이틀 영역 설정 */
        div#categoryTitle {
            /* 위치 */
            margin-top: 50px;
            margin-bottom: 50px;
            text-align: center;
        }


        /* 검색창, select태그 영역 설정 */
        /* 검색창 아이콘 설정 */
        img#search {
            width: 20px;
            height: 20px;
        }
        /* 오른쪽으로 좀 집어넣자! */
        div#spanDiv {
            margin-left: 65px;
        }
        /* 검색창 아이콘에 마우스를 올렸을 때 */
        span#imgSearch:hover {
            cursor: pointer;
        }

        /* 정렬 filter 영역 설정 */
        

        /* 첫 줄의 bottom 영역 띄우기 */
        div#oneRow {
            margin-bottom: 50px;
        }

        /* 판매글 영역 설정 */
        div.selArticle {
            /* 아래로 띄움 */
            margin-bottom: 50px;
        }
        div.selArticle:hover {
        	cursor: pointer;
        }
        /* 카드 영역 배경색상 설정 */
        div.backColor {
            background-color:rgb(239, 239, 239);
        }
        /* 판매글 이미지 영역 설정 */
        div.marginDiv {
            /* 영역의 크기설정 */
            width: 250px;
            height: 250px;
        }
        /* 판매글 이미지 설정 */
        img#selArticle_img {
            /* 위, 왼쪽 띄움 */
            margin-top: 10%;
            margin-left: 10%;
            /* 선 둥글게 */
            border-radius: 7px;
            /* 크기설정 */
            width:200px;
            height: 200px;
        }

        /* 판매글 찜하기 영역 설정 */
        div#JimDiv {
            /* 영역 설정 - 오른쪽으로 치우쳐지게 */
            float: right;
            margin-top: 20px;
            margin-right: 30px;
            /* 폰트 설정 */
            font-size: 15px;
        }
        /* 찜하기 멘트 설정 */
        span#JimOnOff {
            margin-top: 5px;
            margin-right: 7px;
        }
        /* 판매글 제목 설정 */
        p#articleTitle {
            /* 위 영역 좀 띄우기 */
            margin-top: 70px;
            width: 220px;
            height: 30px;
            /* 폰트 설정 */
            font-weight: bolder;
            font-size: 20px;
            /* 글씨가 다음 줄로 내려가지 않게 선언 */
            white-space: nowrap;
            /* 글씨가 범위를 넘어가면 생략 */
            overflow: hidden;
            /* 범위를 넘어가면 줄임말 표시 */
            text-overflow: ellipsis;
        }
        /* 판매글 제목에 마우스를 올렸을 때 */
        p#articleTitle {
            cursor: pointer;
        }
        
        p#addr {
        	width: 180px;
        	
        	/* 글씨가 다음 줄로 내려가지 않게 선언 */
            white-space: nowrap;
            /* 글씨가 범위를 넘어가면 생략 */
            overflow: hidden;
            /* 범위를 넘어가면 줄임말 표시 */
            text-overflow: ellipsis;
        }
        
        /* 채팅 수 설정 */
        span#spanChatt {
            /* 오른쪽 띄움 */
            margin-right: 50px;
        }
        
        /* 분기처리에 따른 설정 */
        span#dealStatus {
        	margin-right: 50px;
        }
        
        
        /* ----- */
        /* 라디오박스 설정 */
        /* reset */
		* {
		  margin: 0;
		  padding: 0;
		}
		
		body {
		  padding: 20px;
		}
		
		/* temp grid */
		.widthDiv {
		  width: 20%;
		}
		
		.only-sr {
		  overflow: hidden !important;
		  position: absolute !important;
		  left: -9999px !important;
		  width: 1px;
		  height: 1px;
		}
		
		/* form | radio */
		.radio-items {
		  display: table;
		  width: 100%;
		  border-radius: 4px;
		  box-sizing: border-box;
		}
		.radio-items > div {
		  display: table-cell;
		  height: 49px;
		  line-height: 49px;
		  text-align: center;
		}
		.radio-items > div:first-child {
		  border-left: none;
		  width: auto !important;
		}
		.radio-items label {
			  font-weight: bolder;
			  display: block;
			  width: 100%;
			  height: 100%;
			  color: #454a60;
			  vertical-align: middle;
			  box-sizing: border-box;
			  cursor: pointer;
		}
		.radio-items input[type="radio"]:hover + label {
			border-radius: 20px;
		  	color: rgb(251,192,41);
		}
		.radio-items input[type="radio"]:checked + label {
			border-radius: 20px;
		  	background-color: rgb(60,60,60);
		  	color: #ffffff;
		}
		
		.ie8 .radio-items input[type="radio"].checked + label {
		  background-color: #454a60;
		  color: #fff;
		}
		
		
		/* [검색] 버튼 설정 */
		button#btnSearch {
			width: 200px;
		}
	</style>
<section>
	<div class="container" style="margin-top: 200px;">
		<!-- 첫번째 article -->
        <!-- 동네 설정과 배경화면 멘트 -->
        <!-- <article id="firstArticle">
            
            <h1>어드민이 등록한 이미지 3~4장이 슬라이드 처리됩니다.</h1>
            <h4>여기서는 범위지정한 값을 가져와서 뿌려져야 한다.</h4>
        </article> -->

        <!-- 두번째 article -->
        <article id="secondArticle">
        	
            <div id="btnDiv" class="container">
                <!-- <button class="btn btn-warning firstbtn btnValue" type="button" value="all">전체</button>
                <button class="btn btn-warning otherBtn btnValue" type="button" value="digital">디지털/가전</button>
                <button class="btn btn-warning otherBtn btnValue" type="button" value="interior">가구/인테리어</button>
                <button class="btn btn-warning otherBtn btnValue" type="button" value="child">유아용/유아도서</button>
                <button class="btn btn-warning otherBtn btnValue" type="button" value="life">생활/가공식품</button> 
                <br>
                <button class="btn btn-warning firstbtn otherBtn btnValue" type="button" value="woman">여성의류/잡화</button> 
                <button class="btn btn-warning otherBtn btnValue" type="button" value="beauty">뷰티/미용</button> 
                <button class="btn btn-warning otherBtn btnValue" type="button" value="man">남성의류/잡화</button> 
                <button class="btn btn-warning otherBtn btnValue" type="button" value="sport">스포츠/레저/게임</button> 
                <button class="btn btn-warning otherBtn btnValue" type="button" value="etc">기타</button> -->
                
                
            </div>
            <!-- --------- 판매글 노출 -------------- -->
            <div class="container">
            	<!-- 라디오박스 -->
                <div id="radioDiv">
				    <div class="radio-items">
				        <div class="widthDiv">
				            <input id="all" class="only-sr checked" type="radio" name="category" value="all">
				            <label for="all">전체</label>
				        </div>
				        <div class="widthDiv">
				            <input id="digital" class="only-sr" type="radio" name="category" value="digital">
				            <label for="digital">디지털/가전</label>
				        </div>
				        <div class="widthDiv">
				            <input id="child" class="only-sr" type="radio" name="category" value="child">
				            <label for="child">유아용/유아도서</label>
				        </div>
				        <div class="widthDiv">
				            <input id="interior" class="only-sr" type="radio" name="category" value="interior">
				            <label for="interior">가구/인테리어</label>
				        </div>
				        <div class="widthDiv">
				            <input id="life" class="only-sr" type="radio" name="category" value="life">
				            <label for="life">생활/가공식품</label>
				        </div>
				    </div>
				</div>
				<div>
				    <div class="radio-items">
				        <div class="widthDiv">
				            <input id="woman" class="only-sr" type="radio" name="category" value="woman">
				            <label for="woman">여성의류/잡화</label>
				        </div>
				        <div class="widthDiv">
				            <input id="beauty" class="only-sr" type="radio" name="category" value="beauty">
				            <label for="beauty">뷰티/미용</label>
				        </div>
				        <div class="widthDiv">
				            <input id="man" class="only-sr" type="radio" name="category" value="man">
				            <label for="man">남성의류/잡화</label>
				        </div>
				        <div class="widthDiv">
				            <input id="sport" class="only-sr" type="radio" name="category" value="sport">
				            <label for="sport">스포츠/레저/게임</label>
				        </div>
				        <div class="widthDiv">
				            <input id="etc" class="only-sr" type="radio" name="category" value="etc">
				            <label for="etc">기타</label>
				        </div>
				    </div>
				</div>
				
            	<hr>

	            <div id="categoryTitle">
	                <h2>삽니다</h2>
	                <c:if test="${loginUser!=null}">
		                <button type="button" class="btn btn-warning" id="selBtn" onclick="location.replace('${path}/market/writeBuySell.do');">작성</button>
		                <button type="button" class="btn btn-outline-light text-dark" id="selBtn" 
		                		style="width: 150px; margin-right: 115px; color: rgb(60,60,60); background-color: rgb(244,244,244);" 
		                		onclick="location.replace('${path}/user/updateUser.do?userNo=${loginUser.userNo}');">거래위치 수정</button>
	             	</c:if>
	            </div>
            
            	<!-- 첫번째 줄 -->
                   <div id="oneRow" class="row">
                        <!-- 검색창 -->
                        <div class="input-group col-4">
                            <div id="spanDiv" class="input-group-prepend">
                                <span id="imgSearch"class="input-group-text">
                                    <img id="search" src="${path}/resources/img/search.PNG" alt="search">
                                </span>
                            </div>
                            <input type="text" class="form-control" id="inputTitle" placeholder="제목 검색">
                        </div>
                        
                        <div class="col-4"></div>
                        
                        <!-- select -->
                        <div class="col-4" id="filterDiv">
                        	<!-- 최신순/인기순/가격순 -->
                        	<!-- <a href="javascript:void(0)" class="listSort filterSpan sort" id="firstSpan">최신순</a>
                        	<a href="javascript:void(0)" class="listSort filterSpan sort">인기순</a>
                        	<a href="javascript:void(0)" class="listSort filterSpan sort">가격순</a> -->
                        </div>
                    </div>

			<!-- form 결과 출력 -->
                    <!-- 두번째 줄 -->
                    <div class="row">
                    	<!-- 여기서부터 for문 필요 -->
                    	<c:if test='${not empty list}'>
                    	<c:forEach items="${list}" var="i">
                            <div class="selArticle col-6">
                                <!-- card 형식의 판매글 -->
                                <div class="backColor card" onclick="location.replace('${path}/market/marketView.do?mkNo='+${i.mkNo});">
                                    <div class="row">
                                        <div class="marginDiv col-6">
                                        	<!-- 사진은 불러오는 방법이 다름 -->
                                        	<c:if test='${not empty i.renameMkImg}'> 
                                            	<img id="selArticle_img" src="${path}/resources/upload/market/${i.renameMkImg}">
                                            </c:if>
                                            <c:if test='${empty i.renameMkImg}'>
                                            	<img id="selArticle_img" src="${path}/resources/img/noImage.png">
                                            </c:if>
                                        </div>
                                        <div class="col-6">
                                            <div id="JimDiv">
                                            	<!-- if문 필요 -->
                                            	<c:if test='${i.dealStatus eq "판매중"}'>
                                            		<span class="badge badge-success" id="dealStatus">구매중</span>
                                            	</c:if>
                                            	<c:if test='${i.dealStatus eq "예약중"}'>
                                            		<span class="badge badge-warning" id="dealStatus" style="color: white;">예약중</span>
                                            	</c:if>
                                            	<c:if test='${i.dealStatus eq "판매완료"}'>
                                            		<span class="badge badge-danger" style="margin-right: 45px;">구매완료</span>
                                            	</c:if>
                                            	<!-- if문 끝 -->
                                            	
                                            	<!-- 찜하기 스위치 삭제 -->
                                                <!-- <span id="JimOnOff">찜하기</span>
                                                <input type="checkbox" checked data-toggle="toggle" data-size="sm"> -->
                                            </div>
                                            <div id="selContent">
                                                <p id="articleTitle">${i.mkTitle}</p>
                                                <p id="addr">${i.dealAddr}<span></span></p>
                                                <p><fmt:formatNumber value="${i.mkPrice}"/>원</p>
                                            </div>
                                            <!-- 댓글 수 출력 -->
                                            <c:forEach items="${comm}" var="c">
	                                           	<c:if test='${i.mkNo eq c.mkNo}'>
	                                            	<span id="spanChatt">댓글 &nbsp;&nbsp; ${c.commCount}</span> 
	                                            </c:if>
                                            </c:forEach> 
                                            <span>찜하기 &nbsp;&nbsp; </span>
                                            	
                                            
                                        </div>
                                    </div>
                                    <!-- div.row -->
                                </div>
                            </div>
                        <!-- for문 끝 -->
                        </c:forEach>
                        </c:if>
                        <c:if test='${empty list}'>
                        	<p style="text-align: center;">검색 결과가 없습니다.</p>
                        </c:if>
                    </div>
            </div>
            <!-- 판매글 class.container /div -->
        </article>
	</div>
	
	<div id="page-container">
		${pageBar}
	</div>
	
	<div class="push"></div>
</section>

<script>
 
 /* 코드 주인 찾아요! 엄마를 잃어버렸어요! */
	/* function hasClass(target, className) {
	    if( (' ' + target.className + ' ').replace(/[\n\t]/g, ' ').indexOf(' ' + className + ' ') > -1 ) return true;
	    return false;
	}
	function removeClass(target, className){
	    var elClass = ' ' + target.className + ' ';
	    while(elClass.indexOf(' ' + className + ' ') !== -1){
	         elClass = elClass.replace(' ' + className + ' ', '');
	    }
	    target.className = elClass;
	}
	function addClass(target, className){
	    target.className += ' ' + className;   
	}
	
	if( hasClass( document.getElementsByTagName('html')[0], 'ie8' ) ) { // ie8 일 경우
	    var radios = document.querySelectorAll('input[type="radio"]'),
	        i,
	        len = radios.length;
	　
	    for( i = 0; i < len; i++ ) {
	        radios[i].attachEvent('onchange', function(e) {
	            var siblingsChecked = this.parentNode.parentNode.querySelector('.checked'); // 이전 checked 버튼
	            
	            removeClass(siblingsChecked, 'checked'); // checked 삭제
	            addClass(this, 'checked'); // checked 부여
	        });
	    }
	} */

/* -------------------------------------------------------[IF... category, title, sort click] ------------------------------------------------------------ */
	$(function () {
		// 첫 load 했을 때 고정
		$('#'+'${cateMap}').prop('checked', true);
		$('#inputTitle').attr('value','${inputTitle}');
		
		// 카테고리를 눌렀을 때
		$('input[name=category]').click(function () {
			//var category = $('input[name=category]').val();
			$(this).prop('checked', true);
			$('#all').prop('checked', false);
			location.replace('${path}/market/buyMarket.do?category='+$(this).val());
			//일단냅둠
			//location.replace('${path}/market/selMarket.do?category='+$('#'+'${cateMap}').val()+'&title='+$('#inputTitle').val());
		});
		
		// 검색아이콘을 눌렀을 때
		$('#search').click(function () {
			location.replace('${path}/market/buyMarket.do?category='+$('#'+'${cateMap}').val()+'&title='+$('#inputTitle').val());
		});
	});
</script>



	<!-- footer 설정 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>