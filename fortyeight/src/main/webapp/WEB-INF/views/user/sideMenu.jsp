<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<c:set var="path" value="${pageContext.request.contextPath}"/>

	<style>
		/* 상위 태그에 높이 지정 */
	    html,body{
	    	height: 100%;
	    }
	    /* 전체를 감싸는 div  높이, 넓이 설정*/
	    div#wrapper{
	    
	        width: 100%;
			height: 100%;
	        margin-top: 62px;
	    }
	    /* 사이드 바 */
	    .navbar-nav {
	        height: 100%;
	        width: 14rem !important;
	        /* 사이드 바 내 내용을 세로로 떨어지도록 설정 */
	        display: flex !important;
	        flex-direction: column;
	        padding-left: 0;
	        margin-bottom: 0;
	        list-style: none;
	    
	        /* box-shadow: 4px -15px 15px 0 rgba(0, 0, 0, 0.2); */
	    
	    }
	    /* bg-gradient-primary는 사이드 바 배경 이미지. */
	    .bg-gradient-primary {
	        
	        background-color: #fcc029;
	        background-image: linear-gradient(180deg, #fcc029 10%, #fbbc1d 100%);
	        background-size: cover;
	    }
	    /*  */
	    .sidebar .sidebar-brand {
	        height: 4.375rem;
	        text-decoration: none;
	        font-size: 1rem;
	        font-weight: 800;
	        padding: 1.5rem 1rem;
	        text-align: center;
	        text-transform: uppercase;
	        letter-spacing: 0.05rem;
	        /* z-index: 1; */
	    }
	    .sidebar-brand-icon i {
	        font-size: 2rem;
	    }
	    .sidebar-brand-icon>img{
	        width: 32px;
	        border-radius: 5px;
	        margin-right: 7px;
	        /* box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); */
	    }
	    .mx-3 {
	        margin-right: 1rem !important;
	    }
	    .sidebar-dark .sidebar-brand {
	        color: #fff;
	    }
	    hr.sidebar-divider {
	        margin: 0 1rem 1rem;
	        padding-bottom: 1rem;
	    }
	    img{
	        vertical-align: middle;
	    }
	
	    .nav-item .nav-link {
	        color: rgba(255, 255, 255, 0.8);
	        height: 4.375rem;
	        display: flex;
	        padding: 1rem;
	        align-items: center;
	        padding-left: 3rem;
	        font-size: 0.85rem;
	    }
	    .nav-link:hover {
	        color: rgba(0, 0, 0, 0.7);
	    }
	    i{
	        margin-right: 0.5rem;
	    }
	    .sidebar-heading {
	        color: #49463b;
	        text-align: left;
	        padding: 0 1rem;
	        font-weight: 800;
	        font-size: 0.65rem;
	        text-transform: uppercase;
	    }
	    .collapse-inner  {
	        margin: 0 1rem;
	        margin-bottom: 1.5rem;
	        position: relative;
	        left: 0;
	        z-index: 1;
	        top: 0;
	        padding: 1rem;
	        background-color: white;
	        width: 12rem !important;
	        border-radius:  0.2rem;
	        font-size: 0.85rem;
	        box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
	    }
	    .collapse {
	    
	        -webkit-animation-name: growIn;
	        animation-name: growIn;
	        -webkit-animation-duration: 200ms;
	        animation-duration: 200ms;
	        -webkit-animation-timing-function: transform cubic-bezier(0.18, 1.25, 0.4, 1), opacity cubic-bezier(0, 1, 0.4, 1);
	        animation-timing-function: transform cubic-bezier(0.18, 1.25, 0.4, 1), opacity cubic-bezier(0, 1, 0.4, 1);
	    }
	    .collapse-item{
	        padding: 0.5rem;
	        margin: 0 0.3rem;
	        display: block;
	        color: #3a3b45;
	        text-decoration: none;
	        border-radius: 0.35rem;
	        white-space: nowrap;
	    }
	    .collapse-item:hover {
	        text-decoration: none;
	        color: #3a3b45;
	        background-color: #eaecf4;
	    
	    }
	    .sidebar-brand-text{
	        color: black;
	        font-family: 'Work Sans', sans-serif;
	    }
	    #sidebar{
	        float:left;
	        height: 100%;
	        margin-top: 53px;
	    }
	    #content{
	        display: block;
	        float:left;
	    }
	    .topbar {
	    
	        position: relative;
	        display: flex;
	        width: 100%;
	        /* height: 4.375rem; */
	        height: 6rem;
	        box-shadow: 0 0.15rem 2rem 0 rgba(58, 59, 69, 0.15) !important;
	        background-color: #fff !important;
	        margin-bottom: 1.5rem !important;
	        /* display: flex; */
	        flex-wrap: wrap;
	        align-items: center;
	    }
	    #content-wrapper {
	        height: 100%;
	        display: flex;
	        overflow-x: hidden;
	    }
	    #content{
	        
	        width: 100%;
	        height: auto;
	
	    }
	    
	    div#userProfileDiv { width: 100%; height: 150px; }
		img#userProfile { width: 60px; height: 60px; border-radius: 50px; border: 2px solid white; margin-top: 18%; margin-left: 5%;}
		span#userId { position: relative; top: 10%; left: 7.5%; font-weight: bolder; font-size: 20px; }
		span#nickName { position: absolute; top: 28%; left: 6%; font-size: 12px; }
	</style>

	
	<!-- 좌측 사이드 메뉴 -->
    <div id="sidebar">
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
                    <div id="userProfileDiv">
                    	<img src="${path}/resources/upload/user/${loginUser.renameProfile}" id="userProfile"/>
                    	<span id="userId">${loginUser.userId}</span>
                    	<span id="nickName">${loginUser.nickName}님</span>
                    </div>

                    <hr class="sidebar-divider my-0">
                    

                    <!-- 첫번째 사이드메뉴 -->
                    <div class="sidebar-heading">
                         information
                    </div>

                    <li class="nav-item">
                        <a class="nav-link" href="index.html" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                        <i class="fas fa-smile-wink"></i>

                        <span>회원 정보 관리</span></a>

                        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                            <div class="collapse-inner rounded">
                            <a class="collapse-item" href="${path}/user/updateUser.do?userNo=${loginUser.userNo}">회원 정보 수정</a>
                            <a class="collapse-item" href="${path}/user/deleteUser.do?userNo=${loginUser.userNo}">회원 탈퇴</a>
                        </div>
                    </li>

                    <hr class="sidebar-divider my-0">


                    <!-- 두번째 사이드메뉴 -->
                    <div class="sidebar-heading">
                         chatting
                    </div>
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            <i class="fas fa-comments"></i>
                                <span>채팅 목록</span>
                        </a>
                        <div id="collapseOne" class="collapse" aria-labelledby="collapseOne" data-parent="#accordionSidebar">
                            <div class="collapse-inner rounded">
                                <a class="collapse-item" href="#">채팅목록</a>
                            </div>
                        </div>
                    </li>

                    <hr class="sidebar-divider my-0">


                    <!-- 세번째 사이드 메뉴 -->
                    <div class="sidebar-heading">
                         list
                    </div>
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
                            <i class="fas fa-list"></i>
                            <span onclick="location.replace('${path}/user/selectDealHistory.do?userNo=${loginUser.userNo}');">거래 내역 보기</span>
                        </a>
                        <!-- <div id="collapseThree" class="collapse" aria-labelledby="collapseThree" data-parent="#accordionSidebar">
                            <div class="collapse-inner rounded">
                                <a class="collapse-item" href="#">구매내역</a>
                                <a class="collapse-item" href="#">판매내역</a>
                                <a class="collapse-item" href="#">진행내역</a>
                            </div>
                        </div> -->
                    </li>

                    <hr class="sidebar-divider my-0">


                    <!-- 슬기 작업 -->
                    <!-- 네번째 사이드 메뉴 -->
                    <div class="sidebar-heading">Wish List</div>
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseFour" aria-expanded="true" aria-controls="collapseThree">
                            <i class="fas fa-list"></i>
                            <span onclick='location.replace("${path}/user/selectDipsList.do?userNo=${loginUser.userNo}&mkType=전체");'>찜목록</span>
                        </a>
                        <%-- <div id="collapseFour" class="collapse" aria-labelledby="collapseThree" data-parent="#accordionSidebar">
                            <div class="collapse-inner rounded">
                                <a class="collapse-item" href="${path}/user/selectDipsList.do?userNo=${loginUser.userNo}">찜목록</a>
                            </div>
                        </div> --%>
                    </li>

                    <hr class="sidebar-divider my-0">


                    <!-- 슬기 작업 -->
                    <!-- 다섯번째 사이드 메뉴 -->
                    <div class="sidebar-heading">Declaration</div>
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseFive" aria-expanded="true" aria-controls="collapseThree">
                            <i class="fas fa-list"></i>
                            <span>신고</span>
                        </a>
                        <div id="collapseFive" class="collapse" aria-labelledby="collapseThree" data-parent="#accordionSidebar">
                            <div class="collapse-inner rounded">
                                <a class="collapse-item" href="#">신고목록</a>
                                <a class="collapse-item" href="#">신고하기</a>
                            </div>
                        </div>
                    </li>
            </ul>
    </div>