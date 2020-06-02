<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
   
<!-- header 설정 -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Forty-Eight" name="title"/>
</jsp:include>

<section>
	<div id="wrapper">
           
	<!-- 좌측 사이드 메뉴 -->
	<jsp:include page="/WEB-INF/views/admin/adminSideMenu.jsp"/>
		
		<!-- 우측 컨텐츠 영역 -->
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
			</div>
		</div>
    </div>
</section>

<!-- footer 설정 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>