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
	span#titleCounter { color:#aaa; position: absolute; right: 7%; top: -90%; }
	td#comment { height: 80px; text-align: left; padding-top: 3%; padding-bottom: 3%; }
	div#replyDiv { margin-top: 8%;  }
	button.replyBtn { margin: 0 auto; }
	span#fontSize { margin-left: 5%; font-weight: normal; font-size: 12px; }
	button#replyBtns { width:50px; height: 30px; font-size: 12px; }
	button#replyDelete { width:50px; height: 30px; font-size: 12px; }
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
	
	<br>
	<hr>
	<br>
	
	<!-- 댓글 -->
	<div class="container">
		<form action="${path}/market/marketComment.do" method="post">
			<div class="input-group mb-3">
				<input type="text" id="mkTitle" class="form-control" placeholder="댓글 입력(50글자 제한)" maxlength="50">
				<span id="titleCounter">0 / 최대 50자</span>
				
				<div class="input-group-append">
					<c:if test='${loginUser != null}'>
						<button class="btn btn-dark" id="writeBtn" type="button">작성</button>
					</c:if>
					<c:if test='${loginUser == null}'>
						<button class="btn btn-dark" id="writeBtn" type="button" data-toggle="modal" data-target="#loginModal">로그인</button>
					</c:if>
				</div>
			</div>
		</form>
		
		<br>
		
		<!-- 댓글 결과창 -->
		<table class="table" style="text-align: center;">
		
			<c:forEach var="i" items="${list}">
					<tr>
						<th colspan="4" style="text-align: left; background-color: rgb(241,241,241);">
							 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${i.nickName}님
							<span id="fontSize">
								<fmt:formatDate value="${i.commDate}" pattern="yyyy년 MM월 dd일, HH시 mm분"/> 등록
							</span>
							<input type="hidden" id="mkCommNo" value="${i.mkCommNo}"/>
						</th>
					</tr>
					<tr>
						<td colspan="3" id="comment">${i.commContent}</td>
						<td>
							<div class="input-group-append" id="replyDiv">
								<c:if test='${loginUser != null}'>
									<button class="btn btn-dark replyBtn" id="replyBtns" type="button" >답글</button> <!-- JQuery this -->
									<button class="btn btn-dark deleteBtn" id="replyDelete" type="button" style="margin-left: -50px;" >삭제</button>
								</c:if>
							</div>
						</td>
					</tr>
					<tr class="replyTr">
						<td colspan="4">
							<div class="input-group mb-3">
								<input type="text" class="form-control" placeholder="대댓글 입력(50글자 제한)" maxlength="50">
								<div class="input-group-append">
									<button class="btn btn-dark" type="button">작성</button>
								</div>
							</div>
						</td>
					</tr>
			</c:forEach>
		</table>
	</div>
	
	
	<div id="page-container">
		${pageBar}
	</div>
	<div class="push"></div>
</section>

<!-- footer 설정 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<script>
	function accessChatting(){
		open("${path}/chattingView.do","_blank","width=400,height=600");
	}
	
	// -----
	
	$(function () {
		// 댓글 글자수 카운트
		$('#mkTitle').keyup(function () {
			var title = $(this).val();
			$('#titleCounter').html("("+title.length+" / 최대 50자)"); // 제목 글자수 카운팅
			console.log('현재 제목 글자 수  :' +title.length);
			
			if(title.length == 50) {
				$("#mkTitle").focus();
				$('#titleCounter').css("color","red");
				$('#titleCounter').css("fontWeight","bolder");
			}
		});
		
		// 답글다는 영역을 안보이게 처리
		$('.replyTr').hide();
		// 답글달기 버튼을 눌렀을 때
		$('.replyBtn').click(function () {
			console.log('보여주자!');
			$(this).parents().parents().parents().next().slideToggle();
		});
		
		
		// 댓글 등록
		$('#writeBtn').click(function () {
			alert('댓글 등록 완료!');
			console.log('----- 마켓의 댓글 등록 로직이 실행됩니다. -----');
			$.ajax({
				url: "${path}/market/marketCommentInsert.do",
				type: 'POST',
				data { mkNo : '${mkNo}' },
				success: function(data) {
					console.log('success에 진입했습니다.');
					if(data) {
						console.log('-- 댓글등록 if문 진입 --');
						location.replace('${path}/market/marketView.do?mkNo=${mkNo}');
					}
					else {
						console.log('-- 댓글등록 else문 진입 --');
						console.log('댓글 등록이 실패되었습니다.');
					}
				}
			});
		});
		
		// 댓글 삭제
		$('#replyDelete').click(function () {
			const result = confirm('댓글을 삭제하시겠습니까?');
			console.log('result : '+result);
			console.log('mkNo : ${mkNo}');
			console.log($('#mkCommNo').val());
			if(result) {
				console.log('----- if문에 들어옴 -----');
				$.ajax({
					// 댓글의 번호를 보낸다 
					url: "${path}/market/marketCommentDelete.do",
					type: 'POST',
					data: { mkNo : '${mkNo}', mkCommNo : $('#mkCommNo').val() },
					success: function(data) {
						console.log('data 값을 확인해보자 : '+data);
						if(data) {
							location.replace('${path}/market/marketView.do?mkNo=${mkNo}');
						}
						else {
							alert('댓글 삭제가 실패되었습니다.');
						}
					}
				});
			}
		});
	});
</script>