<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	
	<!-- header 설정 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp">
		<jsp:param value="Forty-Eight" name="title"/>
	</jsp:include>

<style>
	div#blank1 { margin-bottom: 150px; }
	h3 { text-align: center; margin-bottom: 100px; }
	h3, #pwdP {cursor: default;}
	#content { text-align: center; }
	strong { color: rgb(251,191,42); }
	div#sessionPw { 
		width: 700px; height: 300px; 
		border: 1px solid rgb(231,231,231);
		border-radius: 25px;
		background-color: rgb(241, 241, 241); 
		margin: 0 auto; 
	}
	#pwdP { margin-top: 10%; }
	#pwdLabel { text-align: left; }
	#pwd { width: 420px; margin-left: 20%; }
	#pwdMsg { visibility: hidden; }
</style>

<section>
	<div id="wrapper">
		<!-- 좌측 사이드 메뉴 -->
		<jsp:include page="/WEB-INF/views/user/sideMenu.jsp">
			<jsp:param value="Forty-Eight" name="title" />
		</jsp:include>
		
		<!-- 우측 컨텐츠 영역 -->
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="blank1"></div>
            
            <div id="content">
            	<h3>비밀번호 변경</h3>

				<div id="sessionPw">
					<p id="pwdP">현재 <strong>${loginUser.nickName}</strong>님의 비밀번호를 입력하세요.</p>
					<br>
					<div class="form-group">
						<input type="password" class="form-control" id="pwd" name="pwd" placeholder="현재 비밀번호 입력">
						<span id="pwdMsg">pwd msg</span>
					</div>
					<button type="button" class="btn btn-dark" disabled="disabled">비밀번호 변경</button>
				</div>
				
			</div>
		</div>
		
	</div><!-- div.class = wrapper -->
	<div id="page-container">
		${pageBar}
	</div>
	<div class="push"></div>
</section>

<script>
	$(function () {
		
	});
</script>

	<!-- footer 설정 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>