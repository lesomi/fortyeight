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
		<div class="float-right m-4">
			<button type="button" class="btn btn-warning" onclick="location.replace('${path}/board/insertBoard.do');">작성</button>
		</div>
		<table class="table">
			<tr>
				<th></th>
				<th>유형</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일자</th>
			</tr>
			<c:if test="${not empty board }">
				<c:forEach items="${board }" var="b">
					<tr>
						<td>${b.boardNo }</td>
						<td>${b.boardType }</td>
						<td>
							<a href="${path }/board/boardView.do?boardNo=${b.boardNo }">${b.boardTitle }</a>
						</td>
						<td>${b.nickName }</td>
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