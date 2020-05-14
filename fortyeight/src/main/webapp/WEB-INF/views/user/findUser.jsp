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
		<div class="d-flex justify-content-center">
			<button id="findId" class="btn btn-dark hdBtn">아이디 찾기</button>&nbsp;&nbsp;&nbsp;&nbsp;
			<button id="findPw" class="btn btn-dark hdBtn">비밀번호 찾기</button>
		</div>
		<div class="find-content"></div>
	<div class="push"></div>
	</div>
</section>

<!-- footer 설정 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<script>
	$(function(){
		$.ajax({
			url:"${path}/user/findUserId.do",
			dataType:"html",
			success:function(data){
				$(".find-content").html(data);
				$("#findId").css("color","#fcc029");
			}
		});
		
		$("#findId").click(function(){
			$.ajax({
				url:"${path}/user/findUserId.do",
				dataType:"html",
				success:function(data){
					$(".find-content").html(data);
					$("#findId").css("color","#fcc029");
					$("#findPw").css("color","white");
				}
			});
		});
		
		$("#findPw").click(function(){
			$.ajax({
				url:"${path}/user/findUserPw.do",
				dataType:"html",
				success:function(data){
					$(".find-content").html(data);
					$("#findId").css("color","white");
					$("#findPw").css("color","#fcc029");
				}
			});
		});
	});
</script>