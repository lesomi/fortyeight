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
	span#fontSize {
		margin-left: 5%; font-weight: normal; font-size: 12px;
	}
</style>

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
				<td style="width:300px">${b.nickName }</td>
				<td style="text-align:center;">${b.boardTitle }</td>
				<td style="text-align:right;width:300px">${b.boardDate }</td>
			</tr>
			<tr>
				<td style="height:300px" colspan="3">
				${b.boardContent }
				</td>
			</tr>
		</table>
	</div>
	
	<!-- 댓글 -->
	<div class="container">
		<div class="input-group mb-3">
			<input type="text" id="boardComm" class="form-control" placeholder="댓글 입력(50글자 제한)" maxlength="50">
			<!-- <span id="titleCounter">0 / 최대 50자</span> -->
			
			<div class="input-group-append">
				<c:if test='${loginUser != null}'>
					<button class="btn btn-dark" id="writeBtn" type="button">작성</button>
				</c:if>
				<c:if test='${loginUser == null}'>
					<button class="btn btn-dark" type="button" data-toggle="modal" data-target="#loginModal">로그인</button>
				</c:if>
			</div>
		</div>
		
		<br>
		
		<!-- 댓글 결과창 -->
		<table class="table" style="text-align: center;">
			<c:forEach var="bc" items="${bc}">
				<c:if test="${bc.commLevel eq 1}">
					<tr>
						<th colspan="4" style="text-align: left; background-color: rgb(241,241,241);">
							 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${bc.nickName}님
							<span id="fontSize">
								<fmt:formatDate value="${bc.commDate}" pattern="yyyy년 MM월 dd일, HH시 mm분"/> 등록
							</span>
							<input type="hidden" id="boardCommNo" value="${bc.boardCommNo}"/>
						</th>
					</tr>
					<tr>
						<td colspan="3" id="comment" style="text-align: left;">
							${bc.commContent}
						</td>
						<td style="width:100px">
							<div class="input-group-append" id="replyDiv">
								<c:if test='${loginUser != null}'>
									<!-- 나중에 구현할 답글버튼 -->
									<!-- <button class="btn btn-dark replyBtn" id="replyBtns" type="button" >답글</button> --> <!-- JQuery this -->
									<c:if test='${bc.userNo eq loginUser.userNo}'>
										<button class="btn btn-dark deleteBtn" type="button">삭제</button>
									</c:if>
								</c:if>
							</div>
						</td>
					</tr>
				</c:if>
			</c:forEach>
			<c:if test="${empty bc }">
				<tr>
					<td colspan="4" style="text-align:center">
						등록된 댓글이 없어요...
					</td>
				</tr>
			</c:if>
		</table>
	</div>
	
	
	<div id="page-container">
		${pageBar}
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

<script>
	$(function(){
		$("#writeBtn").click(function(){
			if($("#boardComm").val().trim().length==0){
				alert("댓글을 입력해주세요.");
			}else{
				$.ajax({
					url:"${path}/board/insertBoardComm.do",
					data:{commContent:$("#boardComm").val(),userNo:'${loginUser.userNo}',boardRef:'${b.boardNo}'},
					success:function(data){
						if(data){
							alert("댓글이 등록되었습니다.");
							location.reload();
						}else{
							alert("댓글 등록 실패");
							location.reload();
						}
					}
				});
			}
		});
		
		$(".deleteBtn").click(function(){
			$.ajax({
				url:"${path}/board/deleteBoardComm.do",
				data:{boardCommNo:$("#boardCommNo").val()},
				success:function(data){
					if(data){
						alert("댓글을 삭제했습니다.");
						location.reload();
					}else{
						alert("댓글 삭제 실패");
						location.reload();
					}
				}
			});
		});
	});
</script>