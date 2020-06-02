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
	h3#deleteTitle, div#guidance { text-align: center; }
	div#guidance { border: 10px solid #e9ecef; width: 55%; margin: 0 auto; margin-top: 100px; padding: 30px; }
		#a { font-weight: bolder; }
		#b, #c, #d, #e { text-align: left; }
	strong { color: rgb(251,191,42); }
	#agreeLabel { margin-right: 30px; }
	#deleteBtn { width: 200px; height: 50px; margin-top: 50px; margin-left: 42%; }
	#deleteBtn:hover { color: rgb(251,191,42); }
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
			<h3 id="deleteTitle">회원 탈퇴</h3>
			<div id="guidance">
				<p id="a">- 회원탈퇴 안내글 -<p> 
				<hr>
				<p>안녕하세요! Forty-Eight입니다.</p>
				<p>다음은 <strong>회원탈퇴에 따른 안내내용</strong>입니다.</p>
				<br>
				<p id="b">- 탈퇴 시, ${loginUser.nickName}님이 등록한 아이디, 닉네임 등의 정보로 재가입이 불가합니다.</p> 
                <p id="c">- 탈퇴 후에도 서비스에 등록한 후기는 자동으로 삭제되지 않으며 그대로 남아있습니다.</p>
                <p id="d">- 삭제를 원하는 게시글이 있다면 반드시 탈퇴 전에 삭제를 요 청해주시기 바랍니다.</p>
               	<p id="e">- 탈퇴 후에는 회원 정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없으므로 <br>&nbsp;&nbsp;후기글을 임의로 삭제해 드릴 수 없습니다.</p>
               	<br>
               	<p>이 내용에 동의한다면 <strong>동의</strong>를 체크하세요.</p>

				<div class="form-check-inline">
					<label class="form-check-label" id="agreeLabel"> 
						<input type="radio" class="form-check-input" name="agree" id="agree"> 동의 
					</label>
					<label class="form-check-label"> 
						<input type="radio" class="form-check-input" name="disagree" id="disagree" checked> 비동의 
					</label>
				</div>
			</div>
			<button type="submit" id="deleteBtn" name="deleteBtn" class="btn btn-dark" disabled>회원탈퇴</button>
		</div>
	
	</div><!-- div.class = wrapper -->
	<div class="push"></div>
</section>

<script>
	$(function () {
		// 동의를 눌렀을 때 비동의 checked 표시 제거하기
		$('#agree').click(function () {
			$('#disagree').prop('checked', false);
			$('#deleteBtn').prop('disabled', false);
		});
		
		// 비동의를 눌렀을 때 동의 checked 표시 제거하기
		$('#disagree').click(function () {
			$('#agree').prop('checked', false);
			$('#deleteBtn').prop('disabled', true);
			$('#deleteBtn').css('color', 'white');
		});
		
		// [회원탈퇴] 버튼을 눌렀을 때
		$('#deleteBtn').click(function () {
			const result = confirm('정말로 회원탈퇴 하시려구요?ㅠㅠ'); 
			if(result) {
				location.replace('${path}/user/deleteUserEnd.do?userNo=${loginUser.userNo}');
			}
			else {
				alert('좋은 생각이에요! 우리 오래 봐요!');
				location.replace('${path}/user/mypage.do?userNo=${loginUser.userNo}');
			}
		});
	});
</script>

	<!-- footer 설정 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>