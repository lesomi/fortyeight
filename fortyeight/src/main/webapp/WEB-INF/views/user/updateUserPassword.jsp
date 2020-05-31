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
	div#blank1 { margin-bottom: 150px; }
	h3 { text-align: center; margin-bottom: 100px; }
	h3, #pwdP {cursor: default;}
	#content { text-align: center; }
	strong { color: rgb(251,191,42); }
	div#sessionPw { 
		width: 700px; height: 300px; 
		border: 1px solid rgb(231,231,231);
		border-radius: 25px;
		background-color: rgb(241, 241, 241); 
		margin: 0 auto; 
	}
	#newPwDiv {
		
		display: none;
	
		width: 700px; height: 350px; 
		border: 1px solid rgb(231,231,231);
		border-radius: 25px;
		background-color: rgb(241, 241, 241); 
		margin: 0 auto; 
	}
	#pwdP { margin-top: 10%; }
	#pwdLabel { text-align: left; }
	#pwNow, #pwchk, #pwdNew { width: 420px; margin-left: 20%; }
	#pwNowMsg, #pwchk, #pwdNew { visibility: hidden; }
</style>

<section>
	<div id="wrapper">
		<!-- 좌측 사이드 메뉴 -->
		<jsp:include page="/WEB-INF/views/user/sideMenu.jsp">
			<jsp:param value="Forty-Eight" name="title" />
		</jsp:include>
		
		<!-- 우측 컨텐츠 영역 -->
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="blank1"></div>
            
            <div id="content">
            	<h3>비밀번호 변경</h3>

				<!-- 현재 비밀번호 입력창 -->
				<div id="sessionPw">
					<p id="pwdP">현재 <strong>${loginUser.nickName}</strong>님의 비밀번호를 입력하세요.</p>
					<br>
					<div class="form-group">
						<input type="password" class="form-control" id="pwNow" name="pwNow" placeholder="현재 비밀번호 입력">
						<span id="pwNowMsg">pwd msg</span>
					</div>
					<button type="button" class="btn btn-dark" id="pwNowBtn" disabled="disabled">비밀번호 변경</button>
				</div>
				
				<!-- 새 비밀번호 입력창 -->
				<div id="newPwDiv">
					<p id="pwdP">새로 변경할 <strong>${loginUser.nickName}</strong>님의 비밀번호를 입력하세요.</p>
					<br>
					<div class="form-group">
						<input type="password" class="form-control" id="pwdNew" name="pwdNew" placeholder="새 비밀번호 입력">
						<span id="pwdNewMsg">pwd msg</span>
						<input type="password" class="form-control" id="pwchk" name="pwchk" placeholder="새 비밀번호 다시입력">
						<span id="pwchkMsg">pwd msg</span>
					</div>
					<button type="button" class="btn btn-dark" disabled="disabled">비밀번호 변경</button>
				</div>
			</div>
		</div>
		
	</div><!-- div.class = wrapper -->
	<div id="page-container">
		${pageBar}
	</div>
	<div class="push"></div>
</section>

<script>
	$(function () {
		// 현재 비밀번호 입력 시
		$('#pwNow').keyup(function () {
			const pwNow = $('#pwNow').val();
			if(pwNow.length==0) {
				$('#pwNowBtn').attr('disabled', true);
			}
			else if(pwNow.length>0) {
				$.ajax({
					url: "${path}/user/selectPassword.do",
					data: {pwNow:pwNow},
					success:function(data){
						if(data) {
							$('#pwNowBtn').attr('disabled', false);
							$('#pwNowMsg').css('visibility', 'visible').css('color','green').css('fontWeight','bolder');
							$('#pwNowMsg').html('현재 비밀번호와 일치합니다.');
						}
						else {
							$('#pwNowBtn').attr('disabled', true);
							$('#pwNowMsg').css('visibility', 'visible').css('color','red').css('fontWeight','bolder');
							$('#pwNowMsg').html('현재 비밀번호와 일치하지 않습니다.');
						}
					}
				});
			}
		});
		
		// 비밀번호 변경 버튼을 눌렀을 때
		$('#pwNowBtn').click(function () {
			
		});
	});
</script>

	<!-- footer 설정 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>