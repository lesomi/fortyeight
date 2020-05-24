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
		<button type="button" class="btn btn-warning" onclick="location.replace('${path}/board/insertBoard.do');">작성</button>
		<table class="table">
			<tr>
				<td></td>
				<td>유형</td>
				<td>제목</td>
				<td>작성자</td>
				<td>등록일자</td>
			</tr>
			<c:if test="${not empty board }">
				<c:forEach items="${board }" var="b">
					<tr>
						<td>${b.boardNo }</td>
						<td>${b.boardType }</td>
						<td>${b.boardTitle }</td>
						<td>작성자 닉넴</td>
						<td>${b.boardDate }</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty board }">
				<tr style="height:190px;">
					<td colspan="4" style="text-align:center;">등록된 글이 없습니다.</td>
				</tr>
			</c:if>
		</table>
		<div>
			${pageBar }
		</div>
	</div>
	<div class="push"></div>
</section>

<!-- footer 설정 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>