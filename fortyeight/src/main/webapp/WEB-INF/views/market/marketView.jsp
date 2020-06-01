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
	button.replyDelete { width:50px; height: 30px; font-size: 12px; }
	
	#centerTr { text-align: center; }
	#slideImg { width: 200px; height: 200px; }
	#dealStatus { margin-left: 20px; }
</style>

<section>
	<div class="pl-5 pt-4" style="margin-top: 115px;height: 70px;background-color:rgb(241,241,241)">
		<span><strong>[ ${mk.mkType} > ${mk.category} ]</strong></span>
	</div>

	<div class="container"  style="margin-top: 50px;">
		<div style="width:500px;margin:0 auto;">
			<table class="table">
				<input type="hidden" id="mkWriter" value="${mk.userNo }">
				<tr id="centerTr">
					<!-- 이미지 슬라이드 -->
					<c:if test="${mviBuy.renameMkImg ne null }">
						<td colspan="4">
							<img id="slideImg" src="${path}/resources/upload/market/${mviBuy.renameMkImg}">
						</td>
					</c:if>
				</tr>
				
				<!-- 로그인이 아닐 때, 찜목록/드롭다운리스트 안 보이게 처리한다. -->
				<c:if test='${empty loginUser}'>
					<tr>
						<td colspan="4">				
							 ${mk.mkTitle}
						</td>
					</tr>
				</c:if>
				
				
				<!-- [삽니다 view 시작] -->
				<!-- 로그인일 때, 찜목록/드롭다운리스트 보이게 처리한다. -->
				<c:if test='${not empty loginUser && mk.mkType eq "삽니다"}'>
					<tr>
						<!-- 1.[구매중]일때(값은 판매중!) -->
						<c:if test='${mk.dealStatus eq "판매중"}'>
							<td colspan="2">				
								 ${mk.mkTitle} <span class="badge badge-success" id="dealStatus">구매중</span>
							</td>
							<td style="width:50px;" colspan="1">
								<!-- 찜목록 분기처리 -->
								<!-- 찜목록이 비었을 때 -->
								<c:if test="${empty dips}">
									<c:if test="${d.userNo ne loginUser.userNo && mk.userNo ne loginUser.userNo}">
										<button type="button" id="canDipsBtn" style="border:none;outline:none;">
											<img src="${path}/resources/img/blackStar.png" id="starDips" width="25px">
										</button>
									</c:if>
								</c:if>
								<!-- 찜목록이 안 비어져 있을 때 -->
								<c:forEach items="${dips}" var="d">
									<c:if test="${not empty dips}">
										<!-- 게시글과 로그인한 유저가 같을 때는 찜버튼이 보이지 않게 처리한다. -->
										<c:if test="${d.userNo ne loginUser.userNo && mk.userNo ne loginUser.userNo}">
											<button type="button" id="canDipsBtn" style="border:none;outline:none;">
												<img src="${path}/resources/img/blackStar.png" id="starDips" width="25px">
											</button>
										</c:if>
										<c:if test="${d.userNo eq loginUser.userNo}">
											<button type="button" id="canDipsBtn" style="border:none;outline:none;">
												<img src="${path}/resources/img/yellowStar.png" id="starDips" width="25px">
											</button>
										</c:if>
									</c:if>
								</c:forEach>
							</td>
							<!-- if문 분기처리. 마켓 글 작성자일 경우 수정할 수 있도록 처리하기 -->
							<c:if test="${loginUser.userNo eq mk.userNo}">
								<td style="width:50px;">
									<div class="dropdown">
										<button type="button" data-toggle="dropdown" style="border:none;outline:none;">
									    	<img src="${path }/resources/img/menubar.png" width="25px;">
									  	</button>
									  	<div class="dropdown-menu">
										    <a class="dropdown-item" href="${path}/market/updateMarket.do?userNo=${loginUser.userNo}&mkNo=${mk.mkNo}">마켓수정</a>
										    <a class="dropdown-item" href="#">마켓삭제</a>
										    <a class="dropdown-item" id="reservation" href="${path}/market/updateReservation.do?mkNo=${mk.mkNo}">예약중</a>
										    <a class="dropdown-item" id="buyComplete" href="${path}/market/updateComplete.do?mkNo=${mk.mkNo}">구매완료</a>
									  	</div>
									</div>
								</td>
							</c:if>
						</c:if>
						
						<!-- 2. 삽니다 이면서 [예약중]일때 -->
						<c:if test='${mk.dealStatus eq "예약중"}'>
							<td colspan="2">				
								 ${mk.mkTitle} <span class="badge badge-warning" id="dealStatus" style="color: white;">예약중</span>
							</td>
							<td style="width:50px;" colspan="1">
								<!-- 찜목록 분기처리 -->
								<!-- 찜목록이 비었을 때 -->
								<c:if test="${empty dips}">
									<c:if test="${d.userNo ne loginUser.userNo && mk.userNo ne loginUser.userNo}">
										<button type="button" id="canDipsBtn" style="border:none;outline:none;">
											<img src="${path}/resources/img/blackStar.png" id="starDips" width="25px">
										</button>
									</c:if>
								</c:if>
								<!-- 찜목록이 안 비어져 있을 때 -->
								<c:forEach items="${dips}" var="d">
									<c:if test="${not empty dips}">
										<!-- 게시글과 로그인한 유저가 같을 때는 찜버튼이 보이지 않게 처리한다. -->
										<c:if test="${d.userNo ne loginUser.userNo && mk.userNo ne loginUser.userNo}">
											<button type="button" id="canDipsBtn" style="border:none;outline:none;">
												<img src="${path}/resources/img/blackStar.png" id="starDips" width="25px">
											</button>
										</c:if>
										<c:if test="${d.userNo eq loginUser.userNo}">
											<button type="button" id="canDipsBtn" style="border:none;outline:none;">
												<img src="${path}/resources/img/yellowStar.png" id="starDips" width="25px">
											</button>
										</c:if>
									</c:if>
								</c:forEach>
							</td>
							<!-- if문 분기처리. 마켓 글 작성자일 경우 수정할 수 있도록 처리하기 -->
							<c:if test="${loginUser.userNo eq mk.userNo}">
								<td style="width:50px;">
									<div class="dropdown">
										<button type="button" data-toggle="dropdown" style="border:none;outline:none;">
									    	<img src="${path }/resources/img/menubar.png" width="25px;">
									  	</button>
									  	<div class="dropdown-menu">
										    <a class="dropdown-item" href="${path}/market/updateMarket.do?userNo=${loginUser.userNo}&mkNo=${mk.mkNo}">마켓수정</a>
										    <a class="dropdown-item" href="#">마켓삭제</a>
										    <a class="dropdown-item" id="buying" href="${path}/market/updateBuying.do?mkNo=${mk.mkNo}">구매중</a>
										    <a class="dropdown-item" id="buyComplete" href="${path}/market/updateComplete.do?mkNo=${mk.mkNo}">구매완료</a>
									  	</div>
									</div>
								</td>
							</c:if>
						</c:if>
						
						<!-- if문 분기처리   3. 삽니다 이면서 [구매완료]일때(값은 판매완료!) -->
						<c:if test='${mk.dealStatus eq "판매완료"}'>
							<td colspan="2">				
								 ${mk.mkTitle} <span class="badge badge-danger" id="dealStatus">구매완료</span>
							</td>
							<td style="width:50px;" colspan="1">
								
							</td>
							<td style="width:50px;">
								
							</td>
						</c:if>
					</tr>
				</c:if>
				<!-- [삽니다 view 끝] -->
				
				<!-- [팝니다 view 시작] -->
				<!-- 로그인일 때, 찜목록/드롭다운리스트 보이게 처리한다. -->
				<c:if test='${not empty loginUser && mk.mkType eq "팝니다"}'>
					<tr>
						<!-- 1.[판매중] 일 때 -->
						<c:if test='${mk.dealStatus eq "판매중"}'>
							<td colspan="2">				
								 ${mk.mkTitle} <span class="badge badge-success" id="dealStatus">판매중</span>
							</td>
							<td style="width:50px;" colspan="1">
								<!-- 찜목록 분기처리 -->
								<!-- 찜목록이 비었을 때 -->
								<c:if test="${empty dips}">
									<c:if test="${d.userNo ne loginUser.userNo && mk.userNo ne loginUser.userNo}">
										<button type="button" id="canDipsBtn" style="border:none;outline:none;">
											<img src="${path}/resources/img/blackStar.png" id="starDips" width="25px">
										</button>
									</c:if>
								</c:if>
								<!-- 찜목록이 안 비어져 있을 때 -->
								<c:forEach items="${dips}" var="d">
									<c:if test="${not empty dips}">
										<!-- 게시글과 로그인한 유저가 같을 때는 찜버튼이 보이지 않게 처리한다. -->
										<c:if test="${d.userNo ne loginUser.userNo && mk.userNo ne loginUser.userNo}">
											<button type="button" id="canDipsBtn" style="border:none;outline:none;">
												<img src="${path}/resources/img/blackStar.png" id="starDips" width="25px">
											</button>
										</c:if>
										<c:if test="${d.userNo eq loginUser.userNo}">
											<button type="button" id="canDipsBtn" style="border:none;outline:none;">
												<img src="${path}/resources/img/yellowStar.png" id="starDips" width="25px">
											</button>
										</c:if>
									</c:if>
								</c:forEach>
							</td>
							<!-- if문 분기처리. 마켓 글 작성자일 경우 수정할 수 있도록 처리하기 -->
							<c:if test="${loginUser.userNo eq mk.userNo}">
								<td style="width:50px;">
									<div class="dropdown">
										<button type="button" data-toggle="dropdown" style="border:none;outline:none;">
									    	<img src="${path }/resources/img/menubar.png" width="25px;">
									  	</button>
									  	<div class="dropdown-menu">
										    <a class="dropdown-item" href="${path}/market/updateMarket.do?userNo=${loginUser.userNo}&mkNo=${mk.mkNo}">마켓수정</a>
										    <a class="dropdown-item" href="#">마켓삭제</a>
										    <a class="dropdown-item" id="reservation" href="${path}/market/updateReservation.do?mkNo=${mk.mkNo}">예약중</a>
										    <a class="dropdown-item" id="buyComplete" href="${path}/market/updateComplete.do?mkNo=${mk.mkNo}">판매완료</a>
									  	</div>
									</div>
								</td>
							</c:if>
						</c:if>
						
						<!-- 2. 팝니다 이면서 [예약중]일때 -->
						<c:if test='${mk.dealStatus eq "예약중"}'>
							<td colspan="2">				
								 ${mk.mkTitle} <span class="badge badge-warning" id="dealStatus" style="color: white;">예약중</span>
							</td>
							<td style="width:50px;" colspan="1">
								<!-- 찜목록 분기처리 -->
								<!-- 찜목록이 비었을 때 -->
								<c:if test="${empty dips}">
									<c:if test="${d.userNo ne loginUser.userNo && mk.userNo ne loginUser.userNo}">
										<button type="button" id="canDipsBtn" style="border:none;outline:none;">
											<img src="${path}/resources/img/blackStar.png" id="starDips" width="25px">
										</button>
									</c:if>
								</c:if>
								<!-- 찜목록이 안 비어져 있을 때 -->
								<c:forEach items="${dips}" var="d">
									<c:if test="${not empty dips}">
										<!-- 게시글과 로그인한 유저가 같을 때는 찜버튼이 보이지 않게 처리한다. -->
										<c:if test="${d.userNo ne loginUser.userNo && mk.userNo ne loginUser.userNo}">
											<button type="button" id="canDipsBtn" style="border:none;outline:none;">
												<img src="${path}/resources/img/blackStar.png" id="starDips" width="25px">
											</button>
										</c:if>
										<c:if test="${d.userNo eq loginUser.userNo}">
											<button type="button" id="canDipsBtn">
												<img src="${path}/resources/img/yellowStar.png" id="starDips" width="25px">
											</button>
										</c:if>
									</c:if>
								</c:forEach>
							</td>
							<!-- if문 분기처리. 마켓 글 작성자일 경우 수정할 수 있도록 처리하기 -->
							<c:if test="${loginUser.userNo eq mk.userNo}">
								<td style="width:50px;">
									<div class="dropdown">
										<button type="button" data-toggle="dropdown" style="border:none;outline:none;">
									    	<img src="${path }/resources/img/menubar.png" width="25px;">
									  	</button>
									  	<div class="dropdown-menu">
										    <a class="dropdown-item" href="${path}/market/updateMarket.do?userNo=${loginUser.userNo}&mkNo=${mk.mkNo}">마켓수정</a>
										    <a class="dropdown-item" href="#">마켓삭제</a>
										    <a class="dropdown-item" id="buying" href="${path}/market/updateBuying.do?mkNo=${mk.mkNo}">판매중</a>
										    <a class="dropdown-item" id="buyComplete" href="${path}/market/updateComplete.do?mkNo=${mk.mkNo}">판매완료</a>
									  	</div>
									</div>
								</td>
							</c:if>
						</c:if>
						
						<!-- if문 분기처리   3. 삽니다 이면서 [구매완료]일때(값은 판매완료!) -->
						<c:if test='${mk.dealStatus eq "판매완료"}'>
							<td colspan="2">				
								 ${mk.mkTitle} <span class="badge badge-danger" id="dealStatus">판매완료</span>
							</td>
							<td style="width:50px;" colspan="1">
								<!-- 찜목록 분기처리 -->
								<%-- <c:if test="${empty dips}">
									<button type="button" id="canDipsBtn">
										<img src="${path}/resources/img/blackStar.png" id="starDips" width="25px">
									</button>
								</c:if>
								<c:if test="${not empty dips}">
									<button type="button" id="canDipsBtn">
										<img src="${path}/resources/img/yellowStar.png" id="starDips" width="25px">
									</button>
								</c:if> --%>
							</td>
							<td style="width:50px;">
								
							</td>
						</c:if>
					</tr>
				</c:if>
				<!-- [팝니다 view 끝] -->
				
				
				<tr>
					<c:if test="${loginUser ne null }">
						<td style="width:200px;">
							${nickName}님
						</td>
						<td colspan="3">
							<button class="btn btn-dark hdBtn" type="button" onclick="accessChatting('${loginUser.userNo}','${mk.userNo }');">채팅</button>
						</td>
					</c:if>
					<c:if test="${loginUser eq null }">
						<td colspan="4">
							${nickName}님
						</td>
					</c:if>
				</tr>
				<tr>
					<td style="width:200px;">
						<fmt:formatNumber value="${mk.mkPrice}"/>원
					</td>
					<td colspan="3">${mk.dealAddr}</td>
				</tr>
				<tr>
					<td colspan="4">
						${mk.mkContent }
					</td>
				</tr>
			</table>
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
				<c:if test="${i.commLevel eq 1}">
					<tr>
						<th colspan="4" style="text-align: left; background-color: rgb(241,241,241);">
							 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${i.nickName}님
							<span id="fontSize">
								<fmt:formatDate value="${i.commDate}" pattern="yyyy년 MM월 dd일, HH시 mm분"/> 등록
							</span>
							<input type="hidden" id="mkCommNo" value="${i.mkCommNo}"/>
							<input type="hidden" id="userId" value="${i.userId}"/>
						</th>
					</tr>
					<tr>
						<td colspan="3" id="comment">
							${i.commContent}
							
							<%-- <c:if test="${i.mkCommNo eq i.mkCommRef}"> --%>
								<div style="width: 100%; background-color: pink;">
									
								</div>
							<%-- </c:if> --%>
						</td>
						<td>
							<div class="input-group-append" id="replyDiv">
								<c:if test='${loginUser != null}'>
									<!-- 나중에 구현할 답글버튼 -->
									<!-- <button class="btn btn-dark replyBtn" id="replyBtns" type="button" >답글</button> --> <!-- JQuery this -->
									<c:if test='${i.userNo eq loginUser.userNo}'>
										<button class="btn btn-dark deleteBtn replyDelete" type="button" style="margin-left: -50px;" >삭제</button>
									</c:if>
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
				</c:if>
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
			console.log($(this).parents().next());
			$(this).parents().parents().parents().next().slideToggle();
		});
		
		
		// 댓글 등록
		$('#writeBtn').click(function () {
			if(${loginUser eq null})  {
				$(this).parents().parents().parents().next().slideToggle(); // 로그인하기
			}else {
				const comment = $('#mkTitle').val();
				console.log(comment);
				if(!comment) { // 들어오는 댓글이 빈칸이면?
					alert('빈 칸의 댓글은 등록할 수 없습니다.');
					$('#mkTitle').focus();
				}
				else {
					alert('댓글 등록 완료!');
					console.log('----- 마켓의 댓글 등록 로직이 실행됩니다. -----');
					console.log('현재 댓글 추가하는 userNo : ${loginUser.userNo}');
					
					$.ajax({
						url: "${path}/market/marketCommentInsert.do",
						type: 'POST',
						data: { 
							userNo : '${loginUser.userNo}',
							mkNo : '${mkNo}',
							comment : $('#mkTitle').val() 
						},
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
				}
			}
		});
		
		// 댓글 삭제
		$('.replyDelete').click(function () {
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
	
// -----------------------------------------------------[ 마켓뷰 찜 등록, 삭제 ajax 처리 ]--------------------------------------------------------------------
	$(function () {
		$('#canDipsBtn').click(function () {
			if($('#starDips').attr('src').includes('black')) {
				console.log("black이 들어가 있다. 찜목록에 추가가 된 상태가 아니다! -> "+$('#starDips').attr('src').includes('black'));
				$.ajax({
					url: "${path}/market/insertDips.do",
					data: {mkNo:'${mkNo}', userNo:'${loginUser.userNo}'},
					success: function(data) {
						if(data) {
							$('#starDips').attr('src','${path}/resources/img/yellowStar.png');
						}
						else {
							alert('찜목록 추가가 실패되었습니다. 관리자에게 문의하세요!');
						}
					}
				});
			}
			else {
				console.log("yellow가 들어가 있다. 찜목록에 추가가 된 상태다! -> "+$('#starDips').attr('src').includes('black'));
				$.ajax({
					url: "${path}/market/deleteDips.do",
					data: {mkNo:'${mkNo}', userNo:'${loginUser.userNo}'},
					success: function(data) {
						if(data) {
							$('#starDips').attr('src','${path}/resources/img/blackStar.png');
						}
						else {
							alert('찜목록 삭제가 실패되었습니다. 관리자에게 문의하세요!');
						}
					}
				});
			}
		});
		
	});

// -----------------------------------------------------[ 마켓뷰 거래상태 ajax 처리 ]--------------------------------------------------------------------
	/* $(function () {
		// 거래상태 [예약중]을 눌렀을 때
		$('#reservation').click(function () {
			$.ajax({
				url: "${path}/market/updateReservation.do",
				data: {mkNo:'${mkNo}'},
				success: function(data) {
					if(data) {
						console.log('거래상태 [예약중]으로 수정 완료!');
						// 클래스 변경
						$('#dealStatus').addClass("badge-warning");
						$('#dealStatus').removeClass("badge-success");
						// 뱃지 컬러 변경
						$('#dealStatus').html('예약중');
						// dropdown 내용 변경
						$('#reservation').html('구매중').css('cursor','pointer');
						$('#buyComplete').html('구매완료').css('cursor','pointer');
					}
					else {
						console.log('거래상태 수정이 실패');
						alert('거래상태 수정이 실패되었습니다. 관리자에게 문의하세요!');
					}
				}
			});
		});
	}); */
</script>