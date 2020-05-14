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
		/* 타이틀 div 영역 설정 */
		div#titleDiv {
			margin-bottom: 5%;
			border-bottom: 1px solid rgb(70,70,70);
		}
		
		/* 모두동의합니다 멘트 설정 */
		p#allCheckTitle {
			margin-left: 25%;
			margin-bottom: 50px;
			font-weight: bolder;
		}
		
		/* 모두 체크하는 체크버튼 설정 */
		input.check, input.allCheck {
			display: none; /* 일단 가림 */
		}
		
		/* 체크박스 이미지 설정 1 */
		input[type="checkbox"] + label span  {
		    display: inline-block;
		    width: 24px;
		    height: 24px;
		    vertical-align: middle;
		    background: url('${path}/resources/img/noCheck.png') left top no-repeat;
		    cursor: pointer;
		    background-size: cover;
		}
		
		/* 체크박스 이미지 설정 2 : 체크박스가 checked 되었을 때 이미지 변경 */
		input[type="checkbox"]:checked + label span {
			background:url('${path}/resources/img/yesCheck.PNG') top no-repeat;
     		background-size: cover;
		}
		
		label#label1 {
			margin-left: 165px;
		}
		
		textarea {
			resize: none;
			background-color: #f2f2f2;
		}
		
		textarea.widthText {
			/* textarea 길이 설정 */
			width: 600px;
			/* 위치 설정 */
			margin-left: 25%;
		}
		
		/* 글씨 굵기 설정 및 우측으로 이동 */
		span.bolder:first-child {
			font-weight: bolder;
			margin-left: 110px;
		}
		
		/* 글씨 굵기 설정 */
		span.bolder:nth-child(2) {
			font-weight: bolder;
		}
		
		span.bolder:nth-child(2) {
			color: rgb(252, 192, 41);
		}
		
		/* 간격 띄우기 */
		span#blankSpan1 {
			margin-left: 330px;
		}
		span#blankSpan2 {
			margin-left: 265px;
		}
		span#blankSpan3 {
			margin-left: 345px;
		}
		
		
		
		/* 버튼 설정 */
		button.btn {
			font-weight: bolder;
			width: 150px;
			height: 50px;
		}
		
		/* 버튼의 위치 설정 */
		button#agree {
			margin-left: 35%;
			margin-right: 5%;
		}
		
		/* 버튼에 마우스를 올렸을 때  */
		button.btn:hover {
			color: rgb(251, 192, 41);
		}
	</style>

<section>
	<div class="container" style="margin-top: 200px;">
		<div class="form-group" id="Terms_of_service">
		
			<!-- 전체 체크 -->
			<div id="titleDiv">
				<p id="allCheckTitle">
					이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택)에 모두 동의합니다. 
					<input type="checkbox" name="allCheck" id="allCheck" class="allCheck"/>  
					<label for="allCheck">
						<span></span>
					</label>
				</p>
			</div>

			<!-- 첫번째 체크 -->
			<label for="comment" id="label1"> 
				<span class="bolder">Forty-Eight이용약관 동의</span> 
				<span class="bolder">(필수)</span>
			</label>
			
			<input type="checkbox" name="firstCheck" id="firstCheck" class="check" />  
			<label for="firstCheck">
				<span id="blankSpan1"></span>
			</label>
			
			<textarea class="widthText" cols="5" rows="5" id="comment">
  [제 1조 거래 이용 약관]
     이 약관은 'Forty-Eight'(이하 '회사'라고 칭함)에서는 다음의 어느 하나에 해당하는 사고로 인해 이용자에게 손해가 발생한 경우에는 그 손해를 배상할 책임을 지지 않습니다.

  1. 접근매체의 위조나 변조로 발생한 사고
  2. 계약체결 또는 거래지시의 전자적 전송이나 처리 과정에서 발생한 사고
  3. 전자금융거래를 위한 전자적 장치 또는 정보통신망에 침입하여 거짓이나 그 밖의 부정한 방법으로 획득한 접근매체의 이용으로 발생한 사고
			</textarea>
		</div>
		
		<br>
		
		
		<!-- 두번째 체크 -->
		<div class="form-group" id="Terms_of_service">
			<label for="comment" id="label1">
				<span class="bolder">개인정보 수집 및 이용에 대한 안내</span> 
				<span class="bolder">(필수)</span>
			</label>
			
			<input type="checkbox" name="secondCheck" id="secondCheck" class="check" />  
			<label for="secondCheck">
				<span id="blankSpan2"></span>
			</label>
			
			<textarea class="widthText" rows="5" id="comment">
  [제 2조 목적]
     이 약관은 회사가 제공하는 모든 서비스(이하 '서비스'라고 칭함)의 이용 및 절차에 관한 기본적인 사항에 대해 정의하는 것을 목적으로 합니다.

  [제 3조 약관의 효력 및 변경]
     이 약관은 서비스를 통하여 알리거나, 전자우편 등의 방법으로 회원에게 알림으로서 효력을 발생합니다.
     회사는 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제 1항과 같은 방법으로 알림으로서 효력을 발생합니다.
			</textarea>
		</div>
		
		<br>
		
		<!-- 세번째 체크 -->
		<div class="form-group" id="Terms_of_service">
			<label for="comment" id="label1">
				<span class="bolder">위치정보 이용약관 안내</span> 
				<span style="color: gray; font-weight: bolder;">(선택)</span>
			</label>
			
			<input type="checkbox" name="threeCheck" id="threeCheck" class="check" />  
			<label for="threeCheck">
				<span id="blankSpan3"></span>
			</label>
			
			<textarea class="widthText" rows="5" id="comment">
  [제 1조 목적]
     이 약관은 회사가 제공하는 위치기반서비스와 관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
			</textarea>
		</div>
		
		<br><br>
		
		<button type="button" id="agree" class="btn btn-dark">동의</button>
		<button type="button" class="btn btn-dark" onclick="javascript:history.back();">취소</button>
		


		<!-- footer 영역에 필요한 태그 -->
		<div class="push"></div>
	</div>
</section>



<script>
	/* 체크박스에 대한 스크립트 */
	
	/* 만약, allCheck가 checked가 되면, 전체의 checkbox가 checked 처리가 되라. */
	$(function(){
		$("#allCheck").click(function() {
			if($("#allCheck").is(":checked")) {
				$(".check").prop("checked",true);
			}else {
				$(".check").prop("checked",false);
			}
		});
	});
	
	/* [동의] 버튼을 눌렀을 때, 첫번째&두번째 checkbox가 눌러져야 하는 안내를 취하라. */
	$(function() {
		$("#agree").click(function() {
			console.log($("#secondCheck").is(":checked"));
			if( $("#secondCheck").is(":checked") == false || $("#firstCheck").is(":checked") == false ) {
				alert("필수 동의 확인이 필요합니다.");
			}
			else {
				/* checked 확인 끝나고 [동의] 버튼 누르면 다음 화면으로 넘어가는 로직 */
				location.replace('${path}/user/insertUser.do');
			}
		});
	});
	
</script>
























<!-- footer 설정 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>