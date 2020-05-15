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
		/* 타이틀 영역 설정 */
		div#sellTitle {
			/* 위치 */
            margin-top: 50px;
            margin-bottom: 50px;
		}
		/* 팝니다 타이틀 가운데로 */
		h2, h6 {
			text-align: center;
		}
		
		/* ---- */
		
		/* 선택 버튼 크기 설정 */
		button#selectBtn {
			width: 200px;
		}
		
		/* 테이블 영역 설정 */
		table#writeTB {
			margin: 0 auto;
			text-align: center;
		}
		
		/* 제목 안내글 설정 */
		p#titleMsg, p#dealAddrMsg {
			/* margin-top: 10px;
			margin-bottom: 10px; */
			text-align: center;
			font-size: 13px;
		}
		
		/* '여기' 설정 */
		strong {
			border-bottom: 1px solid #f2994a;
			font-weight: bolder;
			color: #f2994a;
		}
		strong:hover {
			cursor: pointer;
		}
		
		/* 내용 설정 */
		textarea {
			margin-left: 10%;
			resize: none;
			border-radius: 5px;
			padding: 5px;
		}
		/* 내용 글자수 체크하는 놈 설정 */
		span#counter {
			position: absolute;
			right: 16%;
			margin-top: 14%;
		}
	</style>
<section>
	<div class="container" style="margin-top: 200px;">
		<!-- 판매글 작성 : 형식은 회원가입과 비슷하게... -->
		
		<div id="sellTitle">
			<h2>팝니다</h2>
			<h6>(작성자 : <c:out value="${loginUser.getNickName}"/>님)</h6>
		</div>
		
		<div id="writeSellDiv">
			<form action="${path}/market/writeSellEnd.do" method="post" enctype="multipart/form-data">
				<table id="writeTB" class="table table-borderless">
					<tr>
						<td>거래활동</td>
						<td>
							<div class="form-group">
								<select class="form-control">
									<option value="" disabled selected>거래활동을 선택하세요</option>
									<option class="selectOption" value="buy">삽니다</option>
									<option class="selectOption" value="sell">팝니다</option>
								</select>
							</div>
						</td>
					</tr>
				
				
					<tr>
						<td>카테고리</td>
						<td>
							<div class="form-group">
								<select class="form-control">
									<option value="" disabled selected>카테고리를 선택하세요</option>
									<option class="selectOption" value="digital">디지털/가전</option>
									<option class="selectOption" value="interior">가구/인테리어</option>
									<option class="selectOption" value="child">유아용/유아도서</option>
									<option class="selectOption" value="life">생활/가공식품</option>
									<option class="selectOption" value="woman">여성의류/잡화</option>
									<option class="selectOption" value="beauty">뷰티/미용</option>
									<option class="selectOption" value="man">남성의류/잡화</option>
									<option class="selectOption" value="sport">스포츠/레저/게임</option>
									<option class="selectOption" value="etc">기타</option>
								</select>
							</div>
						</td>
					</tr>
					
					<tr>
						<td>제목</td>
						<td>
							<input type="text" class="form-control" id="title" placeholder="30글자 이내 작성"/>
						</td>
					</tr>
					<tr>
						<td colspan="2"><p id="titleMsg">제목 안내글 작성</p></td>
					</tr>
					
					<tr>
						<td>거래주소</td>
						<td>
							<input type="text" class="form-control" id="dealAddr" value="${loginUser.dealAddr}"/>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<p id="dealAddrMsg">거래주소를 변경하고 싶으신가요? <strong onclick="location.replace('');">여기</strong>를 눌러주세요.</p>
						</td>
					</tr>
					
					<tr>
						<td>거래방법</td>
						<td>
							<div class="form-group">
								<select class="form-control">
									<option value="" disabled selected>거래방법을 선택하세요</option>
									<option class="selectOption" value="buy">택배</option>
									<option class="selectOption" value="sell">직거래</option>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="height: 20px;"></td>
					</tr>
					
					<tr>
						<td colspan="2">
							<textarea rows="10" cols="130" placeholder="당신의 게시글을 어필하세요! 1000글자 내 작성이 필요합니다."></textarea>
							<span style="color:#aaa;" id="counter">(0 / 최대 1000자)</span>
						</td>
					</tr>
					
					
					
					
				</table>
			</form>
		</div>
	</div>
	<div class="push"></div>
</section>

<script>
	$(function () {
		
	});
</script>


	<!-- footer 설정 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>