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
	h3 { text-align: center; margin-bottom: 80px; }
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
	#pwNow, #pwck, #pwNew { width: 420px; margin-left: 20%; }
	#pwNowMsg, #pwNewMsg, #pwchkMsg { visibility: hidden; }
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
					<form action="${path}/user/updatePasswordEnd.do?userNo=${loginUser.userNo}" method="post">
						<p id="pwdP">새로 변경할 <strong>${loginUser.nickName}</strong>님의 비밀번호를 입력하세요.</p>
						<br>
						<div class="form-group">
							<input type="password" class="form-control" id="pwNew" name="pwNew" placeholder="새 비밀번호 입력">
							<span id="pwNewMsg">pwd msg</span>
							<input type="password" class="form-control" id="pwck" name="pwck" placeholder="새 비밀번호 다시입력">
							<span id="pwchkMsg">pwd msg</span>
						</div>
						<button type="submit" class="btn btn-dark" id="changePwBtn" name="changePwBtn" disabled="disabled">비밀번호 변경</button>
					</form>
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
			if($("#newPwDiv").css("display") == "none") {
				$("#newPwDiv").show(500);
				$('#sessionPw').css('display', 'none');
			}
		});
		
		// 새 비밀번호 입력
		$('#pwNew').keyup(function () {
			const pw = $(this).val();
			if( pw.trim().length>7 || pw.indexOf(" ")>=0 ) {
				console.log("입력한 비밀번호 : "+pw);
				console.log('공백이 없고 비밀번호 길이가 8글자 이상입니다.');
				// 비밀번호 정규식 표현 : 최소 8 자, 대문자 하나 이상, 소문자 하나, 숫자 하나 및 특수 문자 하나 이상
				var pwReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}/;
				if(pwReg.test(pw)) {
					// 비밀번호가 정규식 표현과 일치할 때
					$("#pwNewMsg").css("visibility", "visible");
					$("#pwNewMsg").css("color", "green");
					$("#pwNewMsg").html('비밀번호 유효성 검사 완료');
				}
				else {
					// 비밀번호가 정규식 표현이 일치하지 않을 때
					$("#pwNewMsg").css("visibility", "visible");
					$("#pwNewMsg").css("color", "red");
					$("#pwNewMsg").html('공백제외/영문자(대소문자)/숫자/특수문자 1개 이상');
					return;
				}
			}
			else {
				// 공백이 있고, 길이가 8글자 미만이면...
				$("#pwNewMsg").css("visibility", "visible");
				$("#pwNewMsg").css("color", "red");
				$("#pwNewMsg").html('공백제외, 8글자 이상 작성필요');
				return;
			}
		});
		
		// 새 비밀번호와 일치하는지 비교
		$(function () {
			$('#pwck').keyup(function () {
				const pwchk =$(this).val();
				console.log("사용자가 입력한 비밀번호 확인 값 : "+pwchk);
				if(pwchk.trim().length>7 || pwchk.indexOf(" ")>0) {
					console.log('첫번째 if문에 들어옵니다');
					// 비밀번호 확인 글자가 8글자 이상이거나 공백이 없으면 [비밀번호]와 비교한다
					if(pwchk==$('#pwNew').val()) {
						// 일치하면...
						console.log('두 비밀번호가 일치합니다.');
						$('#changePwBtn').attr('disabled', false);
						$("#pwchkMsg").css("visibility", "visible");
						$("#pwchkMsg").css("color", "green");
						$("#pwchkMsg").html('비밀번호가 일치합니다.');
					}
					else {
						// 일치하지 않으면...	
						console.log('두 비밀번호가 일치하지 않습니다.');
						$("#pwchkMsg").css("visibility", "visible");
						$("#pwchkMsg").css("color", "red");
						$("#pwchkMsg").html('비밀번호가 일치하지 않습니다.');
						return;
					}
				}
				else {
					// 공백이 있고, 8글자 미만이면...
					console.log('첫번째 else문에 들어옵니다');
					$("#pwchkMsg").css("visibility", "visible");
					$("#pwchkMsg").css("color", "red");
					$("#pwchkMsg").html('공백제외, 8글자 이상 작성필요');
					return;
				}
			});
		});
	});
</script>

	<!-- footer 설정 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>