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
		<form action="${path }/board/updateBoardEnd.do" method="post">
			<input type="hidden" name="boardNo" value="${b.boardNo }">
			<table>
				<tr>
					<td>
						<div class="form-group">
							<select  class="form-control" id="boardType" name="boardType">
								<option class="selectOption" value="${b.boardType }">${b.boardType }글</option>
							</select>
						</div>
					</td>
					<td>
						<input type="text" class="form-control" value="${loginUser.nickName }" readonly>
						<input type="hidden" name="userNo" value="${loginUser.userNo }">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="text" class="form-control" id="boardTitle" name="boardTitle" value="${b.boardTitle }">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea class="form-control" id="boardContent" name="boardContent" rows="10">${b.boardContent }</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit">등록</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="push"></div>
</section>

<!-- footer 설정 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>