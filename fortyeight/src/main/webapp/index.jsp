<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	
	<!-- header 설정 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp">
		<jsp:param value="Forty-Eight" name="title"/>
	</jsp:include>
	
	
	<!-- index style -->
	<style>
		/* section 영역 설정 */
        .video_wrap {
            min-width : 100%;
	        min-height : 100%;
            position: fixed;
            top : 0px; 
            z-index: -100;
        }

        video {
            width: 100%;
            height: 100%;
            
        }

        /* 말풍선 이미지 설정 */
        img#bubble {
            width: 300px;
            height: 100px;
            /* 위치설정 */
            margin-left: 22px;
        }

		/* 컨텐츠 감싸는 div 설정 */
        div#contentDiv {
        	margin-top: 15%;
        	margin-left: 37%;
        }
        
        /* 이미지 48 설정 */
        img#box48 {
        	margin-left: 15%;
        	margin-top: 1%;
        }

        /* 컨텐츠 영역 */
        div#content {
            width: 480px;
            height: 250px;
            background-color: rgba(255, 255, 255, 0.55);
            border-radius: 20px;

            /* 위치설정 */
            position: relative;
            top: 25px;
            right: 7%; 
        }

        /* 버튼 크기 설정 */
        .inxBtn {
            width: 200px;
            height: 60px;
            font-size: large;
            border-radius: 10px;
            font-weight: bolder;
        }

        /* 버튼에 마우스를 올렸을 때 */
        .inxBtn:hover {
            color: #fcc029;
            font-weight: bolder;
        }

        /* 컨텐츠 영역 버튼 위치 설정 */
        button#firstBtn {
            margin-top: 10%;
            margin-left: 28%;
            margin-bottom: 5%;
        }

        button#secondBtn {
            margin-left: 28%;
        }
	</style>


<section>
	<div class="video_wrap">
		<div class="dim"></div>
		<video autoplay="autoplay" loop="loop" muted="muted" preload="preload">
			<source src="${path}/resources/video/index.mp4" type="video/mp4">
		</video>
	</div>

	<div id="contentDiv">
		<img id="bubble" src="${path}/resources/img/누군가에게필요.PNG"> <br>
		<img id="box48" src="${path}/resources/img/48box.PNG">
		<div id="content">
			<button type="button" id="firstBtn" class="btn btn-dark inxBtn" 
					onclick="location.replace('${path}/market/buyMarket.do?category=all');">사러가요</button>
			<br>
			<button type="button" id="secondBtn" class="btn btn-dark inxBtn" 
					onclick="location.replace('${path}/market/selMarket.do?category=all')">팔러가요</button>
		</div>
	</div>
</section>

<!-- footer 설정 -->
<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"/> --%>