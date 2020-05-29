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
			<table style="width:700px;margin:0 auto">
				<tr>
					<td>
						<div class="form-group mt-3 pr-2">
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
						<input type="text" class="form-control mb-3" id="boardTitle" name="boardTitle" value="${b.boardTitle }" required>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea class="form-control mb-2" style="resize: none;" id="boardContent" name="boardContent" rows="10" required>${b.boardContent }</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;">
						<button type="button" class="btn btn-warning m-2" data-toggle="modal" data-target="#insertUpdateCancle">취소</button>
						<button type="submit" class="btn btn-warning m-2">등록</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="push"></div>
</section>

<!-- footer 설정 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<div class="modal fade" id="insertUpdateCancle" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-body" style="text-align: center;">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<div style="padding-top:30px;">
					<span>글 수정을 취소하시겠습니까?</span>
					<br>
					<span style="color:red;">취소시 복구가 불가능합니다.</span>
				</div>
			</div>
			<div class="d-flex justify-content-center pb-4">
				<button type="button" class="btn btn-dark hdBtn" data-dismiss="modal" aria-label="Close">취소</button>
				&nbsp;&nbsp;
				<button type="button" class="btn btn-dark hdBtn" onclick="location.replace('${path }/board/boardView.do?boardNo='+${b.boardNo })">확인</button>
			</div>
		</div>
	</div>
</div>