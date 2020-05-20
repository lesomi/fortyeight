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
	*{
		border:1px solid green;
	}
</style>

<section>
	<div style="margin-top: 115px;height: 80px;background-color:lightgray">
		<span>팝니다 > ${mk.category}</span>
	</div>

	<div class="container"  style="margin-top: 50px;">
		<div>
			<!-- 이미지슬라이드 -->
		</div>
		<div>
			<div>
				<div>${mk.mkTitle}</div>
				<div>${mk.mkPrice}</div>
			</div>
			<div>
				<div>닉네임</div>
				<div>${mk.dealAddr }</div>
			</div>
			<button class="btn btn-dark hdBtn" type="button" onclick="accessChatting();">채팅</button>
		</div>
	</div>
	<div class="push"></div>
</section>

<!-- footer 설정 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<script>
	function accessChatting(){
		open("${path}/chattingView.do","_blank","width=400,height=600");
	}
</script>