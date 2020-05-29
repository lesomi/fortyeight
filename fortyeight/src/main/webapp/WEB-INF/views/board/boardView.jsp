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
	<div class="container" style="margin-top: 150px;">
		<div class="float-right m-2">
			<c:if test="${loginUser.userNo eq b.userNo }">
				<button type="button" class="btn btn-warning m-2" data-toggle="modal" data-target="#boardDelModal">삭제</button>
				<button type="button" class="btn btn-warning m-2" id="updateBoard" onclick="location.replace('${path}/board/updateBoard.do?boardNo='+${b.boardNo})">수정</button>
			</c:if>
			<button class="btn btn-warning m-2" onclick="history.back();">목록</button>
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

<div class="modal fade" id="boardDelModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form action="${pageContext.request.contextPath}/board/deleteBoard.do?boardNo=${b.boardNo}" method="post">
				<div class="modal-body" style="text-align: center;">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<div style="padding-top:30px;">
						<span>[${b.boardTitle }]을 삭제하시겠습니까?</span>
						<br>
						<span style="color:red;">삭제시 복구가 불가능합니다.</span>
					</div>
				</div>
				<div class="d-flex justify-content-center pb-4">
					<button type="button" class="btn btn-dark hdBtn" data-dismiss="modal" aria-label="Close">취소</button>
					&nbsp;&nbsp;
					<button type="submit" class="btn btn-dark hdBtn">삭제</button>
				</div>
			</form>
		</div>
	</div>
</div>