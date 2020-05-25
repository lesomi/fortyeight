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
	<div class="container" style="margin-top: 200px;">
		<div>
			<button onclick="">삭제</button>
			<button>수정</button>
			<button onclick="history.back();">목록</button>
		</div>
		<table class="table">
			<tr style="background-color:rgb(241,241,241);">
				<td>${b.nickName }</td>
				<td style="text-align:center;">${b.boardTitle }</td>
				<td style="text-align:right;">${b.boardDate }</td>
			</tr>
			<tr>
				<td>
				${b.boardContent }
				</td>
			</tr>
		</table>
	</div>
	<div class="push"></div>
</section>

<!-- footer 설정 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>