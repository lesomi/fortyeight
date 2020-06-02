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
	div.container {
		text-align: center;
	}
	#hand {
		width: 30px;
		height: 40px;
	}
	p {
		color: rgb(60, 60, 60);
	}
</style>

<section>
	<div class="container" style="margin-top: 200px;">
		<img src="${path}/resources/img/forty-eight.png">
		<h3><strong>잠깐!</strong> <img id="hand" src="${path}/resources/img/hand.png"></h3>
		<p>
			찾을 수 없는 페이지가 떴네요! <br>
			요청한 페이지가 사라졌거나 잘못된 경로랍니다!
		</p>
		<p></p> 
		<br><br><br>
		<button type="button" class="btn btn-dark" onclick="location.replace('${path}');">메인화면</button>
		<br><br>
	</div>
	<div class="push"></div>
</section>

	<!-- footer 설정 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>