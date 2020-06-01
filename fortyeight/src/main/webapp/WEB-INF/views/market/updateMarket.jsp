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
		margin-bottom: 100px;
		text-align: center;
	}
	
	/* 제목 안내글 설정 */
	p#titleMsg, p#dealAddrMsg {
		/* margin-top: 10px;
		margin-bottom: 10px; */
		text-align: center;
		font-size: 13px;
	}
	
	/* 제목 글자수 설정 */
	span#titleCounter {
		position: absolute;
		right: 15%;
		top: 68%;
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
		right: 17%;
		margin-top: 14%;
	}
	
	/* 사진등록 div 설정 */
	div#fileDiv {
		width: 400px;
	} 
	/* 이미지 크기 */
	img#uploadImg {
		width: 200px;
		height: 200px;
	}
	
	/* 플러스, 마이너스 이미지 설정 */
	img#plus, img#plus2 {
		position: absolute; 
		right: -45%;
	}
	img#minus, img#minus2 {
		position: absolute; 
		right: -30%;
	}
	
	/* 플러스 이미지 눌렀을 때 */
	img#plus:hover, img#minus:hover,
	img#plus2:hover, img#minus2:hover {
		cursor: pointer;
	}
	
	
	/* --- */
	
	
	
	
	/* --- */
	
	/* 버튼의 위치 설정 */
	button#insert {
		margin-left: 34%;
		margin-right: 5%;
	}
	
	/* 버튼 설정 */
	button.enrollBtn {
		font-weight: bolder;
		width: 150px;
		height: 50px;
	}
	
	/* 버튼에 마우스를 올렸을 때  */
	button.enrollBtn:hover {
		color: rgb(251, 192, 41);
	}
</style>


<section>
	<div class="container" style="margin-top: 200px;">
		<!-- 판매글 작성 : 형식은 회원가입과 비슷하게... -->
		
		<div id="sellTitle">
			<h2>거래글 수정하자!</h2>
			<h6>(작성자 : <c:out value="${loginUser.nickName}"/>님)</h6>
		</div>
		
		<div id="writeSellDiv">
			<form action="${path}/market/여기아직안정했어.do" method="post" enctype="multipart/form-data" onsubmit="return checkSelect();">
				<table id="writeTB" class="table table-borderless">
					<tr>
						<td>거래활동</td>
						<td>
							<div class="form-group">
								<select class="form-control" name="mkType" id="mkType">
									<option value="${market.mkType}" disabled selected>${market.mkType}</option>
								</select>
							</div>
						</td>
					</tr>
				
					<tr>
						<td>카테고리</td>
						<td>
							<div class="form-group">
								<select class="form-control" name="category" id="category">
									<option value="${market.category}" disabled selected>
										<c:if test='${market.category eq "digital"}'>
											<c:out value="디지털/가전"/>
										</c:if>
										<c:if test='${market.category eq "interior"}'>
											<c:out value="가구/인테리어"/>
										</c:if>
										<c:if test='${market.category eq "child"}'>
											<c:out value="유아용/유아도서"/>
										</c:if>
										<c:if test='${market.category eq "life"}'>
											<c:out value="생활/가공식품"/>
										</c:if>
										<c:if test='${market.category eq "woman"}'>
											<c:out value="여성의류/잡화"/>
										</c:if>
										<c:if test='${market.category eq "beauty"}'>
											<c:out value="뷰티/미용"/>
										</c:if>
										<c:if test='${market.category eq "man"}'>
											<c:out value="남성의류/잡화"/>
										</c:if>
										<c:if test='${market.category eq "sport"}'>
											<c:out value="스포츠/레저/게임"/>
										</c:if>
										<c:if test='${market.category eq "etc"}'>
											<c:out value="기타"/>
										</c:if>
									</option>
									
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
							<input type="text" class="form-control" name="mkTitle" id="mkTitle" placeholder="30글자 이내 작성" maxlength="30" required
							value="${market.mkTitle}"/>
							<span></span>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<span style="color:#aaa;" id="titleCounter">(0 / 최대 30자)</span>
						</td>
					</tr>
					
					<tr>
						<td>거래주소</td>
						<td>
							<input type="text" class="form-control" id="dealAddr" name="dealAddr" value="${loginUser.dealAddr}" readonly="readonly"/>
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
								<select class="form-control" name="dealType" id="dealType">
									<option value="${market.dealType}" disabled selected>${market.dealType}</option>
									<c:if test='${market.dealType eq "택배"}'>
										<option class="selectOption" value="직거래">직거래</option>										
									</c:if>
									<c:if test='${market.dealType eq "직거래"}'>
										<option class="selectOption" value="택배">택배</option>							
									</c:if>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="height: 20px;"></td>
					</tr>
					
					<tr>
						<td>가격</td>
						<td>
							<input type="number" name="mkPrice" id="mkPrice" class="form-control" placeholder="입력 예 : 10000" value="${market.mkPrice}" required/>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="height: 20px;"></td>
					</tr>
					
					
					
					<tr>
						<td style="text-align: center;">사진등록</td>
					</tr>
					<tr>
						<td colspan="2" style="height: 20px;"></td>
					</tr>
					
					
					<!-- 여기가 여러개 추가될 것! -->
					<tr>
						<td colspan="2">
								<img id="uploadImg" src="${path}/resources/img/plusImg원본.png"/> <!-- width: 200px, height: 200px -->
								<div class="custom-file" id="fileDiv">
				                    <input type="file" class="custom-file-input" name="upFile" id="upFile" >
				                    <label class="custom-file-label" id="selectLabel" style="width: 400px; margin-left: 50px;" for="upFile">파일을 선택하세요</label>
				                    <%-- <img src="${path}/resources/img/plusIcon.png" id="plus"> --%>
				                    <img src="${path}/resources/img/minusIcon.png" id="minus">			                    
			                	</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="height: 20px;"></td>
					</tr>
					<!-- 여기까지 -->
					
					
					
					<!-- 글작성 내용 -->
					<tr>
						<td colspan="2">
							<textarea id="mkContent" name="mkContent" rows="10" cols="130" placeholder="당신의 게시글을 어필하세요! 1000글자 내 작성이 필요합니다." 
							maxlength="1000" required>
<c:out value="${market.mkContent}"/>
							</textarea>
							<span style="color:#aaa;" id="counter">(0 / 최대 1000자)</span>
						</td>
					</tr>
				</table>
				<button type="submit" id="insert" class="btn btn-dark enrollBtn">등록하자!</button>
				<button type="button" class="btn btn-dark enrollBtn" onclick="javascript:history.back();">뒤로가기</button>
			</form>
		</div>
	</div>
	
	<div class="push"></div>
</section>

<script>
/* ---------------------------------------------- [글자 수 카운트] ----------------------------------------------------- */
	// 제목 글자수 카운트
	$(function () {
		$('#mkTitle').keyup(function () {
			var title = $(this).val();
			$('#titleCounter').html("("+title.length+" / 최대 30자)"); // 제목 글자수 카운팅
			console.log('현재 제목 글자 수  :' +title.length);
			
			if(title.length == 30) {
				$("#mkTitle").focus();
				$('#titleCounter').css("color","red");
				$('#titleCounter').css("fontWeight","bolder");
			}
		});
	});
	// textarea 글자수 카운트
	$(function () {
		$('#mkContent').keyup(function () {
			var content = $(this).val();
			$('#counter').html("("+content.length+" / 최대 1000자)"); // 내용 글자수 카운팅
			console.log("현재 글자 수 : "+content.length);
			
			if(content.length == 1000) {
				$("#mkContent").focus();
				$('#counter').css({
					color: 'red',
					fontWeight: 'bolder'
				});
			}
		});
	});
</script>

	<!-- footer 설정 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>